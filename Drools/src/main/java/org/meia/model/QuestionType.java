package org.meia.model;

public enum QuestionType {
    INITIAL("Initial"),
    GENERAL_ANXIETY("Síndrome de Ansiedade Generalizada"),
    PANIC_SYNDROME("Transtorno de Pânico"),
    PANIC_AGORAPHOBIA_SYNDROME("Transtorno de Pânico com Agorafobia"),
    AGORAPHOBIA_SYNDROME("Agorafobia"),
    SPECIFIC_PHOBIA("Fobia Específica"),
    SELECTIVE_MUTISM("Mutismo Seletivo"),
    SEPARATION_ANXIETY("Ansiedade de Separação"),
    SOCIAL_PHOBIA("Ansiedade Social");

    private String value;

    QuestionType(String value){
        this.value = value;
    }

    public String getValue() {
        return value;
    }
    public static QuestionType fromValue(String value) {
        for (QuestionType type : values()) {
            if (type.getValue().equalsIgnoreCase(value)) {
                return type;
            }
        }
        return null;
    }
}
