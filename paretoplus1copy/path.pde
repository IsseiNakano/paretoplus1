class Vector {
  int[] pathweight ;
  Vector pre ;
  Vector follow ;
  Vector() {
    pre = this ;
    follow = this ;
  }
  Vector(int[] weight) {
    pathweight = weight ;
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
  void paretoOut(Vector path) {
    for(Vector s = follow ; s != this ; s = s.follow) {
      if(path.nCanIn(s.pathweight))
        s.remove() ;
    }
  }
  boolean canIn(int[] path) {
    for(Vector s = follow ; s != this ; s = s.follow)
      if(s.nCanIn(path)) return false ;
    return true ;
  }
  int[] calculation(int[] weight) {
    int[] value = new int[objective];
    for(int i = 0 ; i < objective ; i++)
      value[i] = pathweight[i] + weight[i] ;
    return value ;
  }
  boolean nCanIn(int[] b) {
    for(int i = 0 ; i < pathweight.length ; i++)
      if(pathweight[i] > b[i]) return false ;
    return true ;
  }
  int dominate(int[] u) {
    int status = 0 ;
    for (int k = 0 ; k < objective ; k++) {
      int d = u[k] - pathweight[k] ;
      if (d > 0) status |= 1 ;
      else if (d < 0) status |= 2 ;
      if (status == 3) break ;
    }
    return status ;
  }
  boolean check(int[] u) {
    for (Vector v = follow ; v != this ; v = v.follow) {
      int status = v.dominate(u) ;
      if (status <= 1) return false ;
      if (status < 3) v.remove() ;
    }
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
  void add(int[] wei) {
    dummy.pre.add(new Vector(wei)) ;
  }
  // void paretoConstruction(PathVec pps) {
  //   for(Vector s = pps.upd.follow ; s != pps.upd ; s = s.follow) {
  //     int[] path = s.calculation(w[pps.index]) ;
  //     if(dummy.canIn(path))
  //     if(upd.canIn(path))
  //     if(vs.canIn(path)) {
  //       Vector p = new Vector(path) ;
  //       dummy.paretoOut(p) ;
  //       upd.paretoOut(p) ;
  //       vs.paretoOut(p) ;
  //       vs.add(p) ;
  //     }
  //   }
  // }
  boolean paretoConstruction(PathVec pps) {
    boolean flag = false ;
    for(Vector s = pps.upd.follow ; s != pps.upd ; s = s.follow) {
      int[] path = s.calculation(w[pps.index]) ;
      if (dummy.check(path))
      if (upd.check(path))
      if (vs.check(path)) {
        vs.add(new Vector(path)) ;
        flag = true ;
      }
    }
    return flag ;
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
