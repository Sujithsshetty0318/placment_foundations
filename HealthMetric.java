 public class HealthMetric{
    public static void calculate(int age,double bmi) {
        System.out.println("body age");
        if(bmi<18.5) System.out.println(age+2);
        else if(bmi>25) System.out.println(age+5);
        else System.out.println(age);
    }
    public static void calculate(double bmi,int age,String gender) {
        System.out.println("Fat rate");
        if(gender.equals("male"))
            System.out.println((1.20*bmi)+(0.23*age)-16.2);
        else
            System.out.println((1.20*bmi)+(0.23*age)-5.4);
        
    }
    public static void calculate(Patient object){
        System.out.println(object.name+"BMI");
        object.height /=100;
        object.bmi=object.weight/(object.height*object.height);
        System.out.println(object.bmi);
        calculate(object.age,object.bmi);
        calculate(object.bmi,object.age,object.gender);

    }
    public static void main(String[] args){
        Patient patient1=new Patient();
        patient1.name="Razak Mohamed";
        patient1.age=34;patient1.gender="male";
        patient1.weight=68.20;patient1.height=158;
        Patient patient2 =new Patient();
        patient2.name="Sabarinathan";patient2.age=34;
        patient2.gender="male";patient2.weight=89.6;
        patient2.height=165;
        calculate(patient1);
        calculate (patient2);
    }
} 
    

