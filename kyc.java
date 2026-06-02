import java.util.*;

public class kyc {
    static Map<String,String> patterns = new HashMap<>();
    static{
        patterns.put("name","^[A-Za-z ]{3,}$");
        patterns.put("password", "^(?=.[@#$!_])[A-Za-z0-9?=.@#$!_]{8,}$");
        patterns.put("aadhaar","^");
    }
        public static void main(String[] args){
        Scanner scan =new Scanner(System.in);
        System.out.println("kyc");


    }
}
