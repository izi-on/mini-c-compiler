package gen;

import ast.*;
import gen.asm.Label;
import gen.util.rules.PassByRef;

import java.util.*;
import java.util.stream.Collectors;

public class ClassObjectLayoutGetter {

    public Map<ClassType, Map<String, Integer>> visit(Program program) {
        List<ClassDecl> classDecls = program.children().stream().filter(ClassDecl.class::isInstance).map(node -> (ClassDecl) node).collect(Collectors.toList());
        Map<ClassType, ClassDecl> mapClassTypeToDecl = new HashMap<>();
        Map<ClassType, List<ClassType>> mapToSubclasses = new HashMap<>();
        classDecls.forEach(classDecl -> {
            mapClassTypeToDecl.put(classDecl.curClassType, classDecl);
            classDecl.superClassType.ifPresent(superClassType -> {
                mapToSubclasses.computeIfAbsent(superClassType, k -> new ArrayList<>()).add(classDecl.curClassType);
            });
        });

        List<ClassType> rootClasseTypes = new ArrayList<>(classDecls.stream()
                .filter(classDecl -> classDecl.superClassType.isEmpty())
                .map(classDecl -> classDecl.curClassType)
                .collect(Collectors.toList()));
        Set<ClassType> toVisit = new HashSet<>(rootClasseTypes);

        Map<ClassType, Map<String, Integer>> mapClassTypeToObjectLayout = new HashMap<>();

        while (!toVisit.isEmpty()) {
            Set<ClassType> nextToVisit = new HashSet<>();
            for (ClassType curClass : toVisit) {
                // get super class layout
                Map<String, Integer> superClassLayout = mapClassTypeToObjectLayout.getOrDefault(mapClassTypeToDecl.get(curClass).superClassType.orElse(curClass), new HashMap<>());
                Map<String, Integer> curClassLayout = new HashMap<>(superClassLayout);

                // filter out the empty var decl used for marking
                curClassLayout = curClassLayout.entrySet().stream()
                        .filter(entry -> !entry.getKey().equals("empty%"))
                        .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));

                // get highest offset
                int offset = superClassLayout.values().stream().max(Integer::compareTo).orElse(0) + TypeSizeGetter.WORD_SIZE; // 0 is reserved for the vtable
                for (VarDecl varDecl : mapClassTypeToDecl.get(curClass).varDecls) {
                    // add varDecl to the layout
                    curClassLayout.put(varDecl.name, offset);
                    // increment offset
                    offset += (PassByRef.ifIs(varDecl.type).getTruth()) ? TypeSizeGetter.WORD_SIZE : TypeSizeGetter.getSize(varDecl.type);
                }
                // add empty var decl to mark the highest offset
                curClassLayout.put("empty%", offset);
                // add the layout to the map
                mapClassTypeToObjectLayout.put(curClass, curClassLayout);
                // get next classes to visit
                nextToVisit.addAll(mapToSubclasses.getOrDefault(curClass, List.of()));
            }
            toVisit = nextToVisit;
        }

        return mapClassTypeToObjectLayout;
    }
}
