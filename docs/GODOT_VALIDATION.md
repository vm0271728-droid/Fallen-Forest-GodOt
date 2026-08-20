# Godot validation status

- Engine: Godot 4.7.1 stable
- Branch: `fix/android11-integrity`
- Tested commit: `2cce87c4d462ba665f86cb03700635d473cc8964`
- Full asset import exit code: `1`
- Main-menu smoke-test exit code: `0`
- Gameplay smoke-test exit code: `0`
- Runtime floor/tree physics exit code: `0`
- Asset inspection exit code: `0`
- Overall exit code: `1`
- Result: **FAIL**

## MAX_MESH_SURFACES context
```text
529-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
530-ERROR: Failed loading resource: C:/Users/Mazen/Desktop/FOREST_TREE_PACK/TEXTURES/TREES_HIGH_POLY/Tree_Trunk_02_Roughness.png.
531-   at: _load (core/io/resource_loader.cpp:317)
532-ERROR: Failed loading resource: res://assets/environment/trees/low_poly_pack/source/C:/Users/Mazen/Desktop/FOREST_TREE_PACK/TEXTURES/TREES_HIGH_POLY/Tree_Trunk_02_Normal.png.
533-   at: _load (core/io/resource_loader.cpp:317)
534-[  89% ] [90m[1mreimport[22m | firs.obj[39m[0m
535-WARNING: OBJ: Ambient light for material 'nature_bark_fir_07_m_0001.jpg' is ignored in PBR
536-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
537-WARNING: OBJ: Ambient light for material 'nature_bark_fir_05_m_0001.jpg' is ignored in PBR
538-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
539-WARNING: OBJ: Ambient light for material 'nature_bark_fir_02_m_0001.jpg' is ignored in PBR
540-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
541:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
542-   at: add_surface (scene/resources/mesh.cpp:1784)
543:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
544-   at: add_surface (scene/resources/mesh.cpp:1784)
545:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
546-   at: add_surface (scene/resources/mesh.cpp:1784)
547:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
548-   at: add_surface (scene/resources/mesh.cpp:1784)
549:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
550-   at: add_surface (scene/resources/mesh.cpp:1784)
551:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
552-   at: add_surface (scene/resources/mesh.cpp:1784)
553:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
554-   at: add_surface (scene/resources/mesh.cpp:1784)
555:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
556-   at: add_surface (scene/resources/mesh.cpp:1784)
557:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
558-   at: add_surface (scene/resources/mesh.cpp:1784)
559:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
560-   at: add_surface (scene/resources/mesh.cpp:1784)
561:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
562-   at: add_surface (scene/resources/mesh.cpp:1784)
563:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
564-   at: add_surface (scene/resources/mesh.cpp:1784)
565:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
566-   at: add_surface (scene/resources/mesh.cpp:1784)
567:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
568-   at: add_surface (scene/resources/mesh.cpp:1784)
569:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
570-   at: add_surface (scene/resources/mesh.cpp:1784)
571:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
572-   at: add_surface (scene/resources/mesh.cpp:1784)
573:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
574-   at: add_surface (scene/resources/mesh.cpp:1784)
575:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
576-   at: add_surface (scene/resources/mesh.cpp:1784)
577:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
578-   at: add_surface (scene/resources/mesh.cpp:1784)
579:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
580-   at: add_surface (scene/resources/mesh.cpp:1784)
581:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
582-   at: add_surface (scene/resources/mesh.cpp:1784)
583:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
584-   at: add_surface (scene/resources/mesh.cpp:1784)
585:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
586-   at: add_surface (scene/resources/mesh.cpp:1784)
587:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
588-   at: add_surface (scene/resources/mesh.cpp:1784)
589:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
590-   at: add_surface (scene/resources/mesh.cpp:1784)
591:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
592-   at: add_surface (scene/resources/mesh.cpp:1784)
593:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
594-   at: add_surface (scene/resources/mesh.cpp:1784)
595:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
596-   at: add_surface (scene/resources/mesh.cpp:1784)
597:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
598-   at: add_surface (scene/resources/mesh.cpp:1784)
599:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
600-   at: add_surface (scene/resources/mesh.cpp:1784)
601:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
602-   at: add_surface (scene/resources/mesh.cpp:1784)
603:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
604-   at: add_surface (scene/resources/mesh.cpp:1784)
605:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
606-   at: add_surface (scene/resources/mesh.cpp:1784)
607:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
608-   at: add_surface (scene/resources/mesh.cpp:1784)
609:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
610-   at: add_surface (scene/resources/mesh.cpp:1784)
611:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
612-   at: add_surface (scene/resources/mesh.cpp:1784)
613:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
614-   at: add_surface (scene/resources/mesh.cpp:1784)
615:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
616-   at: add_surface (scene/resources/mesh.cpp:1784)
617:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
618-   at: add_surface (scene/resources/mesh.cpp:1784)
619:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
620-   at: add_surface (scene/resources/mesh.cpp:1784)
621:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
622-   at: add_surface (scene/resources/mesh.cpp:1784)
623:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
624-   at: add_surface (scene/resources/mesh.cpp:1784)
625:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
626-   at: add_surface (scene/resources/mesh.cpp:1784)
627:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
628-   at: add_surface (scene/resources/mesh.cpp:1784)
629:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
630-   at: add_surface (scene/resources/mesh.cpp:1784)
631:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
632-   at: add_surface (scene/resources/mesh.cpp:1784)
633:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
634-   at: add_surface (scene/resources/mesh.cpp:1784)
635:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
636-   at: add_surface (scene/resources/mesh.cpp:1784)
637:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
638-   at: add_surface (scene/resources/mesh.cpp:1784)
639:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
640-   at: add_surface (scene/resources/mesh.cpp:1784)
641:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
642-   at: add_surface (scene/resources/mesh.cpp:1784)
643:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
644-   at: add_surface (scene/resources/mesh.cpp:1784)
645:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
646-   at: add_surface (scene/resources/mesh.cpp:1784)
647:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
648-   at: add_surface (scene/resources/mesh.cpp:1784)
649:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
650-   at: add_surface (scene/resources/mesh.cpp:1784)
651:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
652-   at: add_surface (scene/resources/mesh.cpp:1784)
653:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
654-   at: add_surface (scene/resources/mesh.cpp:1784)
655:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
656-   at: add_surface (scene/resources/mesh.cpp:1784)
657:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
658-   at: add_surface (scene/resources/mesh.cpp:1784)
659:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
660-   at: add_surface (scene/resources/mesh.cpp:1784)
661:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
662-   at: add_surface (scene/resources/mesh.cpp:1784)
663:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
664-   at: add_surface (scene/resources/mesh.cpp:1784)
665:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
666-   at: add_surface (scene/resources/mesh.cpp:1784)
667:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
668-   at: add_surface (scene/resources/mesh.cpp:1784)
669:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
670-   at: add_surface (scene/resources/mesh.cpp:1784)
671:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
672-   at: add_surface (scene/resources/mesh.cpp:1784)
673:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
674-   at: add_surface (scene/resources/mesh.cpp:1784)
675:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
676-   at: add_surface (scene/resources/mesh.cpp:1784)
677:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
678-   at: add_surface (scene/resources/mesh.cpp:1784)
679:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
680-   at: add_surface (scene/resources/mesh.cpp:1784)
681:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
682-   at: add_surface (scene/resources/mesh.cpp:1784)
683:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
684-   at: add_surface (scene/resources/mesh.cpp:1784)
685:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
686-   at: add_surface (scene/resources/mesh.cpp:1784)
687:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
688-   at: add_surface (scene/resources/mesh.cpp:1784)
689:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
690-   at: add_surface (scene/resources/mesh.cpp:1784)
691:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
692-   at: add_surface (scene/resources/mesh.cpp:1784)
693:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
694-   at: add_surface (scene/resources/mesh.cpp:1784)
695:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
696-   at: add_surface (scene/resources/mesh.cpp:1784)
697:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
698-   at: add_surface (scene/resources/mesh.cpp:1784)
699:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
700-   at: add_surface (scene/resources/mesh.cpp:1784)
701:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
702-   at: add_surface (scene/resources/mesh.cpp:1784)
703:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
704-   at: add_surface (scene/resources/mesh.cpp:1784)
705:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
706-   at: add_surface (scene/resources/mesh.cpp:1784)
707:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
708-   at: add_surface (scene/resources/mesh.cpp:1784)
709:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
710-   at: add_surface (scene/resources/mesh.cpp:1784)
711:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
712-   at: add_surface (scene/resources/mesh.cpp:1784)
713:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
714-   at: add_surface (scene/resources/mesh.cpp:1784)
715:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
716-   at: add_surface (scene/resources/mesh.cpp:1784)
717:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
718-   at: add_surface (scene/resources/mesh.cpp:1784)
719:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
720-   at: add_surface (scene/resources/mesh.cpp:1784)
721:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
722-   at: add_surface (scene/resources/mesh.cpp:1784)
723:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
724-   at: add_surface (scene/resources/mesh.cpp:1784)
725:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
726-   at: add_surface (scene/resources/mesh.cpp:1784)
727:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
728-   at: add_surface (scene/resources/mesh.cpp:1784)
729:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
730-   at: add_surface (scene/resources/mesh.cpp:1784)
731:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
732-   at: add_surface (scene/resources/mesh.cpp:1784)
733:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
734-   at: add_surface (scene/resources/mesh.cpp:1784)
735:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
736-   at: add_surface (scene/resources/mesh.cpp:1784)
737:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
738-   at: add_surface (scene/resources/mesh.cpp:1784)
739:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
740-   at: add_surface (scene/resources/mesh.cpp:1784)
741:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
742-   at: add_surface (scene/resources/mesh.cpp:1784)
743:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
744-   at: add_surface (scene/resources/mesh.cpp:1784)
745:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
746-   at: add_surface (scene/resources/mesh.cpp:1784)
747:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
748-   at: add_surface (scene/resources/mesh.cpp:1784)
749:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
750-   at: add_surface (scene/resources/mesh.cpp:1784)
751:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
752-   at: add_surface (scene/resources/mesh.cpp:1784)
753:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
754-   at: add_surface (scene/resources/mesh.cpp:1784)
755:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
756-   at: add_surface (scene/resources/mesh.cpp:1784)
757:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
758-   at: add_surface (scene/resources/mesh.cpp:1784)
759:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
760-   at: add_surface (scene/resources/mesh.cpp:1784)
761:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
762-   at: add_surface (scene/resources/mesh.cpp:1784)
763:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
764-   at: add_surface (scene/resources/mesh.cpp:1784)
765:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
766-   at: add_surface (scene/resources/mesh.cpp:1784)
767:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
768-   at: add_surface (scene/resources/mesh.cpp:1784)
769:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
770-   at: add_surface (scene/resources/mesh.cpp:1784)
771:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
772-   at: add_surface (scene/resources/mesh.cpp:1784)
773:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
774-   at: add_surface (scene/resources/mesh.cpp:1784)
775:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
776-   at: add_surface (scene/resources/mesh.cpp:1784)
777:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
778-   at: add_surface (scene/resources/mesh.cpp:1784)
779:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
780-   at: add_surface (scene/resources/mesh.cpp:1784)
781:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
782-   at: add_surface (scene/resources/mesh.cpp:1784)
783:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
784-   at: add_surface (scene/resources/mesh.cpp:1784)
785:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
786-   at: add_surface (scene/resources/mesh.cpp:1784)
787:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
788-   at: add_surface (scene/resources/mesh.cpp:1784)
789:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
790-   at: add_surface (scene/resources/mesh.cpp:1784)
791:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
792-   at: add_surface (scene/resources/mesh.cpp:1784)
793:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
794-   at: add_surface (scene/resources/mesh.cpp:1784)
795:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
796-   at: add_surface (scene/resources/mesh.cpp:1784)
797:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
798-   at: add_surface (scene/resources/mesh.cpp:1784)
799:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
800-   at: add_surface (scene/resources/mesh.cpp:1784)
801:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
802-   at: add_surface (scene/resources/mesh.cpp:1784)
803:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
804-   at: add_surface (scene/resources/mesh.cpp:1784)
805:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
806-   at: add_surface (scene/resources/mesh.cpp:1784)
807:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
808-   at: add_surface (scene/resources/mesh.cpp:1784)
809:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
810-   at: add_surface (scene/resources/mesh.cpp:1784)
811:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
812-   at: add_surface (scene/resources/mesh.cpp:1784)
813:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
814-   at: add_surface (scene/resources/mesh.cpp:1784)
815:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
816-   at: add_surface (scene/resources/mesh.cpp:1784)
817:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
818-   at: add_surface (scene/resources/mesh.cpp:1784)
819:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
820-   at: add_surface (scene/resources/mesh.cpp:1784)
821:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
822-   at: add_surface (scene/resources/mesh.cpp:1784)
823:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
824-   at: add_surface (scene/resources/mesh.cpp:1784)
825:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
826-   at: add_surface (scene/resources/mesh.cpp:1784)
827:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
828-   at: add_surface (scene/resources/mesh.cpp:1784)
829:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
830-   at: add_surface (scene/resources/mesh.cpp:1784)
831:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
832-   at: add_surface (scene/resources/mesh.cpp:1784)
833:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
834-   at: add_surface (scene/resources/mesh.cpp:1784)
835:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
836-   at: add_surface (scene/resources/mesh.cpp:1784)
837:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
838-   at: add_surface (scene/resources/mesh.cpp:1784)
839:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
840-   at: add_surface (scene/resources/mesh.cpp:1784)
841:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
842-   at: add_surface (scene/resources/mesh.cpp:1784)
843:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
844-   at: add_surface (scene/resources/mesh.cpp:1784)
845:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
846-   at: add_surface (scene/resources/mesh.cpp:1784)
847:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
848-   at: add_surface (scene/resources/mesh.cpp:1784)
849:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
850-   at: add_surface (scene/resources/mesh.cpp:1784)
851:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
852-   at: add_surface (scene/resources/mesh.cpp:1784)
853:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
854-   at: add_surface (scene/resources/mesh.cpp:1784)
855:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
856-   at: add_surface (scene/resources/mesh.cpp:1784)
857:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
858-   at: add_surface (scene/resources/mesh.cpp:1784)
859:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
860-   at: add_surface (scene/resources/mesh.cpp:1784)
861:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
862-   at: add_surface (scene/resources/mesh.cpp:1784)
863:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
864-   at: add_surface (scene/resources/mesh.cpp:1784)
865:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
866-   at: add_surface (scene/resources/mesh.cpp:1784)
867:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
868-   at: add_surface (scene/resources/mesh.cpp:1784)
869:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
870-   at: add_surface (scene/resources/mesh.cpp:1784)
871:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
872-   at: add_surface (scene/resources/mesh.cpp:1784)
873:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
874-   at: add_surface (scene/resources/mesh.cpp:1784)
875:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
876-   at: add_surface (scene/resources/mesh.cpp:1784)
877:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
878-   at: add_surface (scene/resources/mesh.cpp:1784)
879:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
880-   at: add_surface (scene/resources/mesh.cpp:1784)
881:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
882-   at: add_surface (scene/resources/mesh.cpp:1784)
883:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
884-   at: add_surface (scene/resources/mesh.cpp:1784)
885:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
886-   at: add_surface (scene/resources/mesh.cpp:1784)
887:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
888-   at: add_surface (scene/resources/mesh.cpp:1784)
889:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
890-   at: add_surface (scene/resources/mesh.cpp:1784)
891:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
892-   at: add_surface (scene/resources/mesh.cpp:1784)
893:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
894-   at: add_surface (scene/resources/mesh.cpp:1784)
895:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
896-   at: add_surface (scene/resources/mesh.cpp:1784)
897:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
898-   at: add_surface (scene/resources/mesh.cpp:1784)
899:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
900-   at: add_surface (scene/resources/mesh.cpp:1784)
901:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
902-   at: add_surface (scene/resources/mesh.cpp:1784)
903:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
904-   at: add_surface (scene/resources/mesh.cpp:1784)
905:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
906-   at: add_surface (scene/resources/mesh.cpp:1784)
907:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
908-   at: add_surface (scene/resources/mesh.cpp:1784)
909:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
910-   at: add_surface (scene/resources/mesh.cpp:1784)
911:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
912-   at: add_surface (scene/resources/mesh.cpp:1784)
913:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
914-   at: add_surface (scene/resources/mesh.cpp:1784)
915:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
916-   at: add_surface (scene/resources/mesh.cpp:1784)
917:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
918-   at: add_surface (scene/resources/mesh.cpp:1784)
919:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
920-   at: add_surface (scene/resources/mesh.cpp:1784)
921:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
922-   at: add_surface (scene/resources/mesh.cpp:1784)
923:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
924-   at: add_surface (scene/resources/mesh.cpp:1784)
925:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
926-   at: add_surface (scene/resources/mesh.cpp:1784)
927:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
928-   at: add_surface (scene/resources/mesh.cpp:1784)
929:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
930-   at: add_surface (scene/resources/mesh.cpp:1784)
931:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
932-   at: add_surface (scene/resources/mesh.cpp:1784)
933:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
934-   at: add_surface (scene/resources/mesh.cpp:1784)
935:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
936-   at: add_surface (scene/resources/mesh.cpp:1784)
937:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
938-   at: add_surface (scene/resources/mesh.cpp:1784)
939:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
940-   at: add_surface (scene/resources/mesh.cpp:1784)
941:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
942-   at: add_surface (scene/resources/mesh.cpp:1784)
943:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
944-   at: add_surface (scene/resources/mesh.cpp:1784)
945:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
946-   at: add_surface (scene/resources/mesh.cpp:1784)
947:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
948-   at: add_surface (scene/resources/mesh.cpp:1784)
949:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
950-   at: add_surface (scene/resources/mesh.cpp:1784)
951:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
952-   at: add_surface (scene/resources/mesh.cpp:1784)
953:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
954-   at: add_surface (scene/resources/mesh.cpp:1784)
955:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
956-   at: add_surface (scene/resources/mesh.cpp:1784)
957:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
958-   at: add_surface (scene/resources/mesh.cpp:1784)
959:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
960-   at: add_surface (scene/resources/mesh.cpp:1784)
961:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
962-   at: add_surface (scene/resources/mesh.cpp:1784)
963:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
964-   at: add_surface (scene/resources/mesh.cpp:1784)
965:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
966-   at: add_surface (scene/resources/mesh.cpp:1784)
967:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
968-   at: add_surface (scene/resources/mesh.cpp:1784)
969:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
970-   at: add_surface (scene/resources/mesh.cpp:1784)
971:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
972-   at: add_surface (scene/resources/mesh.cpp:1784)
973:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
974-   at: add_surface (scene/resources/mesh.cpp:1784)
975:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
976-   at: add_surface (scene/resources/mesh.cpp:1784)
977:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
978-   at: add_surface (scene/resources/mesh.cpp:1784)
979:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
980-   at: add_surface (scene/resources/mesh.cpp:1784)
981:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
982-   at: add_surface (scene/resources/mesh.cpp:1784)
983:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
984-   at: add_surface (scene/resources/mesh.cpp:1784)
985:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
986-   at: add_surface (scene/resources/mesh.cpp:1784)
987:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
988-   at: add_surface (scene/resources/mesh.cpp:1784)
989:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
990-   at: add_surface (scene/resources/mesh.cpp:1784)
991:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
992-   at: add_surface (scene/resources/mesh.cpp:1784)
993:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
994-   at: add_surface (scene/resources/mesh.cpp:1784)
995:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
996-   at: add_surface (scene/resources/mesh.cpp:1784)
997:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
998-   at: add_surface (scene/resources/mesh.cpp:1784)
999:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1000-   at: add_surface (scene/resources/mesh.cpp:1784)
1001:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1002-   at: add_surface (scene/resources/mesh.cpp:1784)
1003:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1004-   at: add_surface (scene/resources/mesh.cpp:1784)
1005:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1006-   at: add_surface (scene/resources/mesh.cpp:1784)
1007:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1008-   at: add_surface (scene/resources/mesh.cpp:1784)
1009:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1010-   at: add_surface (scene/resources/mesh.cpp:1784)
1011:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1012-   at: add_surface (scene/resources/mesh.cpp:1784)
1013:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1014-   at: add_surface (scene/resources/mesh.cpp:1784)
1015:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1016-   at: add_surface (scene/resources/mesh.cpp:1784)
1017:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1018-   at: add_surface (scene/resources/mesh.cpp:1784)
1019:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1020-   at: add_surface (scene/resources/mesh.cpp:1784)
1021:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1022-   at: add_surface (scene/resources/mesh.cpp:1784)
1023:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1024-   at: add_surface (scene/resources/mesh.cpp:1784)
1025:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1026-   at: add_surface (scene/resources/mesh.cpp:1784)
1027:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1028-   at: add_surface (scene/resources/mesh.cpp:1784)
1029:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1030-   at: add_surface (scene/resources/mesh.cpp:1784)
1031:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1032-   at: add_surface (scene/resources/mesh.cpp:1784)
1033:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1034-   at: add_surface (scene/resources/mesh.cpp:1784)
1035:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1036-   at: add_surface (scene/resources/mesh.cpp:1784)
1037:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1038-   at: add_surface (scene/resources/mesh.cpp:1784)
1039:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1040-   at: add_surface (scene/resources/mesh.cpp:1784)
1041:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1042-   at: add_surface (scene/resources/mesh.cpp:1784)
1043:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1044-   at: add_surface (scene/resources/mesh.cpp:1784)
1045:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1046-   at: add_surface (scene/resources/mesh.cpp:1784)
1047:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1048-   at: add_surface (scene/resources/mesh.cpp:1784)
1049:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1050-   at: add_surface (scene/resources/mesh.cpp:1784)
1051:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1052-   at: add_surface (scene/resources/mesh.cpp:1784)
1053:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1054-   at: add_surface (scene/resources/mesh.cpp:1784)
1055:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1056-   at: add_surface (scene/resources/mesh.cpp:1784)
1057:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1058-   at: add_surface (scene/resources/mesh.cpp:1784)
1059:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1060-   at: add_surface (scene/resources/mesh.cpp:1784)
1061:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1062-   at: add_surface (scene/resources/mesh.cpp:1784)
1063:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1064-   at: add_surface (scene/resources/mesh.cpp:1784)
1065:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1066-   at: add_surface (scene/resources/mesh.cpp:1784)
1067:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1068-   at: add_surface (scene/resources/mesh.cpp:1784)
1069:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1070-   at: add_surface (scene/resources/mesh.cpp:1784)
1071:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1072-   at: add_surface (scene/resources/mesh.cpp:1784)
1073:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1074-   at: add_surface (scene/resources/mesh.cpp:1784)
1075:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1076-   at: add_surface (scene/resources/mesh.cpp:1784)
1077:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1078-   at: add_surface (scene/resources/mesh.cpp:1784)
1079:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1080-   at: add_surface (scene/resources/mesh.cpp:1784)
1081:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1082-   at: add_surface (scene/resources/mesh.cpp:1784)
1083:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1084-   at: add_surface (scene/resources/mesh.cpp:1784)
1085:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1086-   at: add_surface (scene/resources/mesh.cpp:1784)
1087:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1088-   at: add_surface (scene/resources/mesh.cpp:1784)
1089:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1090-   at: add_surface (scene/resources/mesh.cpp:1784)
1091:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1092-   at: add_surface (scene/resources/mesh.cpp:1784)
1093:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1094-   at: add_surface (scene/resources/mesh.cpp:1784)
1095:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1096-   at: add_surface (scene/resources/mesh.cpp:1784)
1097:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1098-   at: add_surface (scene/resources/mesh.cpp:1784)
1099:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1100-   at: add_surface (scene/resources/mesh.cpp:1784)
1101:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1102-   at: add_surface (scene/resources/mesh.cpp:1784)
1103:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1104-   at: add_surface (scene/resources/mesh.cpp:1784)
1105:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1106-   at: add_surface (scene/resources/mesh.cpp:1784)
1107:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1108-   at: add_surface (scene/resources/mesh.cpp:1784)
1109:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1110-   at: add_surface (scene/resources/mesh.cpp:1784)
1111:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1112-   at: add_surface (scene/resources/mesh.cpp:1784)
1113:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1114-   at: add_surface (scene/resources/mesh.cpp:1784)
1115:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1116-   at: add_surface (scene/resources/mesh.cpp:1784)
1117:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1118-   at: add_surface (scene/resources/mesh.cpp:1784)
1119:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1120-   at: add_surface (scene/resources/mesh.cpp:1784)
1121:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1122-   at: add_surface (scene/resources/mesh.cpp:1784)
1123:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1124-   at: add_surface (scene/resources/mesh.cpp:1784)
1125:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1126-   at: add_surface (scene/resources/mesh.cpp:1784)
1127:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1128-   at: add_surface (scene/resources/mesh.cpp:1784)
1129:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1130-   at: add_surface (scene/resources/mesh.cpp:1784)
1131:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1132-   at: add_surface (scene/resources/mesh.cpp:1784)
1133:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1134-   at: add_surface (scene/resources/mesh.cpp:1784)
1135:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1136-   at: add_surface (scene/resources/mesh.cpp:1784)
1137:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1138-   at: add_surface (scene/resources/mesh.cpp:1784)
1139:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1140-   at: add_surface (scene/resources/mesh.cpp:1784)
1141:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1142-   at: add_surface (scene/resources/mesh.cpp:1784)
1143:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1144-   at: add_surface (scene/resources/mesh.cpp:1784)
1145:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1146-   at: add_surface (scene/resources/mesh.cpp:1784)
1147:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1148-   at: add_surface (scene/resources/mesh.cpp:1784)
1149:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1150-   at: add_surface (scene/resources/mesh.cpp:1784)
1151:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1152-   at: add_surface (scene/resources/mesh.cpp:1784)
1153:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1154-   at: add_surface (scene/resources/mesh.cpp:1784)
1155:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1156-   at: add_surface (scene/resources/mesh.cpp:1784)
1157:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1158-   at: add_surface (scene/resources/mesh.cpp:1784)
1159:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1160-   at: add_surface (scene/resources/mesh.cpp:1784)
1161:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1162-   at: add_surface (scene/resources/mesh.cpp:1784)
1163:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1164-   at: add_surface (scene/resources/mesh.cpp:1784)
1165:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1166-   at: add_surface (scene/resources/mesh.cpp:1784)
1167:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1168-   at: add_surface (scene/resources/mesh.cpp:1784)
1169:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1170-   at: add_surface (scene/resources/mesh.cpp:1784)
1171:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1172-   at: add_surface (scene/resources/mesh.cpp:1784)
1173:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1174-   at: add_surface (scene/resources/mesh.cpp:1784)
1175:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1176-   at: add_surface (scene/resources/mesh.cpp:1784)
1177:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1178-   at: add_surface (scene/resources/mesh.cpp:1784)
1179:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1180-   at: add_surface (scene/resources/mesh.cpp:1784)
1181:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1182-   at: add_surface (scene/resources/mesh.cpp:1784)
1183:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1184-   at: add_surface (scene/resources/mesh.cpp:1784)
1185:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1186-   at: add_surface (scene/resources/mesh.cpp:1784)
1187:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1188-   at: add_surface (scene/resources/mesh.cpp:1784)
1189:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1190-   at: add_surface (scene/resources/mesh.cpp:1784)
1191:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1192-   at: add_surface (scene/resources/mesh.cpp:1784)
1193:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1194-   at: add_surface (scene/resources/mesh.cpp:1784)
1195:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1196-   at: add_surface (scene/resources/mesh.cpp:1784)
1197:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1198-   at: add_surface (scene/resources/mesh.cpp:1784)
1199:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1200-   at: add_surface (scene/resources/mesh.cpp:1784)
1201:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1202-   at: add_surface (scene/resources/mesh.cpp:1784)
1203:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1204-   at: add_surface (scene/resources/mesh.cpp:1784)
1205:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1206-   at: add_surface (scene/resources/mesh.cpp:1784)
1207:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1208-   at: add_surface (scene/resources/mesh.cpp:1784)
1209:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1210-   at: add_surface (scene/resources/mesh.cpp:1784)
1211:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1212-   at: add_surface (scene/resources/mesh.cpp:1784)
1213:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1214-   at: add_surface (scene/resources/mesh.cpp:1784)
1215:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1216-   at: add_surface (scene/resources/mesh.cpp:1784)
1217:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1218-   at: add_surface (scene/resources/mesh.cpp:1784)
1219:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1220-   at: add_surface (scene/resources/mesh.cpp:1784)
1221:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1222-   at: add_surface (scene/resources/mesh.cpp:1784)
1223:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1224-   at: add_surface (scene/resources/mesh.cpp:1784)
1225:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1226-   at: add_surface (scene/resources/mesh.cpp:1784)
1227:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1228-   at: add_surface (scene/resources/mesh.cpp:1784)
```

## Last imported resources
```text
[  60% ] [90m[1mreimport[22m | Grass2_Opacity.png[39m[0m
[  61% ] [90m[1mreimport[22m | Grass2_Normal.png[39m[0m
[  62% ] [90m[1mreimport[22m | Grass2_Gloss.png[39m[0m
[  62% ] [90m[1mreimport[22m | Grass2_AO.png[39m[0m
[  63% ] [90m[1mreimport[22m | Grass2.png[39m[0m
[  64% ] [90m[1mreimport[22m | Grass1_Opacity.png[39m[0m
[  64% ] [90m[1mreimport[22m | locust_normal_tex.png[39m[0m
[  65% ] [90m[1mreimport[22m | Grass1_Normal.png[39m[0m
[  66% ] [90m[1mreimport[22m | Grass1_Gloss.png[39m[0m
[  66% ] [90m[1mreimport[22m | Grass1_AO.png[39m[0m
[  67% ] [90m[1mreimport[22m | Grass1.png[39m[0m
[  68% ] [90m[1mreimport[22m | locust_roughness_tex.png[39m[0m
[  68% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_branch_01_n_LOD0_Normal.png[39m[0m
[  69% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_branch_01_LOD0_Color.png[39m[0m
[  70% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_bark_1_Picea_mariana_bark_01_n_LOD0_Normal.png[39m[0m
[  70% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_bark_1_Picea_mariana_bark_01_LOD0_Color.png[39m[0m
[  71% ] [90m[1mreimport[22m | BoiledOne_Body_AlbedoTransparency.png[39m[0m
[  72% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_trunk_cut_01_n_LOD2_Normal.png[39m[0m
[  72% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_n_LOD2_Normal.png[39m[0m
[  73% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_hl_LOD2_Specular.png[39m[0m
[  74% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_gray_LOD2_Color.png[39m[0m
[  75% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_bl_LOD2_BackLight.png[39m[0m
[  75% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_a_LOD2_Transparency.png[39m[0m
[  76% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_long_Picea_mariana_fol_02_long_n_LOD2_Normal.png[39m[0m
[  77% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_long_Picea_mariana_fol_02_long_hl_LOD2_Specular.png[39m[0m
[  77% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_long_Picea_mariana_fol_02_long_gray_LOD2_Color.png[39m[0m
[  78% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_long_Picea_mariana_fol_02_long_bl_LOD2_BackLight.png[39m[0m
[  79% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_long_Picea_mariana_fol_02_long_a_LOD2_Transparency.png[39m[0m
[  79% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_Picea_mariana_fol_01_n_LOD2_Normal.png[39m[0m
[  80% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_Picea_mariana_fol_01_hl_LOD2_Specular.png[39m[0m
[  81% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_Picea_mariana_fol_01_gray_LOD2_Color.png[39m[0m
[  81% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_Picea_mariana_fol_01_bl_LOD2_BackLight.png[39m[0m
[  82% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_Picea_mariana_fol_01_a_LOD2_Transparency.png[39m[0m
[  83% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_dead_Picea_mariana_fol_01_dead_n_LOD2_Normal.png[39m[0m
[  83% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_dead_Picea_mariana_fol_01_dead_LOD2_Color.png[39m[0m
[  84% ] [90m[1mreimport[22m | BoiledOne_Details_AlbedoTransparency.png[39m[0m
[  85% ] [90m[1mreimport[22m | BoiledOne_Eyes_AlbedoTransparency.png[39m[0m
[  85% ] [90m[1mreimport[22m | BoiledOne_GumsMaterial_AlbedoTransparency.png[39m[0m
[  86% ] [90m[1mreimport[22m | BoiledOne_TeethMaterial_AlbedoTransparency.png[39m[0m
[  87% ] [90m[1mreimport[22m | PNG.png[39m[0m
[  87% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_dead_Picea_mariana_fol_01_dead_a_LOD2_Transparency.png[39m[0m
[  88% ] [90m[1mreimport[22m | Tree_Pack.obj[39m[0m
[  89% ] [90m[1mreimport[22m | firs.obj[39m[0m
[  89% ] [90m[1mreimport[22m | fir_4.obj[39m[0m
[  90% ] [90m[1mreimport[22m | fir_3.obj[39m[0m
[  91% ] [90m[1mreimport[22m | fir_2.obj[39m[0m
[  91% ] [90m[1mreimport[22m | fir_1.obj[39m[0m
[  92% ] [90m[1mreimport[22m | Grass.fbx[39m[0m
[  93% ] [90m[1mreimport[22m | flashlightfbx.fbx[39m[0m
[  93% ] [90m[1mreimport[22m | fpsarms.fbx[39m[0m
[  94% ] [90m[1mreimport[22m | Tree_Pack.fbx[39m[0m
[  95% ] [90m[1mreimport[22m | Picea mariana HD_Arctic mat 100_LOD2.fbx[39m[0m
[  95% ] [90m[1mreimport[22m | document_file_folder (1).glb[39m[0m
[  96% ] [90m[1mreimport[22m | T_O_E Locust - By Doumty.fbx[39m[0m
[  97% ] [90m[1mreimport[22m | Picea mariana HD_Arctic mat 100_LOD0.fbx[39m[0m
[  97% ] [90m[1mreimport[22m | Pickup Afghanistan.fbx[39m[0m
[  98% ] [90m[1mreimport[22m | BoiledOne.fbx[39m[0m
[  99% ] [90m[1mreimport[22m | Finalizing Asset Import...[39m[0m
[   0% ] [90m[1mreimport[22m | Started (Re)Importing Assets (147 steps)[39m[0m
[   0% ] [90m[1mreimport[22m | Executing post-reimport operations...[39m[0m
```

## Import log tail
```text
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
   at: add_surface (scene/resources/mesh.cpp:1784)
[  89% ] [90m[1mreimport[22m | fir_4.obj[39m[0m
WARNING: OBJ: Ambient light for material 'nature_bark_fir_07_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
WARNING: OBJ: Ambient light for material 'nature_bark_fir_05_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
WARNING: OBJ: Ambient light for material 'nature_bark_fir_02_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
[  90% ] [90m[1mreimport[22m | fir_3.obj[39m[0m
WARNING: OBJ: Ambient light for material 'nature_bark_fir_07_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
WARNING: OBJ: Ambient light for material 'nature_bark_fir_05_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
WARNING: OBJ: Ambient light for material 'nature_bark_fir_02_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
[  91% ] [90m[1mreimport[22m | fir_2.obj[39m[0m
WARNING: OBJ: Ambient light for material 'nature_bark_fir_07_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
WARNING: OBJ: Ambient light for material 'nature_bark_fir_05_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
WARNING: OBJ: Ambient light for material 'nature_bark_fir_02_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
[  91% ] [90m[1mreimport[22m | fir_1.obj[39m[0m
WARNING: OBJ: Ambient light for material 'nature_bark_fir_07_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
WARNING: OBJ: Ambient light for material 'nature_bark_fir_05_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
WARNING: OBJ: Ambient light for material 'nature_bark_fir_02_m_0001.jpg' is ignored in PBR
     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
[  92% ] [90m[1mreimport[22m | Grass.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  93% ] [90m[1mreimport[22m | flashlightfbx.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  93% ] [90m[1mreimport[22m | fpsarms.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  94% ] [90m[1mreimport[22m | Tree_Pack.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  95% ] [90m[1mreimport[22m | Picea mariana HD_Arctic mat 100_LOD2.fbx[39m[0m
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
[  96% ] [90m[1mreimport[22m | T_O_E Locust - By Doumty.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  97% ] [90m[1mreimport[22m | Picea mariana HD_Arctic mat 100_LOD0.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  97% ] [90m[1mreimport[22m | Pickup Afghanistan.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  98% ] [90m[1mreimport[22m | BoiledOne.fbx[39m[0m
[   0% ] [90m[1mimport[22m | Started Import Scene (104 steps)[39m[0m
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  99% ] [90m[1mreimport[22m | Finalizing Asset Import...[39m[0m
[92m[ DONE ][39m [1mreimport[22m
[0m
[   0% ] [90m[1mreimport[22m | Started (Re)Importing Assets (147 steps)[39m[0m
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
