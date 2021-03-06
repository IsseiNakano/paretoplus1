// int[][][] instance(NodeSet us) {
//   int[][][] weight = new int[us.size()][us.size()][objective] ;
//   for(int i = 0 ; i < weight.length ; i++)
//   for(int j = 0 ; j < weight[i].length ; j++)
//   for(int l = 0 ; l < weight[i][j].length ; l++)
//   if(i != j)
//   weight[j][i][l] = (int)random(ninasvalue, plusvalue) ;
//   return weight ;
// }

int[][][] instanceText(String[] lines, int nodenum, int objective) {
  int[][][] weight = new int[nodenum][nodenum][objective] ;
  for(int i = 0 ; i < lines.length ; i++){
    int u = i / nodenum ;
    int v = i % nodenum ;
    String[] values = split(lines[i], ",") ;
    for(int j = 0 ; j < values.length ; j++)
    weight[u][v][j] = int(values[j]) ;
  }
  return weight ;
}

int[][][] instanceText(String[] lines0, String[] lines1, String[] lines2, int nodenum) {
  int[][][] weight = new int[nodenum][nodenum][3] ;
  for(int i = 0 ; i < nodenum ; i++){
    String[] values0 = split(lines0[i], ",") ;
    String[] values1 = split(lines1[i], ",") ;
    String[] values2 = split(lines2[i], ",") ;
    for(int j = 0 ; j < nodenum ; j++) {
      weight[i][j][0] = int(values0[j]) ;
      weight[i][j][1] = int(values1[j]) ;
      weight[i][j][2] = int(values2[j]) ;
    }
  }
  return weight ;
}

//
// void show(int[][][] weight) {
//   for(int i = 0 ; i < weight.length ; i++)
//   for(int j = 0 ; j < weight[i].length ; j++)
//   for(int l = 0 ; l < weight[i][j].length ; l++)
//   println("["+i+"]["+j+"]["+l+"]= "+weight[i][j][l]) ;
// }
