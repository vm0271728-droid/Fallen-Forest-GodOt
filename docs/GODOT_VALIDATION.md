# Godot validation status

- Engine: Godot 4.7.1 stable
- Branch: `fix/android11-integrity`
- Tested commit: `2f47e13d68e0a6afe3694a2cd1e528ae58793ad4`
- Full asset import exit code: `1`
- Main-menu smoke-test exit code: `0`
- Gameplay smoke-test exit code: `0`
- Runtime floor/tree physics exit code: `0`
- Asset inspection exit code: `0`
- Overall exit code: `1`
- Result: **FAIL**

## MAX_MESH_SURFACES context
```text
472-[  84% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_brch_cut_02_Picea_branch_cut_01_n_LOD2_Normal.png[39m[0m
473-[  85% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_brch_dead_Picea_mariana_branch_01_dead_LOD2_Color.png[39m[0m
474-[  86% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_brch_dead_Picea_mariana_branch_01_dead_n_LOD2_Normal.png[39m[0m
475-[  86% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_dead_Picea_mariana_fol_01_dead_a_LOD2_Transparency.png[39m[0m
476-[  87% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_dead_Picea_mariana_fol_01_dead_LOD2_Color.png[39m[0m
477-[  88% ] [90m[1mreimport[22m | fir_1.obj[39m[0m
478-WARNING: OBJ: Ambient light for material 'nature_bark_fir_07_m_0001.jpg' is ignored in PBR
479-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
480-WARNING: OBJ: Ambient light for material 'nature_bark_fir_05_m_0001.jpg' is ignored in PBR
481-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
482-WARNING: OBJ: Ambient light for material 'nature_bark_fir_02_m_0001.jpg' is ignored in PBR
483-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
484:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
485-   at: add_surface (scene/resources/mesh.cpp:1784)
486:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
487-   at: add_surface (scene/resources/mesh.cpp:1784)
488:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
489-   at: add_surface (scene/resources/mesh.cpp:1784)
490:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
491-   at: add_surface (scene/resources/mesh.cpp:1784)
492:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
493-   at: add_surface (scene/resources/mesh.cpp:1784)
494:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
495-   at: add_surface (scene/resources/mesh.cpp:1784)
496:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
497-   at: add_surface (scene/resources/mesh.cpp:1784)
498:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
499-   at: add_surface (scene/resources/mesh.cpp:1784)
500:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
501-   at: add_surface (scene/resources/mesh.cpp:1784)
502:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
503-   at: add_surface (scene/resources/mesh.cpp:1784)
504:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
505-   at: add_surface (scene/resources/mesh.cpp:1784)
506:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
507-   at: add_surface (scene/resources/mesh.cpp:1784)
508:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
509-   at: add_surface (scene/resources/mesh.cpp:1784)
510:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
511-   at: add_surface (scene/resources/mesh.cpp:1784)
512:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
513-   at: add_surface (scene/resources/mesh.cpp:1784)
514:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
515-   at: add_surface (scene/resources/mesh.cpp:1784)
516:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
517-   at: add_surface (scene/resources/mesh.cpp:1784)
518:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
519-   at: add_surface (scene/resources/mesh.cpp:1784)
520:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
521-   at: add_surface (scene/resources/mesh.cpp:1784)
522:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
523-   at: add_surface (scene/resources/mesh.cpp:1784)
524:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
525-   at: add_surface (scene/resources/mesh.cpp:1784)
526:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
527-   at: add_surface (scene/resources/mesh.cpp:1784)
528:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
529-   at: add_surface (scene/resources/mesh.cpp:1784)
530:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
531-   at: add_surface (scene/resources/mesh.cpp:1784)
532:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
533-   at: add_surface (scene/resources/mesh.cpp:1784)
534:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
535-   at: add_surface (scene/resources/mesh.cpp:1784)
536:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
537-   at: add_surface (scene/resources/mesh.cpp:1784)
538:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
539-   at: add_surface (scene/resources/mesh.cpp:1784)
540:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
541-   at: add_surface (scene/resources/mesh.cpp:1784)
542:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
543-   at: add_surface (scene/resources/mesh.cpp:1784)
544:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
545-   at: add_surface (scene/resources/mesh.cpp:1784)
546:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
547-   at: add_surface (scene/resources/mesh.cpp:1784)
548:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
549-   at: add_surface (scene/resources/mesh.cpp:1784)
550:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
551-   at: add_surface (scene/resources/mesh.cpp:1784)
552:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
553-   at: add_surface (scene/resources/mesh.cpp:1784)
554:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
555-   at: add_surface (scene/resources/mesh.cpp:1784)
556:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
557-   at: add_surface (scene/resources/mesh.cpp:1784)
558:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
559-   at: add_surface (scene/resources/mesh.cpp:1784)
560:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
561-   at: add_surface (scene/resources/mesh.cpp:1784)
562:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
563-   at: add_surface (scene/resources/mesh.cpp:1784)
564:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
565-   at: add_surface (scene/resources/mesh.cpp:1784)
566:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
567-   at: add_surface (scene/resources/mesh.cpp:1784)
568:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
569-   at: add_surface (scene/resources/mesh.cpp:1784)
570:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
571-   at: add_surface (scene/resources/mesh.cpp:1784)
572:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
573-   at: add_surface (scene/resources/mesh.cpp:1784)
574:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
575-   at: add_surface (scene/resources/mesh.cpp:1784)
576:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
577-   at: add_surface (scene/resources/mesh.cpp:1784)
578:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
579-   at: add_surface (scene/resources/mesh.cpp:1784)
580:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
581-   at: add_surface (scene/resources/mesh.cpp:1784)
582:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
583-   at: add_surface (scene/resources/mesh.cpp:1784)
584:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
585-   at: add_surface (scene/resources/mesh.cpp:1784)
586:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
587-   at: add_surface (scene/resources/mesh.cpp:1784)
588:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
589-   at: add_surface (scene/resources/mesh.cpp:1784)
590:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
591-   at: add_surface (scene/resources/mesh.cpp:1784)
592:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
593-   at: add_surface (scene/resources/mesh.cpp:1784)
594:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
595-   at: add_surface (scene/resources/mesh.cpp:1784)
596:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
597-   at: add_surface (scene/resources/mesh.cpp:1784)
598:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
599-   at: add_surface (scene/resources/mesh.cpp:1784)
600:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
601-   at: add_surface (scene/resources/mesh.cpp:1784)
602:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
603-   at: add_surface (scene/resources/mesh.cpp:1784)
604:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
605-   at: add_surface (scene/resources/mesh.cpp:1784)
606:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
607-   at: add_surface (scene/resources/mesh.cpp:1784)
608:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
609-   at: add_surface (scene/resources/mesh.cpp:1784)
610:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
611-   at: add_surface (scene/resources/mesh.cpp:1784)
612:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
613-   at: add_surface (scene/resources/mesh.cpp:1784)
614:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
615-   at: add_surface (scene/resources/mesh.cpp:1784)
616:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
617-   at: add_surface (scene/resources/mesh.cpp:1784)
618:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
619-   at: add_surface (scene/resources/mesh.cpp:1784)
620:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
621-   at: add_surface (scene/resources/mesh.cpp:1784)
622:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
623-   at: add_surface (scene/resources/mesh.cpp:1784)
624:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
625-   at: add_surface (scene/resources/mesh.cpp:1784)
626:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
627-   at: add_surface (scene/resources/mesh.cpp:1784)
628:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
629-   at: add_surface (scene/resources/mesh.cpp:1784)
630:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
631-   at: add_surface (scene/resources/mesh.cpp:1784)
632:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
633-   at: add_surface (scene/resources/mesh.cpp:1784)
634:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
635-   at: add_surface (scene/resources/mesh.cpp:1784)
636:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
637-   at: add_surface (scene/resources/mesh.cpp:1784)
638:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
639-   at: add_surface (scene/resources/mesh.cpp:1784)
640:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
641-   at: add_surface (scene/resources/mesh.cpp:1784)
642:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
643-   at: add_surface (scene/resources/mesh.cpp:1784)
644:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
645-   at: add_surface (scene/resources/mesh.cpp:1784)
646:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
647-   at: add_surface (scene/resources/mesh.cpp:1784)
648:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
649-   at: add_surface (scene/resources/mesh.cpp:1784)
650:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
651-   at: add_surface (scene/resources/mesh.cpp:1784)
652:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
653-   at: add_surface (scene/resources/mesh.cpp:1784)
654:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
655-   at: add_surface (scene/resources/mesh.cpp:1784)
656:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
657-   at: add_surface (scene/resources/mesh.cpp:1784)
658:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
659-   at: add_surface (scene/resources/mesh.cpp:1784)
660:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
661-   at: add_surface (scene/resources/mesh.cpp:1784)
662:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
663-   at: add_surface (scene/resources/mesh.cpp:1784)
664:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
665-   at: add_surface (scene/resources/mesh.cpp:1784)
666:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
667-   at: add_surface (scene/resources/mesh.cpp:1784)
668:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
669-   at: add_surface (scene/resources/mesh.cpp:1784)
670:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
671-   at: add_surface (scene/resources/mesh.cpp:1784)
672:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
673-   at: add_surface (scene/resources/mesh.cpp:1784)
674:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
675-   at: add_surface (scene/resources/mesh.cpp:1784)
676:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
677-   at: add_surface (scene/resources/mesh.cpp:1784)
678:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
679-   at: add_surface (scene/resources/mesh.cpp:1784)
680:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
681-   at: add_surface (scene/resources/mesh.cpp:1784)
682:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
683-   at: add_surface (scene/resources/mesh.cpp:1784)
684:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
685-   at: add_surface (scene/resources/mesh.cpp:1784)
686:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
687-   at: add_surface (scene/resources/mesh.cpp:1784)
688:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
689-   at: add_surface (scene/resources/mesh.cpp:1784)
690:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
691-   at: add_surface (scene/resources/mesh.cpp:1784)
692:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
693-   at: add_surface (scene/resources/mesh.cpp:1784)
694:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
695-   at: add_surface (scene/resources/mesh.cpp:1784)
696:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
697-   at: add_surface (scene/resources/mesh.cpp:1784)
698:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
699-   at: add_surface (scene/resources/mesh.cpp:1784)
700:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
701-   at: add_surface (scene/resources/mesh.cpp:1784)
702:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
703-   at: add_surface (scene/resources/mesh.cpp:1784)
704:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
705-   at: add_surface (scene/resources/mesh.cpp:1784)
706:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
707-   at: add_surface (scene/resources/mesh.cpp:1784)
708:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
709-   at: add_surface (scene/resources/mesh.cpp:1784)
710:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
711-   at: add_surface (scene/resources/mesh.cpp:1784)
712:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
713-   at: add_surface (scene/resources/mesh.cpp:1784)
714:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
715-   at: add_surface (scene/resources/mesh.cpp:1784)
716:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
717-   at: add_surface (scene/resources/mesh.cpp:1784)
718:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
719-   at: add_surface (scene/resources/mesh.cpp:1784)
720:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
721-   at: add_surface (scene/resources/mesh.cpp:1784)
722:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
723-   at: add_surface (scene/resources/mesh.cpp:1784)
724:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
725-   at: add_surface (scene/resources/mesh.cpp:1784)
726:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
727-   at: add_surface (scene/resources/mesh.cpp:1784)
728:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
729-   at: add_surface (scene/resources/mesh.cpp:1784)
730:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
731-   at: add_surface (scene/resources/mesh.cpp:1784)
732:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
733-   at: add_surface (scene/resources/mesh.cpp:1784)
734:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
735-   at: add_surface (scene/resources/mesh.cpp:1784)
736:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
737-   at: add_surface (scene/resources/mesh.cpp:1784)
738:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
739-   at: add_surface (scene/resources/mesh.cpp:1784)
740:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
741-   at: add_surface (scene/resources/mesh.cpp:1784)
742:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
743-   at: add_surface (scene/resources/mesh.cpp:1784)
744:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
745-   at: add_surface (scene/resources/mesh.cpp:1784)
746:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
747-   at: add_surface (scene/resources/mesh.cpp:1784)
748:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
749-   at: add_surface (scene/resources/mesh.cpp:1784)
750:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
751-   at: add_surface (scene/resources/mesh.cpp:1784)
752:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
753-   at: add_surface (scene/resources/mesh.cpp:1784)
754:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
755-   at: add_surface (scene/resources/mesh.cpp:1784)
756:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
757-   at: add_surface (scene/resources/mesh.cpp:1784)
758:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
759-   at: add_surface (scene/resources/mesh.cpp:1784)
760:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
761-   at: add_surface (scene/resources/mesh.cpp:1784)
762:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
763-   at: add_surface (scene/resources/mesh.cpp:1784)
764:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
765-   at: add_surface (scene/resources/mesh.cpp:1784)
766:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
767-   at: add_surface (scene/resources/mesh.cpp:1784)
768:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
769-   at: add_surface (scene/resources/mesh.cpp:1784)
770:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
771-   at: add_surface (scene/resources/mesh.cpp:1784)
772:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
773-   at: add_surface (scene/resources/mesh.cpp:1784)
774:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
775-   at: add_surface (scene/resources/mesh.cpp:1784)
776:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
777-   at: add_surface (scene/resources/mesh.cpp:1784)
778:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
779-   at: add_surface (scene/resources/mesh.cpp:1784)
780:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
781-   at: add_surface (scene/resources/mesh.cpp:1784)
782:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
783-   at: add_surface (scene/resources/mesh.cpp:1784)
784:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
785-   at: add_surface (scene/resources/mesh.cpp:1784)
786:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
787-   at: add_surface (scene/resources/mesh.cpp:1784)
788:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
789-   at: add_surface (scene/resources/mesh.cpp:1784)
790:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
791-   at: add_surface (scene/resources/mesh.cpp:1784)
792:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
793-   at: add_surface (scene/resources/mesh.cpp:1784)
794:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
795-   at: add_surface (scene/resources/mesh.cpp:1784)
796:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
797-   at: add_surface (scene/resources/mesh.cpp:1784)
798:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
799-   at: add_surface (scene/resources/mesh.cpp:1784)
800:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
801-   at: add_surface (scene/resources/mesh.cpp:1784)
802:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
803-   at: add_surface (scene/resources/mesh.cpp:1784)
804:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
805-   at: add_surface (scene/resources/mesh.cpp:1784)
806:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
807-   at: add_surface (scene/resources/mesh.cpp:1784)
808:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
809-   at: add_surface (scene/resources/mesh.cpp:1784)
810:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
811-   at: add_surface (scene/resources/mesh.cpp:1784)
812:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
813-   at: add_surface (scene/resources/mesh.cpp:1784)
814:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
815-   at: add_surface (scene/resources/mesh.cpp:1784)
816:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
817-   at: add_surface (scene/resources/mesh.cpp:1784)
818:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
819-   at: add_surface (scene/resources/mesh.cpp:1784)
820:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
821-   at: add_surface (scene/resources/mesh.cpp:1784)
822:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
823-   at: add_surface (scene/resources/mesh.cpp:1784)
824:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
825-   at: add_surface (scene/resources/mesh.cpp:1784)
826:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
827-   at: add_surface (scene/resources/mesh.cpp:1784)
828:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
829-   at: add_surface (scene/resources/mesh.cpp:1784)
830:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
831-   at: add_surface (scene/resources/mesh.cpp:1784)
832:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
833-   at: add_surface (scene/resources/mesh.cpp:1784)
834:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
835-   at: add_surface (scene/resources/mesh.cpp:1784)
836:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
837-   at: add_surface (scene/resources/mesh.cpp:1784)
838:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
839-   at: add_surface (scene/resources/mesh.cpp:1784)
840:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
841-   at: add_surface (scene/resources/mesh.cpp:1784)
842:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
843-   at: add_surface (scene/resources/mesh.cpp:1784)
844:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
845-   at: add_surface (scene/resources/mesh.cpp:1784)
846:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
847-   at: add_surface (scene/resources/mesh.cpp:1784)
848:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
849-   at: add_surface (scene/resources/mesh.cpp:1784)
850:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
851-   at: add_surface (scene/resources/mesh.cpp:1784)
852:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
853-   at: add_surface (scene/resources/mesh.cpp:1784)
854:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
855-   at: add_surface (scene/resources/mesh.cpp:1784)
856:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
857-   at: add_surface (scene/resources/mesh.cpp:1784)
858:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
859-   at: add_surface (scene/resources/mesh.cpp:1784)
860:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
861-   at: add_surface (scene/resources/mesh.cpp:1784)
862:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
863-   at: add_surface (scene/resources/mesh.cpp:1784)
864:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
865-   at: add_surface (scene/resources/mesh.cpp:1784)
866:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
867-   at: add_surface (scene/resources/mesh.cpp:1784)
868:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
869-   at: add_surface (scene/resources/mesh.cpp:1784)
870:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
871-   at: add_surface (scene/resources/mesh.cpp:1784)
872:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
873-   at: add_surface (scene/resources/mesh.cpp:1784)
874:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
875-   at: add_surface (scene/resources/mesh.cpp:1784)
876:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
877-   at: add_surface (scene/resources/mesh.cpp:1784)
878:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
879-   at: add_surface (scene/resources/mesh.cpp:1784)
880:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
881-   at: add_surface (scene/resources/mesh.cpp:1784)
882:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
883-   at: add_surface (scene/resources/mesh.cpp:1784)
884:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
885-   at: add_surface (scene/resources/mesh.cpp:1784)
886:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
887-   at: add_surface (scene/resources/mesh.cpp:1784)
888:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
889-   at: add_surface (scene/resources/mesh.cpp:1784)
890:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
891-   at: add_surface (scene/resources/mesh.cpp:1784)
892:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
893-   at: add_surface (scene/resources/mesh.cpp:1784)
894:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
895-   at: add_surface (scene/resources/mesh.cpp:1784)
896:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
897-   at: add_surface (scene/resources/mesh.cpp:1784)
898:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
899-   at: add_surface (scene/resources/mesh.cpp:1784)
900:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
901-   at: add_surface (scene/resources/mesh.cpp:1784)
902:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
903-   at: add_surface (scene/resources/mesh.cpp:1784)
904:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
905-   at: add_surface (scene/resources/mesh.cpp:1784)
906:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
907-   at: add_surface (scene/resources/mesh.cpp:1784)
908:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
909-   at: add_surface (scene/resources/mesh.cpp:1784)
910:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
911-   at: add_surface (scene/resources/mesh.cpp:1784)
912:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
913-   at: add_surface (scene/resources/mesh.cpp:1784)
914:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
915-   at: add_surface (scene/resources/mesh.cpp:1784)
916:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
917-   at: add_surface (scene/resources/mesh.cpp:1784)
918:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
919-   at: add_surface (scene/resources/mesh.cpp:1784)
920:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
921-   at: add_surface (scene/resources/mesh.cpp:1784)
922:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
923-   at: add_surface (scene/resources/mesh.cpp:1784)
924:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
925-   at: add_surface (scene/resources/mesh.cpp:1784)
926:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
927-   at: add_surface (scene/resources/mesh.cpp:1784)
928:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
929-   at: add_surface (scene/resources/mesh.cpp:1784)
930:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
931-   at: add_surface (scene/resources/mesh.cpp:1784)
932:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
933-   at: add_surface (scene/resources/mesh.cpp:1784)
934:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
935-   at: add_surface (scene/resources/mesh.cpp:1784)
936:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
937-   at: add_surface (scene/resources/mesh.cpp:1784)
938:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
939-   at: add_surface (scene/resources/mesh.cpp:1784)
940:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
941-   at: add_surface (scene/resources/mesh.cpp:1784)
942:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
943-   at: add_surface (scene/resources/mesh.cpp:1784)
944:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
945-   at: add_surface (scene/resources/mesh.cpp:1784)
946:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
947-   at: add_surface (scene/resources/mesh.cpp:1784)
948:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
949-   at: add_surface (scene/resources/mesh.cpp:1784)
950:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
951-   at: add_surface (scene/resources/mesh.cpp:1784)
952:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
953-   at: add_surface (scene/resources/mesh.cpp:1784)
954:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
955-   at: add_surface (scene/resources/mesh.cpp:1784)
956:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
957-   at: add_surface (scene/resources/mesh.cpp:1784)
958:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
959-   at: add_surface (scene/resources/mesh.cpp:1784)
960:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
961-   at: add_surface (scene/resources/mesh.cpp:1784)
962:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
963-   at: add_surface (scene/resources/mesh.cpp:1784)
964:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
965-   at: add_surface (scene/resources/mesh.cpp:1784)
966:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
967-   at: add_surface (scene/resources/mesh.cpp:1784)
968:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
969-   at: add_surface (scene/resources/mesh.cpp:1784)
970:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
971-   at: add_surface (scene/resources/mesh.cpp:1784)
972:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
973-   at: add_surface (scene/resources/mesh.cpp:1784)
974:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
975-   at: add_surface (scene/resources/mesh.cpp:1784)
976:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
977-   at: add_surface (scene/resources/mesh.cpp:1784)
978:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
979-   at: add_surface (scene/resources/mesh.cpp:1784)
980:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
981-   at: add_surface (scene/resources/mesh.cpp:1784)
982:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
983-   at: add_surface (scene/resources/mesh.cpp:1784)
984:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
985-   at: add_surface (scene/resources/mesh.cpp:1784)
986:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
987-   at: add_surface (scene/resources/mesh.cpp:1784)
988:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
989-   at: add_surface (scene/resources/mesh.cpp:1784)
990:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
991-   at: add_surface (scene/resources/mesh.cpp:1784)
992:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
993-   at: add_surface (scene/resources/mesh.cpp:1784)
994:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
995-   at: add_surface (scene/resources/mesh.cpp:1784)
996:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
997-   at: add_surface (scene/resources/mesh.cpp:1784)
998:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
999-   at: add_surface (scene/resources/mesh.cpp:1784)
1000:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1001-   at: add_surface (scene/resources/mesh.cpp:1784)
1002:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1003-   at: add_surface (scene/resources/mesh.cpp:1784)
1004:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1005-   at: add_surface (scene/resources/mesh.cpp:1784)
1006:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1007-   at: add_surface (scene/resources/mesh.cpp:1784)
1008:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1009-   at: add_surface (scene/resources/mesh.cpp:1784)
1010:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1011-   at: add_surface (scene/resources/mesh.cpp:1784)
1012:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1013-   at: add_surface (scene/resources/mesh.cpp:1784)
1014:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1015-   at: add_surface (scene/resources/mesh.cpp:1784)
1016:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1017-   at: add_surface (scene/resources/mesh.cpp:1784)
1018:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1019-   at: add_surface (scene/resources/mesh.cpp:1784)
1020:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1021-   at: add_surface (scene/resources/mesh.cpp:1784)
1022:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1023-   at: add_surface (scene/resources/mesh.cpp:1784)
1024:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1025-   at: add_surface (scene/resources/mesh.cpp:1784)
1026:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1027-   at: add_surface (scene/resources/mesh.cpp:1784)
1028:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1029-   at: add_surface (scene/resources/mesh.cpp:1784)
1030:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1031-   at: add_surface (scene/resources/mesh.cpp:1784)
1032:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1033-   at: add_surface (scene/resources/mesh.cpp:1784)
1034:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1035-   at: add_surface (scene/resources/mesh.cpp:1784)
1036:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1037-   at: add_surface (scene/resources/mesh.cpp:1784)
1038:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1039-   at: add_surface (scene/resources/mesh.cpp:1784)
1040:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1041-   at: add_surface (scene/resources/mesh.cpp:1784)
1042:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1043-   at: add_surface (scene/resources/mesh.cpp:1784)
1044:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1045-   at: add_surface (scene/resources/mesh.cpp:1784)
1046:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1047-   at: add_surface (scene/resources/mesh.cpp:1784)
1048:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1049-   at: add_surface (scene/resources/mesh.cpp:1784)
1050:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1051-   at: add_surface (scene/resources/mesh.cpp:1784)
1052:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1053-   at: add_surface (scene/resources/mesh.cpp:1784)
1054:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1055-   at: add_surface (scene/resources/mesh.cpp:1784)
1056:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1057-   at: add_surface (scene/resources/mesh.cpp:1784)
1058:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1059-   at: add_surface (scene/resources/mesh.cpp:1784)
1060:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1061-   at: add_surface (scene/resources/mesh.cpp:1784)
1062:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1063-   at: add_surface (scene/resources/mesh.cpp:1784)
1064:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1065-   at: add_surface (scene/resources/mesh.cpp:1784)
1066:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1067-   at: add_surface (scene/resources/mesh.cpp:1784)
1068:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1069-   at: add_surface (scene/resources/mesh.cpp:1784)
1070:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1071-   at: add_surface (scene/resources/mesh.cpp:1784)
1072:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1073-   at: add_surface (scene/resources/mesh.cpp:1784)
1074:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1075-   at: add_surface (scene/resources/mesh.cpp:1784)
1076:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1077-   at: add_surface (scene/resources/mesh.cpp:1784)
1078:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1079-   at: add_surface (scene/resources/mesh.cpp:1784)
1080:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1081-   at: add_surface (scene/resources/mesh.cpp:1784)
1082:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1083-   at: add_surface (scene/resources/mesh.cpp:1784)
1084:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1085-   at: add_surface (scene/resources/mesh.cpp:1784)
1086:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1087-   at: add_surface (scene/resources/mesh.cpp:1784)
1088:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1089-   at: add_surface (scene/resources/mesh.cpp:1784)
1090:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1091-   at: add_surface (scene/resources/mesh.cpp:1784)
1092:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1093-   at: add_surface (scene/resources/mesh.cpp:1784)
1094:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1095-   at: add_surface (scene/resources/mesh.cpp:1784)
1096:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1097-   at: add_surface (scene/resources/mesh.cpp:1784)
1098:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1099-   at: add_surface (scene/resources/mesh.cpp:1784)
1100:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1101-   at: add_surface (scene/resources/mesh.cpp:1784)
1102:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1103-   at: add_surface (scene/resources/mesh.cpp:1784)
1104:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1105-   at: add_surface (scene/resources/mesh.cpp:1784)
1106:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1107-   at: add_surface (scene/resources/mesh.cpp:1784)
1108:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1109-   at: add_surface (scene/resources/mesh.cpp:1784)
1110:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1111-   at: add_surface (scene/resources/mesh.cpp:1784)
1112:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1113-   at: add_surface (scene/resources/mesh.cpp:1784)
1114:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1115-   at: add_surface (scene/resources/mesh.cpp:1784)
1116:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1117-   at: add_surface (scene/resources/mesh.cpp:1784)
1118:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1119-   at: add_surface (scene/resources/mesh.cpp:1784)
1120:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1121-   at: add_surface (scene/resources/mesh.cpp:1784)
1122:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1123-   at: add_surface (scene/resources/mesh.cpp:1784)
1124:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1125-   at: add_surface (scene/resources/mesh.cpp:1784)
1126:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1127-   at: add_surface (scene/resources/mesh.cpp:1784)
1128:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1129-   at: add_surface (scene/resources/mesh.cpp:1784)
1130:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1131-   at: add_surface (scene/resources/mesh.cpp:1784)
1132:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1133-   at: add_surface (scene/resources/mesh.cpp:1784)
1134:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1135-   at: add_surface (scene/resources/mesh.cpp:1784)
1136:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1137-   at: add_surface (scene/resources/mesh.cpp:1784)
1138:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1139-   at: add_surface (scene/resources/mesh.cpp:1784)
1140:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1141-   at: add_surface (scene/resources/mesh.cpp:1784)
1142:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1143-   at: add_surface (scene/resources/mesh.cpp:1784)
1144:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1145-   at: add_surface (scene/resources/mesh.cpp:1784)
1146:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1147-   at: add_surface (scene/resources/mesh.cpp:1784)
1148:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1149-   at: add_surface (scene/resources/mesh.cpp:1784)
1150:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1151-   at: add_surface (scene/resources/mesh.cpp:1784)
1152:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1153-   at: add_surface (scene/resources/mesh.cpp:1784)
1154:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1155-   at: add_surface (scene/resources/mesh.cpp:1784)
1156:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1157-   at: add_surface (scene/resources/mesh.cpp:1784)
1158:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1159-   at: add_surface (scene/resources/mesh.cpp:1784)
1160:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1161-   at: add_surface (scene/resources/mesh.cpp:1784)
1162:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1163-   at: add_surface (scene/resources/mesh.cpp:1784)
1164:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1165-   at: add_surface (scene/resources/mesh.cpp:1784)
1166:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1167-   at: add_surface (scene/resources/mesh.cpp:1784)
1168:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1169-   at: add_surface (scene/resources/mesh.cpp:1784)
1170:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1171-   at: add_surface (scene/resources/mesh.cpp:1784)
```

## Last imported resources
```text
[  59% ] [90m[1mreimport[22m | BoiledOne_Details_AlbedoTransparency.png[39m[0m
[  60% ] [90m[1mreimport[22m | BoiledOne_Eyes_AlbedoTransparency.png[39m[0m
[  61% ] [90m[1mreimport[22m | BoiledOne_GumsMaterial_AlbedoTransparency.png[39m[0m
[  61% ] [90m[1mreimport[22m | BoiledOne_TeethMaterial_AlbedoTransparency.png[39m[0m
[  62% ] [90m[1mreimport[22m | PNG.png[39m[0m
[  63% ] [90m[1mreimport[22m | locust_basecolor_tex.png[39m[0m
[  63% ] [90m[1mreimport[22m | locust_fibers_tex.png[39m[0m
[  64% ] [90m[1mreimport[22m | locust_metallic_tex.png[39m[0m
[  65% ] [90m[1mreimport[22m | locust_normal_tex.png[39m[0m
[  65% ] [90m[1mreimport[22m | locust_roughness_tex.png[39m[0m
[  66% ] [90m[1mreimport[22m | Grass1.png[39m[0m
[  67% ] [90m[1mreimport[22m | Grass1_AO.png[39m[0m
[  68% ] [90m[1mreimport[22m | Grass1_Gloss.png[39m[0m
[  68% ] [90m[1mreimport[22m | Grass1_Normal.png[39m[0m
[  69% ] [90m[1mreimport[22m | Grass1_Opacity.png[39m[0m
[  70% ] [90m[1mreimport[22m | Grass2.png[39m[0m
[  70% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_Picea_mariana_fol_01_bl_LOD2_BackLight.png[39m[0m
[  71% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_Picea_mariana_fol_01_gray_LOD2_Color.png[39m[0m
[  72% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_Picea_mariana_fol_01_hl_LOD2_Specular.png[39m[0m
[  72% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_bark_1_Picea_mariana_bark_01_n_LOD0_Normal.png[39m[0m
[  73% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_Picea_mariana_fol_01_n_LOD2_Normal.png[39m[0m
[  74% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_long_Picea_mariana_fol_02_long_a_LOD2_Transparency.png[39m[0m
[  75% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_long_Picea_mariana_fol_02_long_bl_LOD2_BackLight.png[39m[0m
[  75% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_long_Picea_mariana_fol_02_long_gray_LOD2_Color.png[39m[0m
[  76% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_bark_1_Picea_mariana_bark_01_LOD0_Color.png[39m[0m
[  77% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_long_Picea_mariana_fol_02_long_hl_LOD2_Specular.png[39m[0m
[  77% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_long_Picea_mariana_fol_02_long_n_LOD2_Normal.png[39m[0m
[  78% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_a_LOD2_Transparency.png[39m[0m
[  79% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_bl_LOD2_BackLight.png[39m[0m
[  79% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_gray_LOD2_Color.png[39m[0m
[  80% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_trunk_cut_01_n_LOD2_Normal.png[39m[0m
[  81% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_n_LOD2_Normal.png[39m[0m
[  81% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_hl_LOD2_Specular.png[39m[0m
[  82% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_branch_01_LOD2_Color.png[39m[0m
[  83% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_branch_01_n_LOD2_Normal.png[39m[0m
[  84% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_brch_cut_02_Picea_branch_cut_01b_LOD2_Color.png[39m[0m
[  84% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_brch_cut_02_Picea_branch_cut_01_n_LOD2_Normal.png[39m[0m
[  85% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_brch_dead_Picea_mariana_branch_01_dead_LOD2_Color.png[39m[0m
[  86% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_brch_dead_Picea_mariana_branch_01_dead_n_LOD2_Normal.png[39m[0m
[  86% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_dead_Picea_mariana_fol_01_dead_a_LOD2_Transparency.png[39m[0m
[  87% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_dead_Picea_mariana_fol_01_dead_LOD2_Color.png[39m[0m
[  88% ] [90m[1mreimport[22m | fir_1.obj[39m[0m
[  88% ] [90m[1mreimport[22m | fir_2.obj[39m[0m
[  89% ] [90m[1mreimport[22m | fir_3.obj[39m[0m
[  90% ] [90m[1mreimport[22m | fir_4.obj[39m[0m
[  90% ] [90m[1mreimport[22m | firs.obj[39m[0m
[  91% ] [90m[1mreimport[22m | Tree_Pack.obj[39m[0m
[  92% ] [90m[1mreimport[22m | Picea mariana HD_Arctic mat 100_LOD0.fbx[39m[0m
[  93% ] [90m[1mreimport[22m | Pickup Afghanistan.fbx[39m[0m
[  93% ] [90m[1mreimport[22m | BoiledOne.fbx[39m[0m
[  94% ] [90m[1mreimport[22m | T_O_E Locust - By Doumty.fbx[39m[0m
[  95% ] [90m[1mreimport[22m | document_file_folder (1).glb[39m[0m
[  95% ] [90m[1mreimport[22m | Grass.fbx[39m[0m
[  96% ] [90m[1mreimport[22m | flashlightfbx.fbx[39m[0m
[  97% ] [90m[1mreimport[22m | fpsarms.fbx[39m[0m
[  97% ] [90m[1mreimport[22m | Tree_Pack.fbx[39m[0m
[  98% ] [90m[1mreimport[22m | Picea mariana HD_Arctic mat 100_LOD2.fbx[39m[0m
[  99% ] [90m[1mreimport[22m | Finalizing Asset Import...[39m[0m
[   0% ] [90m[1mreimport[22m | Started (Re)Importing Assets (143 steps)[39m[0m
[   0% ] [90m[1mreimport[22m | Executing post-reimport operations...[39m[0m
```

## Import log tail
```text
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
ERROR: Failed loading resource: C:/Users/Mazen/Desktop/FOREST_TREE_PACK/TEXTURES/TREES_HIGH_POLY/Tree_Branches_2_Diffuse.png.
   at: _load (core/io/resource_loader.cpp:317)
ERROR: Failed loading resource: C:/Users/Mazen/Desktop/FOREST_TREE_PACK/TEXTURES/TREES_HIGH_POLY/Tree_Branches_Roughness.png.
   at: _load (core/io/resource_loader.cpp:317)
ERROR: Failed loading resource: res://assets/environment/trees/low_poly_pack/source/C:/Users/Mazen/Desktop/FOREST_TREE_PACK/TEXTURES/TREES_HIGH_POLY/Tree_Branches_Normal.png.
   at: _load (core/io/resource_loader.cpp:317)
WARNING: OBJ: Ambient light for material 'Tree_Trunk_01' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
ERROR: Failed loading resource: C:/Users/Mazen/Desktop/FOREST_TREE_PACK/TEXTURES/TREES_HIGH_POLY/Tree_Trunk_01_Roughness.png.
   at: _load (core/io/resource_loader.cpp:317)
ERROR: Failed loading resource: res://assets/environment/trees/low_poly_pack/source/C:/Users/Mazen/Desktop/FOREST_TREE_PACK/TEXTURES/TREES_HIGH_POLY/Tree_Trunk_01_Normal.png.
   at: _load (core/io/resource_loader.cpp:317)
WARNING: OBJ: Ambient light for material 'Tree_Trunk_02' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
ERROR: Failed loading resource: C:/Users/Mazen/Desktop/FOREST_TREE_PACK/TEXTURES/TREES_HIGH_POLY/Tree_Trunk_02_Roughness.png.
   at: _load (core/io/resource_loader.cpp:317)
ERROR: Failed loading resource: res://assets/environment/trees/low_poly_pack/source/C:/Users/Mazen/Desktop/FOREST_TREE_PACK/TEXTURES/TREES_HIGH_POLY/Tree_Trunk_02_Normal.png.
   at: _load (core/io/resource_loader.cpp:317)
[  92% ] [90m[1mreimport[22m | Picea mariana HD_Arctic mat 100_LOD0.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  93% ] [90m[1mreimport[22m | Pickup Afghanistan.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  93% ] [90m[1mreimport[22m | BoiledOne.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  94% ] [90m[1mreimport[22m | T_O_E Locust - By Doumty.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  95% ] [90m[1mreimport[22m | document_file_folder (1).glb[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  95% ] [90m[1mreimport[22m | Grass.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  96% ] [90m[1mreimport[22m | flashlightfbx.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  97% ] [90m[1mreimport[22m | fpsarms.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  97% ] [90m[1mreimport[22m | Tree_Pack.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/ROCKS_DIFFUSE.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '4' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/ROCKS_DIFFUSE.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/ROCKS_NORMALtest.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '5' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/ROCKS_NORMALtest.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/ROCKS_ROUGHNESS.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '6' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/ROCKS_ROUGHNESS.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  98% ] [90m[1mreimport[22m | Picea mariana HD_Arctic mat 100_LOD2.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  99% ] [90m[1mreimport[22m | Finalizing Asset Import...[39m[0m
[92m[ DONE ][39m [1mreimport[22m
[0m
[   0% ] [90m[1mreimport[22m | Started (Re)Importing Assets (143 steps)[39m[0m
[   0% ] [90m[1mreimport[22m | Executing post-reimport operations...[39m[0m
[92m[ DONE ][39m [1mreimport[22m
[0m
[   0% ] [90m[1mloading_editor_layout[22m | Started Loading editor (5 steps)[39m[0m
[   0% ] [90m[1mloading_editor_layout[22m | Loading editor layout...[39m[0m
[  16% ] [90m[1mloading_editor_layout[22m | Loading docks...[39m[0m
[92m[ DONE ][39m [1mloading_editor_layout[22m
[0m
cannot connect to daemon at tcp:5037: Connection refused
```

## Main-menu smoke
```text
Skipped because import failed.
```

## Gameplay smoke
```text
Skipped because import failed.
```

## Floor/tree physics
```text
Skipped because import failed.
```

## Asset inspector
```text
Skipped because import failed.
```
