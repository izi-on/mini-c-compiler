package sem.error;

public abstract class AbstractError {
    String details;

    public AbstractError(String details) {
        this.details = details;
    }
    public abstract String msg();
}
