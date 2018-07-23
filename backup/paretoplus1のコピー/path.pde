class Path {
  int[] pathweight ;
  int parent ;
  int index ;
  Path(int[] weight, int i) {
    pathweight = weight ;
    index = i ;
  }
  Path(int[] weight, int prenode, int i) {
    pathweight = weight ;
    parent = prenode ;
    index = i ;
  }
  void show() {
    print("pathweight=") ;
    for(int i = 0 ; i < pathweight.length ; i++)
    print("("+i+":"+pathweight[i]+") ") ;
    println("parent="+parent+" index ="+index) ;
  }
  int[] calculation(int[] weight) {
    int[] value = new int[weight.length];
    for(int i = 0 ; i < value.length ; i++)
      value[i] = pathweight[i] + weight[i] ;
    return value ;
  }
  boolean dominate(int[] b) {
    boolean flag = false ;
    for(int i = 0 ; i < pathweight.length ; i++) {
      if(pathweight[i] > b[i]) return false ;
      if(pathweight[i] < b[i]) flag = true ;
    }
    return flag ;
  }
  boolean nCanIn(int[] b) {
    for(int i = 0 ; i < pathweight.length ; i++)
      if(pathweight[i] > b[i]) return false ;
    return true ;
  }
  void pathShow(PathSet[] pareto, int[][] w) {
    if(parent == 0) {
      print(parent+" "+index+" ") ;
    } else {
      pareto[parent].prePathShow(pareto, prePathWeight(w[parent])) ;
      print(index+" ") ;
    }
  }
  int[] prePathWeight(int[] w) {
    int[] prew = new int[w.length] ;
    for(int i = 0 ; i < w.length ; i++)
      prew[i] = pathweight[i] - w[i] ;
    return prew ;
  }
  boolean eqWeight(int[] w) {
    for(int i = 0 ; i < w.length ; i++)
      if(pathweight[i] != w[i]) return false ;
    return true ;
  }
}

class PathSet extends ArrayList<Path> {
  int index ;
  int[][] w ;
  PathSet() {
  }
  PathSet(int i, int[][] wei) {
    index = i ;
    w = wei ;
  }
  void show() {
    for(Path p : this)
    p.show() ;
  }
  void paretoOut(Path path) {
    PathSet delate = new PathSet() ;
    for(Path p : this)
      if(path.nCanIn(p.pathweight))
        delate.add(p) ;
    for(Path p : delate)
      remove(p) ;
  }
  boolean canIn(int[] path) {
    for(Path p : this)
      if(p.nCanIn(path)) return false ;
    return true ;
  }
  void paretoIn(Path path) {
    paretoOut(path) ;
    add(path) ;
  }
  PathSet paretoConstruction(PathSet ps, PathSet vs) {
    for(Path pp : ps) {
      int[] path = pp.calculation(w[pp.index]) ;
      if(canIn(path)) {
        Path p = new Path(path, pp.index, index) ;
        paretoIn(p) ;
        vs.add(p) ;
      }
    }
    return vs ;
  }
  void pathShow(PathSet[] pareto) {
    for(Path p : this) {
      p.pathShow(pareto, w) ;
      println() ;
    }
  }
  void prePathShow(PathSet[] pareto, int[] pathw) {
    for(Path p : this)
      if(p.eqWeight(pathw))
        p.pathShow(pareto, w) ;
  }
}
