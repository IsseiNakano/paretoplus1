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
<<<<<<< HEAD
=======
    }
    return millis() - start ;
  }

  void reset() {
    for (PathVec vs : pareto) {
      vs.reset() ;
>>>>>>> 1890bff1fbb0adfe26556ab315fb3132ad386029
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
      int times = bellmanford() ;
      time = min(time, times) ;
      println(times) ;
    }
    println(leng()+","+time) ;
  }

<<<<<<< HEAD
=======
  void update() {
    int time = Integer.MAX_VALUE ; ;
    for(int i = 0 ; i < experimentNum ; i++) {
      time = min(time, bellmanford()) ;
      // println(time) ;
    }
    println(leng()+","+time) ;
  }

>>>>>>> 1890bff1fbb0adfe26556ab315fb3132ad386029
  int leng() {
    int count = 0 ;
    for(PathVec ps : pareto)
     count += ps.leng() ;
    return count ;
<<<<<<< HEAD
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

  int[][][] instanceTextF(int[] m) {
    int[][][] weight = new int[nodenum][nodenum][objective] ;
    for (int k = 0 ; k < m.length ; k++) {
      String[] lines = loadStrings(dirF + "cost" + m[k] + ".csv");
      for(int i = 0 ; i < nodenum ; i++){
        String[] values = split(lines[i], ",") ;
        for(int j = 0 ; j < nodenum ; j++) {
          weight[j][i][k] = int(values[j]) ;
        }
      }
    }
    return weight ;
=======
>>>>>>> 1890bff1fbb0adfe26556ab315fb3132ad386029
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
