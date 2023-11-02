package org.meia.anxietyDiagnosis;

import org.meia.model.*;

import org.kie.api.KieServices;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
import org.kie.api.runtime.rule.LiveQuery;
import org.kie.api.runtime.rule.Row;
import org.kie.api.runtime.rule.ViewChangedEventListener;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.util.Map;
import java.util.TreeMap;

public class AnxietyDiagnosis {
    public static KieSession KS;

    public static StringBuilder finalConclusion = new StringBuilder();

    public static TrackingAgendaEventListener agendaEventListener;
    public static Map<Integer, Justification> justifications;


    public static  void main(String[] args) throws FileNotFoundException {
        Quiz quiz = new Quiz();
        Reader.assignAnswersToQuiz40(quiz);
       runEngine40(quiz);
       System.out.println(finalConclusion.toString());
    }

    public static void runEngine40(Quiz quiz) {
        try {
            AnxietyDiagnosis.justifications = new TreeMap<Integer, Justification>();

            // load up the knowledge base
            KieServices ks = KieServices.Factory.get();
            KieContainer kContainer = ks.getKieClasspathContainer();
            KieSession kSession = kContainer.newKieSession("ksession-rules40");
            AnxietyDiagnosis.KS = kSession;
            AnxietyDiagnosis.agendaEventListener = new TrackingAgendaEventListener();
            kSession.addEventListener(agendaEventListener);

            // Query listener
            ViewChangedEventListener listener = new ViewChangedEventListener() {
                @Override
                public void rowDeleted(Row row) {
                }

                @Override
                public void rowInserted(Row row) {
                    Conclusion conclusion = (Conclusion) row.get("$conclusion");

                    How how = new How(AnxietyDiagnosis.justifications);
                    finalConclusion.append(how.getHowExplanation(conclusion.getId()));

                    // stop inference engine as soon as a conclusion is obtained
                    //kSession.halt();
                }

                @Override
                public void rowUpdated(Row row) {
                }
            };

            LiveQuery query = kSession.openLiveQuery("Conclusions", null, listener);

            kSession.setGlobal("quiz",quiz);

            kSession.fireAllRules();

            query.close();
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

}