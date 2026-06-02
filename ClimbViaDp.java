public class ClimbViaDp {
    public static int dpClimb(int stairs){
        if(stairs<0) return 1;
        else if(stairs<=2) return stairs;
        int[] dp=new int[stairs+1];
        dp[0]=0;dp[1]=1;dp[2]=2;
        for(int index=3;index<=stairs;index++){
            dp[index]=dp[index-1]+dp[index-2];
        }
        return dp[stairs];
    }
}
