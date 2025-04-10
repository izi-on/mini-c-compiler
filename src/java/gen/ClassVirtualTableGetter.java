package gen;

import ast.*;
import gen.asm.Label;

import java.util.*;
import java.util.stream.Collectors;

public class ClassVirtualTableGetter {
    // step 1: we will go through each class and create a unique label for its methods
    // step 2: we will visit root classes, keep a map of the name of the method to a list of its implementations
    // and then when we visit the class we will add any implementations to the list in the map entry. Then, for each
    // key in the map, we will map the most recent label in the list: that would be the virtual table.
    public Map<ClassType, Map<String, List<Label>>> visit(Program program) {
        List<ClassDecl> classDecls = program.children().stream().filter(ClassDecl.class::isInstance).map(node -> (ClassDecl) node).collect(Collectors.toList());
        Map<ClassType, ClassDecl> mapClassTypeToDecl = new HashMap<>();
        Map<ClassType, List<ClassType>> mapToSubclasses = new HashMap<>();
        classDecls.forEach(classDecl -> {
            mapClassTypeToDecl.put(classDecl.curClassType, classDecl);
            classDecl.superClassType.ifPresent(superClassType -> {
                mapToSubclasses.computeIfAbsent(superClassType, k -> new ArrayList<>()).add(classDecl.curClassType);
            });
        });

        // step 1
        Map<FunDef, Label> mapFunDefToLabel = new HashMap<>();
        classDecls.forEach((classDecl) -> {
            classDecl.funDefs.forEach(funDef -> {
                mapFunDefToLabel.put(funDef, Label.create(funDef.name));
            });
        });

        // step 2
        // root class is a class without a super class
        List<ClassType> rootClasseTypes = new ArrayList<>(classDecls.stream()
                .filter(classDecl -> classDecl.superClassType.isEmpty())
                .map(classDecl -> classDecl.curClassType)
                .collect(Collectors.toList()));
        Map<ClassType, Map<String, List<Label>>> mapClassTypeToVirtualTable = new HashMap<>();
        Set<ClassType> toVisit = new HashSet<>(rootClasseTypes);
        while (!toVisit.isEmpty()) {
            Set<ClassType> nextToVisit = new HashSet<>();
            for (ClassType curClass : toVisit) {
                // get a copy of the virtual table of the super class
                Map<String, List<Label>> mapToImplementation = new HashMap<>(
                        mapClassTypeToVirtualTable.getOrDefault(
                                mapClassTypeToDecl.get(curClass).superClassType.orElse(curClass), new HashMap<>()
                        )
                ); // map to function impl
                mapClassTypeToDecl.get(curClass).funDefs.forEach(funDef -> {
                    List<Label> newLabelList = new ArrayList<>(mapToImplementation.getOrDefault(funDef.name, List.of()));
                    newLabelList.add(mapFunDefToLabel.get(funDef));
                    mapToImplementation.put(funDef.name, newLabelList);
                });
                mapClassTypeToVirtualTable.put(curClass, mapToImplementation);

                // get next classes to visit
                nextToVisit.addAll(mapToSubclasses.getOrDefault(curClass, List.of()));
            }
            toVisit = nextToVisit;
        }

        return mapClassTypeToVirtualTable;
    }
}
