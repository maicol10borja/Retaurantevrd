package service;

public class ServiceJdbcException extends RuntimeException {
    public ServiceJdbcException(String message, Throwable cause) {
        super(message);
    }
}
