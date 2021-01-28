

#include <SerialCommand.h>

int temp = 0;
int flush1 = 19;
int main1 = 18;
int relieve1 = 21;
int trigger1 = 12;
int trigger2 = 13;
int incoming = 0;


SerialCommand sCmd;     // The demo SerialCommand object

void setup() {
  Serial.begin(115200);
  pinMode(2,OUTPUT);
  pinMode(flush1,OUTPUT);
  pinMode(main1,OUTPUT);
  pinMode(relieve1,OUTPUT);
  pinMode(trigger1,OUTPUT);
  pinMode(trigger2,OUTPUT);
  
  sCmd.addCommand("f11",    flush1_on);
  sCmd.addCommand("f10",    flush1_off);
  sCmd.addCommand("m11",    main1_on);
  sCmd.addCommand("m10",    main1_off);
  sCmd.addCommand("r11",    relieve1_on);
  sCmd.addCommand("r10",    relieve1_off);
  sCmd.addCommand("p1",    prot1);
  
  
}

void loop() {
  //if (Serial.available() > 0) {
  //  // read the incoming byte:
  //  incoming = Serial.read();
  //  temp = incoming - '0';
  // Serial.println(temp==1);
  //  Serial.println(atoi(incoming));
  //  }// end if

  //if (temp == 1){
  //  temp=0;
  sCmd.readSerial();     // We don't do much, just process serial commands

}

//callbacks

void prot1(){
  Serial.println("protocol1");  
  digitalWrite(2,HIGH);
  digitalWrite(flush1,HIGH);
  digitalWrite(trigger1,HIGH);

  delay(5000);
  digitalWrite(2,LOW);
  digitalWrite(trigger2,HIGH);
  digitalWrite(main1, HIGH);
  digitalWrite(relieve1, HIGH);
  delay(1000);
  digitalWrite(trigger1,LOW);
  digitalWrite(trigger2,LOW);
  digitalWrite(flush1, LOW);
  digitalWrite(main1, LOW);
  digitalWrite(relieve1, LOW);
  }

void flush1_on(){
  Serial.println("flush1 on");  

  digitalWrite(flush1,HIGH);
  digitalWrite(trigger1,HIGH);
  
  }

void flush1_off(){
  Serial.println("flush1 off");  

  digitalWrite(flush1,LOW);
  digitalWrite(trigger1,LOW);
  }

 void main1_on(){
  Serial.println("main1 on");  

  digitalWrite(main1,HIGH);
  digitalWrite(trigger2,HIGH);
  }

 void main1_off(){
  Serial.println("main1 off");  
  digitalWrite(trigger2,LOW);

  digitalWrite(main1,LOW);
  }

 void relieve1_on(){
  Serial.println("relieve1 on");  

  digitalWrite(relieve1,HIGH);
  }
  
 void relieve1_off(){
  Serial.println("relieve1 off");  

  digitalWrite(relieve1,LOW);
  }
