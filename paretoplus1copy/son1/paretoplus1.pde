// 完全グラフのためグラフを使用していない（頂点はint:頂点数nの時０ 〜 n-1）
String dir = "/Users/nakano/Desktop/instanceData/" ;
final int nodenum = 500 ;
final int bound = 300 ;
final int objective = 3 ;
final int experimentNum = 10 ;

void setup() {
  // dir = "../../data/" ;
  int[] m = {0,1,2} ;
  ParetoSolution p = new ParetoSolution(m) ;
  p.update() ;
  exit() ;
}
