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
      if(path.nCanIn(s.path.pathweight)) {
        s.remove() ;
      }
    }
  }
  boolean canIn(int[] path) {
    for(Vector s = follow ; s != this ; s = s.follow) {
      if(s.path.nCanIn(path)) return false ;
    }
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
  int index ;
  Path() {
  }
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
}

class PathVec {
  Vector dummy ;
  int index ;
  int[][] w ;
  Vector upd ;
  PathVec() {
  }
  PathVec(int i, int[][] wei) {
    index = i ;
    w = wei ;
    dummy = new Vector() ;
    upd = new Vector() ;
  }
  void show() {
    dummy.show() ;
  }
  void add(Path path) {
    dummy.pre.add(new Vector(path)) ;
  }
  void paretoConstruction(Vector ps, Vector vs) {
    upd.clear() ;
    for(Vector s = ps.follow ; s != ps ; s = s.follow) {
      // show() ;
      // println(index) ;
      int[] path = s.path.calculation(w[s.path.index]) ;
      if(dummy.canIn(path) && upd.canIn(path)) {
        Path p = new Path(path, s.path.index, index) ;
        dummy.paretoOut(p) ;
        upd.paretoOut(p) ;
        upd.add(new Vector(p)) ;
      }
    }
    if(!upd.isEmpty()) {
      // dummy.addAll(upd.follow, upd.pre) ;
      for(Vector s = upd.follow ; s != upd ; s = s.follow)
        add(s.path) ;
      vs.addAll(upd.follow, upd.pre) ;
      // for(Vector s = upd.follow ; s != upd ; s = s.follow)
      //   vs.pre.add(new Vector(s.path)) ;
    }
  }
  int leng() {
    int count = 0 ;
    for(Vector s = dummy.follow ; s != dummy ; s = s.follow) {
      count++ ;
    }
    return count ;
  }
}
