// 完全グラフのためグラフを使用していない（頂点はint:頂点数nの時０ 〜 n-1）

void setup() {
  int objective = 3 ;
  int nodenum = 500 ;
  // String[] lines0 = loadStrings("/Users/nakano/Desktop/data500/cost0.csv");
  // String[] lines1 = loadStrings("/Users/nakano/Desktop/data500/cost1.csv");
  // String[] lines2 = loadStrings("/Users/nakano/Desktop/data500/cost2.csv");
  String[] lines0 = loadStrings("/Users/nakano/Desktop/instanceData/weight_500_300_0.csv");
  String[] lines1 = loadStrings("/Users/nakano/Desktop/instanceData/weight_500_300_1.csv");
  String[] lines2 = loadStrings("/Users/nakano/Desktop/instanceData/weight_500_300_2.csv");
  int weight[][][] = instanceText(lines0, lines1, lines2, nodenum) ;
  for(int i = 0 ; i < 10 ; i++) {
    ParetoSolution p0 = new ParetoSolution(0, nodenum, weight, objective) ;
  }

  exit() ;
}
