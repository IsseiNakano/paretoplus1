// 完全グラフのためグラフを使用していない（頂点はint:頂点数nの時０ 〜 n-1）
String dir = "/Users/nakano/Desktop/instanceData/" ;
final int objective = 3 ;
final int nodenum = 500 ;
int size = Integer.MAX_VALUE ; ;
int time = Integer.MAX_VALUE ; ;

void setup() {
  // dir = "../../data/" ;
  // String[] lines0 = loadStrings("/Users/nakano/Desktop/data500/cost0.csv");
  // String[] lines1 = loadStrings("/Users/nakano/Desktop/data500/cost1.csv");
  // String[] lines2 = loadStrings("/Users/nakano/Desktop/data500/cost2.csv");
  String[] lines0 = loadStrings(dir + "weight_500_300_0.csv");
  String[] lines1 = loadStrings(dir + "weight_500_300_1.csv");
  String[] lines2 = loadStrings(dir + "weight_500_300_2.csv");
  int weight[][][] = instanceText(lines0, lines1, lines2, nodenum) ;
  for(int i = 0 ; i < 10 ; i++) {
    ParetoSolution p0 = new ParetoSolution(0, nodenum, weight, objective) ;
  }
  println(size + "," + time) ;
  exit() ;
}
