package com.bobochang.warehouse.utils;

public class OperPersonHolder {
    private static InheritableThreadLocal<String> operPersonThreadLocal = new InheritableThreadLocal<>();

    public static void setOperPerson(String operPerson) {
        operPersonThreadLocal.set(operPerson);
    }

    public static String getOperPerson() {
        return operPersonThreadLocal.get();
    }

    public static void clearOperPerson() {
        operPersonThreadLocal.remove();
    }
}
