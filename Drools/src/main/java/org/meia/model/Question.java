package org.meia.model;

public class Question {
    private int id;
    private String question;
    private String answer;

    // Construtor que inicializa todos os atributos
    public Question(int id,String question, String answer) {
        this.id = id;
        this.question = question;
        this.answer = answer;
    }

    public Question() {
        // Deixa os atributos não inicializados
    }

    public int getId() {
        return id;
    }

    // Getters e Setters para os atributos
    public void setId(int id) {
        this.id = id;
    }
    public String getQuestion() {
        return question;
    }



    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setResposta(String answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return "Question{" +
                "id=" + id +
                ", question='" + question + '\'' +
                ", answer='" + answer + '\'' +
                '}';
    }
}
