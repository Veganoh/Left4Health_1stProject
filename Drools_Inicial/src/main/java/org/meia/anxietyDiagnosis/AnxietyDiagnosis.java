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
    public static BufferedReader BR;

    public static InitialConclusion initialConclusion;

    public static  void main(String[] args) throws FileNotFoundException {
        Quiz quiz = new Quiz();

        Reader.assignAnswersToQuizInitial(quiz);
        runEngine(quiz);

    }

    public static void runEngine(Quiz quiz) {
        try {
            // load up the knowledge base
            KieServices ks = KieServices.Factory.get();
            KieContainer kContainer = ks.getKieClasspathContainer();
            KieSession kSession = kContainer.newKieSession("ksession-rules");


            // Query listener
            ViewChangedEventListener listener = new ViewChangedEventListener() {
                @Override
                public void rowDeleted(Row row) {
                }

                @Override
                public void rowInserted(Row row) {
                    initialConclusion = (InitialConclusion) row.get("$initialConclusion");
                    System.out.println(">>>" + initialConclusion.toString());

                    // stop inference engine as soon as an initial conclusion is obtained
                    kSession.halt();
                }

                @Override
                public void rowUpdated(Row row) {
                }
            };

            LiveQuery query = kSession.openLiveQuery("InitialConclusions", null, listener);

            kSession.insert(quiz);

            kSession.fireAllRules();

            query.close();
        } catch (Throwable t) {
            t.printStackTrace();
        } finally {
            if(KS != null) KS.dispose();
        }
    }
}