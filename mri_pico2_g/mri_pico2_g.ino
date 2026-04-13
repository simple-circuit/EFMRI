//EFMRI controller code example by Simple-Circuit

//MIT License

//Copyright (c) 2026 Simple-Circuit

//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:

//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.
 
// The circuit connections:
//  freq coil+ to digital pin D16
//  freq coil- to digital pin D17
//  Signal Relay to digital pin D4
//  Polarization Relay to digital pin D5
//  Damping Resistor Relay to digital pin D6
//  Analog in A1 connected preamp out
//  PWM D15 connected to LP filter, amp, then phase coil
 
const int dacpin = 15; //pwm out for dac f=488281Hz for 8-bits
const int freqp = 18; //logic output for frequency coil positive current
const int freqn = 17; //logic output for frequency coil negative current
const int relay = 4; //logic output to switch relay to detector position
const int dampR = 5; //logic output to turn grounding FET on
const int polaR = 6; //extra logic output for second relay (not used)

// initialize variables
  volatile int dacset = 2048;  //zero phase current level for dac output(12-bit format) 
  volatile int ppulse = 3000; //polarization pulse time in ms
  volatile int rtime = 5; //relay switch over settling time ms
  volatile int bwait = 150; //gradient pulse on time ms
  volatile int grad = 0; //gradient current level
  volatile int ramp = 35; //post polarization pulse ramp down wait time
  volatile int rise = 125; //DAC rise time delay mid point ~ 125us
  volatile int c_count = 0;
  volatile char cmd_buf[10];   //buffer to hold serial command string
  volatile char c;
  volatile int cmd_val = 0;    //integer send from serial command
  volatile int i, j, k;
  volatile unsigned short v[16384]; //adc data array 
  volatile unsigned int vs; //adc data sum 
  volatile unsigned long tadc;
  volatile float sn;
  volatile float cs;
  volatile float w;
  
void setup1() {
  pinMode(relay, OUTPUT);    
  pinMode(polaR, OUTPUT);  
  pinMode(dampR, OUTPUT);
  pinMode(12, OUTPUT);    //timing test pin
  pinMode(dacpin,OUTPUT); 
  pinMode(23, OUTPUT);   //set high for PWM regulation 3.3V
  digitalWrite(23,1);  
  pinMode(freqp, OUTPUT_12MA);    
  pinMode(freqn, OUTPUT_12MA);  
  digitalWrite(freqp, LOW);
  digitalWrite(freqn, LOW);
  digitalWrite(relay, LOW);
  digitalWrite(polaR, LOW);
  digitalWrite(dampR, LOW);
  analogReadResolution(12);
  analogWriteFreq(488281);
  analogWriteResolution(8);
  analogWrite(dacpin,dacset>>4); //return DAC to midpoint
}
void setup() {
  Serial.begin(460800); 
}

void loop() {
}

//main control loop
void loop1() {

//This section scans the serial input string 
//The three letter command is saved in global variable
//cmd_buf[] as a null terminated string
 c_count = 0;
 while (c_count < 3) {
  while (Serial.available() <= 0); 
  c = Serial.read();
  Serial.write(c);
  cmd_buf[c_count] = c;
  c_count++;
  if ((c == 13) || (c == 10) || (c=='@')) c_count = 0;
 } 
 cmd_buf[3] = 0;
 cmd_val = 0;
 c_count = 0; 
 //This section extracts 4-digit integer from input string
 //The value is available in global variable cmd_val 
  while (c_count < 4){   
   while (Serial.available() == 0); 
   c = Serial.read();
   Serial.write(c);
   if ((c == 10)||(c == 13) || (c=='@')) break;
   if (c <= '9') cmd_val = cmd_val * 10 + int(c-'0');
   c_count++;
  } 
  if (c != '@') fndCmd();
}

//routine to search input string for measure command
//other 3-character commands with integer input can be added
//for additional functions
void fndCmd() {
  if ((cmd_buf[0] == 'M') && (cmd_buf[1] == 'E') && (cmd_buf[2] == 'A')){
    domea(0);
    return; }  
  if ((cmd_buf[0] == 'D') && (cmd_buf[1] == 'A') && (cmd_buf[2] == '0')){
    if (cmd_val > 4095) cmd_val = 4095;
    dacset = cmd_val;
    analogWrite(dacpin,dacset>>4);
    return; }  
  if ((cmd_buf[0] == 'D') && (cmd_buf[1] == 'A') && (cmd_buf[2] == '1')){
    if (cmd_val > 4095) cmd_val = 4095;
    analogWrite(dacpin,cmd_val>>4);
    return; }  
  if ((cmd_buf[0] == 'G') && (cmd_buf[1] == 'R') && (cmd_buf[2] == 'D')){
    grad = cmd_val;
    return; }  
  if ((cmd_buf[0] == 'P') && (cmd_buf[1] == 'P') && (cmd_buf[2] == 'L')){
    ppulse = cmd_val;
    return; }  
  if ((cmd_buf[0] == 'R') && (cmd_buf[1] == 'T') && (cmd_buf[2] == 'M')){
    rtime = cmd_val;
    return; }  
  if ((cmd_buf[0] == 'R') && (cmd_buf[1] == 'M') && (cmd_buf[2] == 'P')){
    ramp = cmd_val;
    return; }  
  if ((cmd_buf[0] == 'B') && (cmd_buf[1] == 'P') && (cmd_buf[2] == 'S')){
    bwait = cmd_val;
    return; }  
  if ((cmd_buf[0] == 'R') && (cmd_buf[1] == 'L') && (cmd_buf[2] == 'Y')){
    if (cmd_val = 100)  digitalWrite(relay, HIGH); else  digitalWrite(relay, LOW);
    return; }  
  if ((cmd_buf[0] == 'P') && (cmd_buf[1] == 'N') && (cmd_buf[2] == 'G')){
   cmd_val = cmd_val*4;
   w=0.7473;
   sn = 0.0;
   cs = 3.0;
   tadc = micros()+ 70;
   for (j=0; j<cmd_val; j++){ //read and save adc data at 14.3KHz rate
     analogWrite(dacpin,int(sn)+128);  //output to phase coil
     sn=sn+(cs*w);  //generate sine sweep
     cs=cs-(sn*w);
     w=w+3.2197e-5;
     gpio_put(12, HIGH);  
     v[j] = analogRead(A1);
     while (tadc >= micros());
     tadc = tadc + 70;    
     gpio_put(12, LOW); 
   }  
   for (j=0; j<cmd_val; j++){ //send adc data to serial port
    inttobytes(v[j]);
    if ((j%2048)==0) delay(500); //allow receiver to catch up
   } 
    Serial.write(129);  //mark end of data with char(129)
    Serial.write(13);
    Serial.write(10); 
    return; }  
  if ((cmd_buf[0] == 'N') && (cmd_buf[1] == 'O') && (cmd_buf[2] == 'I')){
    domea(-1);
    return; }      
  if ((cmd_buf[0] == 'T') && (cmd_buf[1] == 'S') && (cmd_buf[2] == 'T')){
     analogWrite(dacpin,grad>>4);      //set coil current
     delayMicroseconds(rise);
     gpio_put(freqn, HIGH); //make gradient logic pulse negative
     delay(bwait); //gradient pulse time
     analogWrite(dacpin,dacset>>4); //return coil to midpoint (zero current)
     delayMicroseconds(rise);
     gpio_put(freqn, LOW); //make gradient logic pulse negative
     gpio_put(freqp, HIGH); //make gradient logic pulse positive
     delay(bwait); //gradient pulse time
     gpio_put(freqp, LOW);
  }     
}  

//routine to convert integer to two bytes
void inttobytes(int iv) {
    char c[2];
    c[1] = (iv >> 6) & 0x3F;
    c[0] = (iv & 0x3F);   
    Serial.write(c[1]+32);
    Serial.write(c[0]+32);
} 

//EFMRI phase out and measure routine
void domea(int png) {
   cmd_val = cmd_val*4;
   analogWrite(dacpin,dacset>>4); //return DAC to set point
   digitalWrite(polaR, LOW);
   digitalWrite(dampR, LOW);
   digitalWrite(relay, LOW);
   if (png == 0){
    digitalWrite(relay, HIGH);
    delay(10);
    digitalWrite(dampR, HIGH);  //polarization voltage on
    delay(ppulse); //polarization time
    digitalWrite(dampR, LOW);  //polarization pulse FET off
    delay(ramp);  //wait for coil current to ramp down
    delay(1);
    digitalWrite(relay, LOW);
    delay(rtime); //relay settling delay
    if (bwait != 0){
     analogWrite(dacpin,grad>>4);      //set coil current
     delayMicroseconds(rise);
     digitalWrite(freqn, HIGH); //make gradient logic pulse negative
     delay(bwait); //gradient pulse time
     analogWrite(dacpin,dacset>>4); //return coil to midpoint (zero current)
     delayMicroseconds(rise);
     digitalWrite(freqn, LOW); //make gradient logic pulse negative
     digitalWrite(freqp, HIGH); //make gradient logic pulse positive
    }
   } else if (png>0){ //ping coil to measure resonance
     digitalWrite(relay, LOW);
     delay(rtime); //relay settling delay 
     digitalWrite(freqn, HIGH); //make gradient logic pulse negative
     delayMicroseconds(200);
     digitalWrite(freqn, LOW); //make gradient logic pulse zero
   }
   tadc = micros()+ 70;
   for (j=0; j<cmd_val; j++){ //read and save adc data at 14.3KHz rate
     gpio_put(12,0);
     v[j] = analogavg();
     while (tadc >= micros());
     tadc = tadc + 70;    
     gpio_put(12,1);    
   }  
   digitalWrite(freqp, LOW); //make gradient logic pulse zero
   digitalWrite(polaR, LOW);
   digitalWrite(relay, LOW);
   for (j=0; j<cmd_val; j++){ //send adc data to serial port
    inttobytes(v[j]);
    if ((j%2048)==0) delay(500); //pause for receiver to catch up
   } 
    Serial.write(129);  //mark end of data with char(129)
    Serial.write(13);
    Serial.write(10); 
} 

int analogavg(void){
  vs = analogRead(A1)+analogRead(A1)+analogRead(A1)+analogRead(A1)+analogRead(A1)+analogRead(A1);
  return(vs/6);
}
