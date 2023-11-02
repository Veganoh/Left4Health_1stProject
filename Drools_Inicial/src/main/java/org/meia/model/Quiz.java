package org.meia.model;

import org.meia.anxietyDiagnosis.Reader;

import java.io.FileNotFoundException;
import java.util.*;


public class Quiz {
    private final List<Question> QuizInitial = new ArrayList<>();

    public List<Question> getQuizInitial() {
        return QuizInitial;
    }

    public Quiz() throws FileNotFoundException {
        this.fillQuestions();
    }

    public void fillQuestions() throws FileNotFoundException {
        Reader.readQuestionsFromFile(this);
    }

    public void addQuestion(Question q){
        this.QuizInitial.add(q);
    }

    public void addAnswerToQuestion(String id, String answer){
        for (Question question : QuizInitial) {
            if (Objects.equals(question.getId(), id)) {
                question.setAnswer(answer);
            }}

    }
    @Override
    public String toString() {
        return "Quiz{\n" +
                " --QuizInitial=" + QuizInitial +
                "\n}";
    }

    public String generateInitialQuizString(){
        StringBuilder sb = new StringBuilder();
        for(Question q : this.QuizInitial){
            sb.append(q.getId()).append("\n");
            sb.append(q.getQuestion()).append("\n");
        }
        return sb.toString();
    }
}