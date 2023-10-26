package org.meia.model;

import java.util.List;

public class Quiz {
    private List<Question> QuizInitial;
    private List<QuestionCategory> Quiz40;

    public List<Question> getQuizInitial() {
        return QuizInitial;
    }

    public void setQuizInitial(List<Question> quizInitial) {
        QuizInitial = quizInitial;
    }

    public List<QuestionCategory> getQuiz40() {
        return Quiz40;
    }

    public void setQuiz40(List<QuestionCategory> quiz40) {
        Quiz40 = quiz40;
    }

    public String toStringInitial(){
        String texto = "Quiz Initial: \n";
        for (Question question : QuizInitial) {
            texto+="-ID: " + question.getId();
            texto+="   -Pergunta: " + question.getQuestion();
            texto+="\n";
        }

        return texto;
    }

    public String toString40(){
        String texto = "Quiz 40: \n";
        for (QuestionCategory questionCategory : Quiz40) {
            texto+="Category: "+questionCategory.getCategory()+"\n";
            for (Question question: questionCategory.getCategoryQuestionList()) {
                texto += "-ID: " + question.getId();
                texto += "   -Pergunta: " + question.getQuestion();
                texto += "\n";
            }
        }

        return texto;
    }

    @Override
    public String toString() {
        return "Quiz{\n" +
                " --QuizInitial=\n" + QuizInitial +
                "\n --Quiz40=" + Quiz40 +
                "\n}";
    }
}
