int lastTime;
int thisTime;
float dt;

float deltaTime(){
  thisTime = millis() - lastTime;
  lastTime = lastTime+thisTime;
  dt = thisTime/1000.0/2;
  return dt;
}