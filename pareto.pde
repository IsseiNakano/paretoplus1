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
    pareto[s].upd.add(new Vector(new int[obj])) ;
    int start = millis() ;
    bellmanford() ;
    time = min(millis() - start, time) ;
    println(millis() - start) ;
    int count = 0 ;
    for(PathVec ps : pareto)
     count += ps.leng() ;
    size = count ;
  }

  void bellmanford() {
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
  }

}
