String dir = "../../../../data/" ;
final int vertexNum = 500 ;
final int bound = 300 ;
final int objectiveNum = 3 ;

void setup() {
  int[] m = {0,1,2} ;
  singleInstanceExperiment(m) ;
  exit() ;
}

void fullExperiment() {

}

void singleInstanceExperiment(int[] m) {
  WeightInfo wi = new WeightInfo(dir, bound, m) ;
  int time = Integer.MAX_VALUE ; ;

  for (int i = 0 ; i < 10 ; i++) {
    time = min(time, wi.update()) ;
  }
  println(wi.size() + "," + time) ;
}
