import java.util.Arrays;

// Abstract Class
abstract class LoanRemote {

    abstract void applyLoan(int applicantId, String loanType);

    abstract void viewLoan(int applicantId);

    abstract void cancelLoan(int applicantId);

    void log(String message) {
        System.out.println(message);
    }
}

// Concrete Class
class LoanService extends LoanRemote {

    private String[][] loans;

    public LoanService(int applicants, int loanSlots) {
        loans = new String[applicants][loanSlots];
    }

    @Override
    void applyLoan(int applicantId, String loanType) {

        for (int i = 0; i < loans[applicantId].length; i++) {

            if (loans[applicantId][i] == null) {

                loans[applicantId][i] = loanType;

                log("Loan applied: " + loanType + " for applicant " + applicantId);

                return;
            }
        }

        log("No space available for applicant " + applicantId);
    }

    @Override
    void viewLoan(int applicantId) {

        System.out.println("Applicant " + applicantId + " loans: "
                + Arrays.toString(loans[applicantId]));
    }

    @Override
    void cancelLoan(int applicantId) {

        for (int i = 0; i < loans[applicantId].length; i++) {

            loans[applicantId][i] = null;
        }

        log("Loans cancelled for applicant " + applicantId);
    }
}

// Driver Class
public class LoanAppl {

    public static void main(String[] args) {

        LoanService service = new LoanService(5, 3);

        service.applyLoan(0, "Personal Loan");
        service.applyLoan(0, "Business Loan");
        service.applyLoan(1, "Education Loan");

        service.viewLoan(0);
        service.viewLoan(1);

        service.cancelLoan(0);

        service.viewLoan(0);
    }
}