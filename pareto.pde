class ParetoSolution {
  PathSet[] pareto ;
  int s ;
  int obj ;
  int ns ;

  ParetoSolution(int i, int nss, int[][][] weight, int objective) {
    s = i ;
    obj = objective ;
    ns = nss ;
    pareto = new PathSet[ns] ;
    for(int j = 0 ; j < ns ; j++)  pareto[j] = new PathSet(j, weight[j]) ;
    pareto[s].add(new Path(new int[obj], i)) ;
    int start = millis() ;
    bellmanford() ;
    print("time = "+ (millis() - start) ) ;
    int count = 0 ;
    for(PathSet ps : pareto)
     count += ps.size() ;
    println(" "+count) ;
  }

  void bellmanford() {
    PathSet update = new PathSet() ;
    update.add(pareto[s].get(0)) ;
    while(true) {
      PathSet vs = new PathSet() ;
        for(PathSet ps : pareto)
          vs = ps.paretoConstruction(update, vs) ;
      if(vs.size() == 0) break ;
      update = vs ;
    }
  }

  void show() {
    for(PathSet ps : pareto)
      ps.show() ;
  }
}
