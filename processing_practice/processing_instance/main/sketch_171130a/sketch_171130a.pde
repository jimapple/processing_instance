boolean jump;  //一个让块的分割线在蓝线和绿线之间来回切换的参数
boolean p1,p2,p3,p4;   //每个块内四个元胞的状态，p1代表左上，p2右上，p3左下，p4右下
Block quadCube;  //后面写了一个类叫做Block，主要内容就是块内四个元胞如何根据现有的状态更新状态
boolean[]status=new boolean[4];  //建个数组储存四个元胞状态
PFont yahei;  //声明字体

void setup(){
  size(400,300);
  background(2,22,10);
  frameRate(50);  //画布的帧率，通过这个参数可以控制坍塌的速度
  yahei=createFont("/Library/Fonts/Arial Unicode.ttf",160); 
//写这句之前你需要先在c盘font文件夹里找到雅黑字体并拖到当前代码窗口里
  textFont(yahei);  //使用字体
  fill(255);  //字体填充色
  text("呵呵",50,200);  //写字
}

void draw(){
  if(jump==false){  //false时使用绿线的方法分割，true时使用蓝线方法切割
  for(int i=0;i<width-1;i+=2){
    for(int j=0;j<height-1;j+=2){
      if(get(i,j)==color(255)){p1=true;}else{p1=false;}  //根据每个像素点的颜色求得其状态
      if(get(i+1,j)==color(255)){p2=true;}else{p2=false;}
      if(get(i,j+1)==color(255)){p3=true;}else{p3=false;}    
      if(get(i+1,j+1)==color(255)){p4=true;}else{p4=false;}
      quadCube=new Block(p1,p2,p3,p4);  //四个状态导入到类里运算
      status=quadCube.output();  //得到更新后的状态
     
      if(status[0]==true){set(i,j,color(255));}else{set(i,j,color(0));}  //根据状态给每个像素点上色
      if(status[1]==true){set(i+1,j,color(255));}else{set(i+1,j,color(0));}
      if(status[2]==true){set(i,j+1,color(255));}else{set(i,j+1,color(0));}
      if(status[3]==true){set(i+1,j+1,color(255));}else{set(i+1,j+1,color(0));}
    }
  }
  jump=true;  //切换下状态，下一帧里按照蓝线切割了
  }else{  
//按照蓝线切割

  for(int i=0;i<width-1;i+=2){
    for(int j=0;j<height-1;j+=2){
      if(get(i,j)==color(255)){p1=true;}else{p1=false;}
      if(get(i+1,j)==color(255)){p2=true;}else{p2=false;}
      if(get(i,j+1)==color(255)){p3=true;}else{p3=false;}    
      if(get(i+1,j+1)==color(255)){p4=true;}else{p4=false;}
      quadCube=new Block(p1,p2,p3,p4);
      status=quadCube.output();
     
      if(status[0]==true){set(i,j,color(255));}else{set(i,j,color(0));}
      if(status[1]==true){set(i+1,j,color(255));}else{set(i+1,j,color(0));}
      if(status[2]==true){set(i,j+1,color(255));}else{set(i,j+1,color(0));}
      if(status[3]==true){set(i+1,j+1,color(255));}else{set(i+1,j+1,color(0));}
    }
  }
jump=false; //切换回绿线
  }
}    

//下面是专门计算状态的类，看着挺长，实际上就是用if 和 else if对上面那个沙堆规则图进行了代码化表达
class Block {
  boolean s1, s2, s3, s4;
  float possibility=35f;  //这里的f是用来声明35是个浮点数而不是整数，有35的概率“阻塞”
  boolean result[]=new boolean[4];

  Block(boolean i1, boolean i2, boolean i3, boolean i4) {
    if (i1==false && i2==false && i3==false && i4==false) {
      s1=false;
      s2=false;
      s3=false;
      s4=false;
    }
    else if (i3==true && i4==true) {
      s1=i1;
      s2=i2;
      s3=i3;
      s4=i4;
    }
    else if (i1==true && i2==true && i3==false && i4==true) {
      s1=false;
      s2=true;
      s3=true;
      s4=true;
    }
    else if (i1==true && i2==true && i3==true && i4==false) {
      s1=true;
      s2=false;
      s3=true;
      s4=true;
    }
    else if (i1==true && i2==false && i3==true && i4==false) {
      s1=false;
      s2=false;
      s3=true;
      s4=true;
    }
    else if (i1==false && i2==true && i3==false && i4==true) {
      s1=false;
      s2=false;
      s3=true;
      s4=true;
    }
    else if (i1==true && i2==true && i3==false && i4==false) {
      float odd=random(100);
      if (odd<possibility){
        s1=true;
        s2=true;
        s3=false;
        s4=false;
      }
      else {
        s1=false;
        s2=false;
        s3=true;
        s4=true;
      }
    }
    else if (i1==true) {
      s1=false;
      s2=false;
      s3=true;
      s4=false;
    }
    else if (i2==true) {
      s1=false;
      s2=false;
      s3=false;
      s4=true;
    }
    else {
      s1=i1;
      s2=i2;
      s3=i3;
      s4=i4;
    }
  }

  boolean[] output() {  //这里返回数组的写法要多留心下，我写错了好多回
    boolean[]result= {
      s1, s2, s3, s4
    };
    return result; 
  }
}