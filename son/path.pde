class Vector {
  Path path ;
  Vector pre ;
  Vector follow ;
  Vector() {
    path = null ;
    pre = this ;
    follow = this ;
  }
  Vector(Path p) {
    path = p ;
  }
  void add(Vector a) {
    a.pre = this ;
    follow.pre = a ;
    a.follow = follow ;
    follow = a ;
  }
  void remove() {
    pre.follow = follow ;
    follow.pre = pre ;
  }
  void clear() {
    pre = this ;
    follow = this ;
  }
  boolean isEmpty(){
    return follow == this ;
  }
  void addAll(Vector a, Vector b) {
    pre.follow = a ;
    a.pre = pre ;
    pre = b ;
    b.follow = this ;
  }
  void remove(Path path) {
    for(Vector s = follow ; s != this ; s = s.follow)
      if(s.path == path) {
        s.remove() ;
        break ;
      }
  }
  void paretoOut(Path path) {
    for(Vector s = follow ; s != this ; s = s.follow) {
      if(path.nCanIn(s.path.pathweight))
        s.remove() ;
    }
  }
  boolean canIn(int[] path) {
    for(Vector s = follow ; s != this ; s = s.follow)
      if(s.path.nCanIn(path)) return false ;
    return true ;
  }
  void show() {
    for(Vector s = follow ; s != this ; s = s.follow) {
      if(s.path == null) s.follow.path.show() ;
      s.path.show() ;
    }
  }
}

class Path {
  int[] pathweight ;
  int parent ;
  Path() {
  }
  Path(int[] weight) {
    pathweight = weight ;
  }
  Path(int[] weight, int prenode) {
    pathweight = weight ;
    parent = prenode ;
  }
  void show() {
    print("pathweight=") ;
    for(int i = 0 ; i < pathweight.length ; i++)
    print("("+i+":"+pathweight[i]+") ") ;
    println("parent="+parent) ;
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
}

class PathVec {
  Vector dummy ;
  int index ;
  int[][] w ;
  Vector upd ;
  Vector vs ;
  PathVec() {
  }
  PathVec(int i, int[][] wei) {
    index = i ;
    w = wei ;
    dummy = new Vector() ;
    upd = new Vector() ;
    vs = new Vector() ;
  }
  void show() {
    dummy.show() ;
  }
  void add(Path path) {
    dummy.pre.add(new Vector(path)) ;
  }
  void paretoConstruction(PathVec pps) {
    for(Vector s = pps.upd.follow ; s != pps.upd ; s = s.follow) {
      int[] path = s.path.calculation(w[pps.index]) ;
      if(dummy.canIn(path))
      if(upd.canIn(path))
      if(vs.canIn(path)) {
        Path p = new Path(path, pps.index) ;
        dummy.paretoOut(p) ;
        upd.paretoOut(p) ;
        vs.paretoOut(p) ;
        vs.add(new Vector(p)) ;
      }
    }
  }
  int leng() {
    int count = 0 ;
    for(Vector s = dummy.follow ; s != dummy ; s = s.follow)
      count++ ;
    return count ;
  }
  void update() {
    if(!upd.isEmpty()) {
      dummy.addAll(upd.follow, upd.pre) ;
      upd.clear() ;
    }
    if(!vs.isEmpty()) {
      upd.addAll(vs.follow, vs.pre) ;
      vs.clear() ;
    }
  }
}
