class ParetoSolution {
  int[][][] weight ;
  PathVec[] pareto ;

  ParetoSolution(int[] m) {
    weight = instanceText(m) ;
    pareto = new PathVec[nodenum] ;
    for(int j = 0 ; j < nodenum ; j++)  pareto[j] = new PathVec(j, weight[j]) ;
  }

  int bellmanford() {
    reset() ;
    int start = millis() ;
    pareto[0].upd.add(new Vector(new int[objective])) ;
    boolean flag = true ;
    while(flag) {
      flag = false ;
      for(PathVec ps : pareto)
        for(PathVec pps : pareto)
          if(ps.index != pps.index)
          if(ps.paretoConstruction(pps)) flag = true ;
      for(PathVec ps : pareto)
        ps.update() ;
    }
    return millis() - start ;
  }

  void reset() {
    for (PathVec vs : pareto) {
      vs.reset() ;
    }
  }

  void update() {
    int time = Integer.MAX_VALUE ; ;
    for(int i = 0 ; i < experimentNum ; i++) {
      time = min(time, bellmanford()) ;
      // println(time) ;
    }
    println(leng()+","+time) ;
  }

  int leng() {
    int count = 0 ;
    for(PathVec ps : pareto)
     count += ps.leng() ;
    return count ;
  }

  int[][][] instanceText(int[] m) {
    int[][][] weight = new int[nodenum][nodenum][objective] ;
    for (int k = 0 ; k < m.length ; k++) {
      String[] lines = loadStrings(dir + "weight_" + nodenum + "_" + bound + "_" + m[k] + ".csv");
      for(int i = 0 ; i < nodenum ; i++){
        String[] values = split(lines[i], ",") ;
        for(int j = 0 ; j < nodenum ; j++) {
          weight[j][i][k] = int(values[j]) ;
        }
      }
    }
    return weight ;
  }
  
}
