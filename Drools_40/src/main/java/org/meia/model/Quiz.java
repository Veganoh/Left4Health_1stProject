package org.meia.model;

import org.meia.anxietyDiagnosis.Reader;

import java.io.FileNotFoundException;
import java.util.*;


public class Quiz {
    private final List<Question> Quiz40 = new ArrayList<>();

    public  int GENERAL_ANXIETY_SCORE = 0;
    public  int PANIC_SYNDROME_SCORE = 0;
    public  int PANIC_AGORAPHOBIA_SYNDROME_SCORE = 0;
    public  int AGORAPHOBIA_SYNDROME_SCORE = 0;
    public  int SPECIFIC_PHOBIA_SCORE = 0;
    public  int SELECTIVE_MUTISM_SCORE = 0;
    public  int SEPARATION_ANXIETY_SCORE = 0;
    public  int SOCIAL_PHOBIA_SCORE = 0;

    public List<Question> getQuiz40() {
        return Quiz40;
    }

    public Quiz() throws FileNotFoundException {
        this.fillQuestions();
    }

    private void fillQuestions() throws FileNotFoundException {
        Reader.readQuestionsFromFile(this);
    }

    public void addQuestion(Question q){
        this.Quiz40.add(q);
    }

    public void addAnswerToQuestion(String id, String answer){
        for (Question question : Quiz40) {
            if (Objects.equals(question.getId(), id)) {
                question.setAnswer(answer);
                updateCategoryScores(question.getQuestionType(), answer);
            }
        }
    }
    @Override
    public String toString() {
        return "Quiz{\n" +
                "\n --Quiz40=" + Quiz40 +
                "\n}";
    }

    public String generateQuiz40String(){
        List<Question> quiz40 = getRandomizedQuiz40();

        StringBuilder sb = new StringBuilder();
        for(Question q : quiz40){
            sb.append(q.getId()).append("\n");
            sb.append(q.getQuestion()).append("\n");
        }
        return sb.toString();
    }
    private List<Question> getRandomizedQuiz40(){
        List<Question> res = new ArrayList<>(Quiz40);
        Collections.shuffle(res);

        return res;
    }

    private void updateCategoryScores(String  questionType, String answer) {
        switch (questionType) {
            case QuestionType.GENERAL_ANXIETY:
                GENERAL_ANXIETY_SCORE += calculateScore(answer);
                break;
            case QuestionType.PANIC_SYNDROME:
                PANIC_SYNDROME_SCORE += calculateScore(answer);
                break;
            case QuestionType.PANIC_AGORAPHOBIA_SYNDROME:
                PANIC_AGORAPHOBIA_SYNDROME_SCORE += calculateScore(answer);
                break;
            case QuestionType.AGORAPHOBIA_SYNDROME:
                AGORAPHOBIA_SYNDROME_SCORE += calculateScore(answer);
                break;
            case QuestionType.SPECIFIC_PHOBIA:
                SPECIFIC_PHOBIA_SCORE += calculateScore(answer);
                break;
            case QuestionType.SELECTIVE_MUTISM:
                SELECTIVE_MUTISM_SCORE += calculateScore(answer);
                break;
            case QuestionType.SEPARATION_ANXIETY:
                SEPARATION_ANXIETY_SCORE += calculateScore(answer);
                break;
            case QuestionType.SOCIAL_PHOBIA:
                SOCIAL_PHOBIA_SCORE += calculateScore(answer);
                break;
            default:
        }
    }
    private int calculateScore(String answer) {
        return Integer.parseInt(answer);
    }
}