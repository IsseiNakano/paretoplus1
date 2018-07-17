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
    pareto[s].add(new Path(new int[obj], i)) ;
    int start = millis() ;
    bellmanford() ;
    print("time = "+ (millis() - start) ) ;
    int count = 0 ;
    for(PathVec ps : pareto)
     count += ps.leng() ;
    println(" "+count) ;
  }

  void bellmanford() {
    Vector update = new Vector() ;
    update.add(new Vector(pareto[s].dummy.follow.path)) ;
    while(true) {
      Vector vs = new Vector() ;
      for(PathVec ps : pareto)
        ps.paretoConstruction(update, vs) ;
      if(vs.isEmpty()) break ;
      update = vs ;
    }
  }

  void show() {
    for(PathVec ps : pareto)
      ps.show() ;
  }

}
