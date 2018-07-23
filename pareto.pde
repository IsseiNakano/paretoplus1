class ParetoSolution {
  PathVec[] pareto ;
  int s ;
  int obj ;
  int ns ;

  ParetoSolution(int i, int nss, int[][][] weight, int objective) {
    s = i ;
    obj = objective ;
    ns = nss ;
    pareto = new PathVec[ns] ;
    for(int j = 0 ; j < ns ; j++)  pareto[j] = new PathVec(j, weight[j]) ;
    pareto[s].upd.add(new Vector(new Path(new int[obj]))) ;
    int start = millis() ;
    bellmanford() ;
    print("time = "+ (millis() - start) ) ;
    int count = 0 ;
    for(PathVec ps : pareto)
     count += ps.leng() ;
    println(" "+count) ;
  }

  void bellmanford() {
    boolean flag = true ;
    while(flag) {
      flag = false ;
      for(PathVec ps : pareto)
        for(PathVec pps : pareto)
          if(ps.index != pps.index)
          ps.paretoConstruction(pps) ;
      for(PathVec ps : pareto)
        ps.update() ;
      for(PathVec ps : pareto)
        if(!ps.upd.isEmpty()) {
          flag = true ;
          break ;
        }
    }
  }

  void show() {
    for(PathVec ps : pareto)
      ps.show() ;
  }

}
