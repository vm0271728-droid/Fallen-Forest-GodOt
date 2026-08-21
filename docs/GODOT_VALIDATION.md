# Godot validation status

- Engine: Godot 4.7.1 stable
- Branch: `main`
- Tested commit: `b2a0c5b6857a130a25846de768dd6018131ef7b6`
- Full asset import exit code: `1`
- Main-menu smoke-test exit code: `0`
- Gameplay smoke-test exit code: `0`
- Runtime floor/tree physics exit code: `0`
- Asset inspection exit code: `0`
- Overall exit code: `1`
- Result: **FAIL**

## MAX_MESH_SURFACES context
```text
758-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
759-WARNING: OBJ: Ambient light for material 'nature_bark_fir_05_m_0001.jpg' is ignored in PBR
760-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
761-WARNING: OBJ: Ambient light for material 'nature_bark_fir_02_m_0001.jpg' is ignored in PBR
762-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
763-[  92% ] [90m[1mreimport[22m | firs.obj[39m[0m
764-WARNING: OBJ: Ambient light for material 'nature_bark_fir_07_m_0001.jpg' is ignored in PBR
765-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
766-WARNING: OBJ: Ambient light for material 'nature_bark_fir_05_m_0001.jpg' is ignored in PBR
767-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
768-WARNING: OBJ: Ambient light for material 'nature_bark_fir_02_m_0001.jpg' is ignored in PBR
769-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
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
1172:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1173-   at: add_surface (scene/resources/mesh.cpp:1784)
1174:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1175-   at: add_surface (scene/resources/mesh.cpp:1784)
1176:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1177-   at: add_surface (scene/resources/mesh.cpp:1784)
1178:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1179-   at: add_surface (scene/resources/mesh.cpp:1784)
1180:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1181-   at: add_surface (scene/resources/mesh.cpp:1784)
1182:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1183-   at: add_surface (scene/resources/mesh.cpp:1784)
1184:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1185-   at: add_surface (scene/resources/mesh.cpp:1784)
1186:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1187-   at: add_surface (scene/resources/mesh.cpp:1784)
1188:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1189-   at: add_surface (scene/resources/mesh.cpp:1784)
1190:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1191-   at: add_surface (scene/resources/mesh.cpp:1784)
1192:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1193-   at: add_surface (scene/resources/mesh.cpp:1784)
1194:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1195-   at: add_surface (scene/resources/mesh.cpp:1784)
1196:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1197-   at: add_surface (scene/resources/mesh.cpp:1784)
1198:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1199-   at: add_surface (scene/resources/mesh.cpp:1784)
1200:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1201-   at: add_surface (scene/resources/mesh.cpp:1784)
1202:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1203-   at: add_surface (scene/resources/mesh.cpp:1784)
1204:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1205-   at: add_surface (scene/resources/mesh.cpp:1784)
1206:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1207-   at: add_surface (scene/resources/mesh.cpp:1784)
1208:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1209-   at: add_surface (scene/resources/mesh.cpp:1784)
1210:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1211-   at: add_surface (scene/resources/mesh.cpp:1784)
1212:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1213-   at: add_surface (scene/resources/mesh.cpp:1784)
1214:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1215-   at: add_surface (scene/resources/mesh.cpp:1784)
1216:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1217-   at: add_surface (scene/resources/mesh.cpp:1784)
1218:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1219-   at: add_surface (scene/resources/mesh.cpp:1784)
1220:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1221-   at: add_surface (scene/resources/mesh.cpp:1784)
1222:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1223-   at: add_surface (scene/resources/mesh.cpp:1784)
1224:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1225-   at: add_surface (scene/resources/mesh.cpp:1784)
1226:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1227-   at: add_surface (scene/resources/mesh.cpp:1784)
1228:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1229-   at: add_surface (scene/resources/mesh.cpp:1784)
1230:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1231-   at: add_surface (scene/resources/mesh.cpp:1784)
1232:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1233-   at: add_surface (scene/resources/mesh.cpp:1784)
1234:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1235-   at: add_surface (scene/resources/mesh.cpp:1784)
1236:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1237-   at: add_surface (scene/resources/mesh.cpp:1784)
1238:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1239-   at: add_surface (scene/resources/mesh.cpp:1784)
1240:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1241-   at: add_surface (scene/resources/mesh.cpp:1784)
1242:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1243-   at: add_surface (scene/resources/mesh.cpp:1784)
1244:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1245-   at: add_surface (scene/resources/mesh.cpp:1784)
1246:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1247-   at: add_surface (scene/resources/mesh.cpp:1784)
1248:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1249-   at: add_surface (scene/resources/mesh.cpp:1784)
1250:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1251-   at: add_surface (scene/resources/mesh.cpp:1784)
1252:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1253-   at: add_surface (scene/resources/mesh.cpp:1784)
1254:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1255-   at: add_surface (scene/resources/mesh.cpp:1784)
1256:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1257-   at: add_surface (scene/resources/mesh.cpp:1784)
1258:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1259-   at: add_surface (scene/resources/mesh.cpp:1784)
1260:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1261-   at: add_surface (scene/resources/mesh.cpp:1784)
1262:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1263-   at: add_surface (scene/resources/mesh.cpp:1784)
1264:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1265-   at: add_surface (scene/resources/mesh.cpp:1784)
1266:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1267-   at: add_surface (scene/resources/mesh.cpp:1784)
1268:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1269-   at: add_surface (scene/resources/mesh.cpp:1784)
1270:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1271-   at: add_surface (scene/resources/mesh.cpp:1784)
1272:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1273-   at: add_surface (scene/resources/mesh.cpp:1784)
1274:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1275-   at: add_surface (scene/resources/mesh.cpp:1784)
1276:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1277-   at: add_surface (scene/resources/mesh.cpp:1784)
1278:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1279-   at: add_surface (scene/resources/mesh.cpp:1784)
1280:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1281-   at: add_surface (scene/resources/mesh.cpp:1784)
1282:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1283-   at: add_surface (scene/resources/mesh.cpp:1784)
1284:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1285-   at: add_surface (scene/resources/mesh.cpp:1784)
1286:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1287-   at: add_surface (scene/resources/mesh.cpp:1784)
1288:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1289-   at: add_surface (scene/resources/mesh.cpp:1784)
1290:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1291-   at: add_surface (scene/resources/mesh.cpp:1784)
1292:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1293-   at: add_surface (scene/resources/mesh.cpp:1784)
1294:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1295-   at: add_surface (scene/resources/mesh.cpp:1784)
1296:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1297-   at: add_surface (scene/resources/mesh.cpp:1784)
1298:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1299-   at: add_surface (scene/resources/mesh.cpp:1784)
1300:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1301-   at: add_surface (scene/resources/mesh.cpp:1784)
1302:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1303-   at: add_surface (scene/resources/mesh.cpp:1784)
1304:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1305-   at: add_surface (scene/resources/mesh.cpp:1784)
1306:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1307-   at: add_surface (scene/resources/mesh.cpp:1784)
1308:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1309-   at: add_surface (scene/resources/mesh.cpp:1784)
1310:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1311-   at: add_surface (scene/resources/mesh.cpp:1784)
1312:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1313-   at: add_surface (scene/resources/mesh.cpp:1784)
1314:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1315-   at: add_surface (scene/resources/mesh.cpp:1784)
1316:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1317-   at: add_surface (scene/resources/mesh.cpp:1784)
1318:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1319-   at: add_surface (scene/resources/mesh.cpp:1784)
1320:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1321-   at: add_surface (scene/resources/mesh.cpp:1784)
1322:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1323-   at: add_surface (scene/resources/mesh.cpp:1784)
1324:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1325-   at: add_surface (scene/resources/mesh.cpp:1784)
1326:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1327-   at: add_surface (scene/resources/mesh.cpp:1784)
1328:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1329-   at: add_surface (scene/resources/mesh.cpp:1784)
1330:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1331-   at: add_surface (scene/resources/mesh.cpp:1784)
1332:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1333-   at: add_surface (scene/resources/mesh.cpp:1784)
1334:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1335-   at: add_surface (scene/resources/mesh.cpp:1784)
1336:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1337-   at: add_surface (scene/resources/mesh.cpp:1784)
1338:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1339-   at: add_surface (scene/resources/mesh.cpp:1784)
1340:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1341-   at: add_surface (scene/resources/mesh.cpp:1784)
1342:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1343-   at: add_surface (scene/resources/mesh.cpp:1784)
1344:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1345-   at: add_surface (scene/resources/mesh.cpp:1784)
1346:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1347-   at: add_surface (scene/resources/mesh.cpp:1784)
1348:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1349-   at: add_surface (scene/resources/mesh.cpp:1784)
1350:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1351-   at: add_surface (scene/resources/mesh.cpp:1784)
1352:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1353-   at: add_surface (scene/resources/mesh.cpp:1784)
1354:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1355-   at: add_surface (scene/resources/mesh.cpp:1784)
1356:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1357-   at: add_surface (scene/resources/mesh.cpp:1784)
1358:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1359-   at: add_surface (scene/resources/mesh.cpp:1784)
1360:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1361-   at: add_surface (scene/resources/mesh.cpp:1784)
1362:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1363-   at: add_surface (scene/resources/mesh.cpp:1784)
1364:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1365-   at: add_surface (scene/resources/mesh.cpp:1784)
1366:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1367-   at: add_surface (scene/resources/mesh.cpp:1784)
1368:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1369-   at: add_surface (scene/resources/mesh.cpp:1784)
1370:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1371-   at: add_surface (scene/resources/mesh.cpp:1784)
1372:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1373-   at: add_surface (scene/resources/mesh.cpp:1784)
1374:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1375-   at: add_surface (scene/resources/mesh.cpp:1784)
1376:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1377-   at: add_surface (scene/resources/mesh.cpp:1784)
1378:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1379-   at: add_surface (scene/resources/mesh.cpp:1784)
1380:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1381-   at: add_surface (scene/resources/mesh.cpp:1784)
1382:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1383-   at: add_surface (scene/resources/mesh.cpp:1784)
1384:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1385-   at: add_surface (scene/resources/mesh.cpp:1784)
1386:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1387-   at: add_surface (scene/resources/mesh.cpp:1784)
1388:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1389-   at: add_surface (scene/resources/mesh.cpp:1784)
1390:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1391-   at: add_surface (scene/resources/mesh.cpp:1784)
1392:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1393-   at: add_surface (scene/resources/mesh.cpp:1784)
1394:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1395-   at: add_surface (scene/resources/mesh.cpp:1784)
1396:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1397-   at: add_surface (scene/resources/mesh.cpp:1784)
1398:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1399-   at: add_surface (scene/resources/mesh.cpp:1784)
1400:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1401-   at: add_surface (scene/resources/mesh.cpp:1784)
1402:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1403-   at: add_surface (scene/resources/mesh.cpp:1784)
1404:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1405-   at: add_surface (scene/resources/mesh.cpp:1784)
1406:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1407-   at: add_surface (scene/resources/mesh.cpp:1784)
1408:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1409-   at: add_surface (scene/resources/mesh.cpp:1784)
1410:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1411-   at: add_surface (scene/resources/mesh.cpp:1784)
1412:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1413-   at: add_surface (scene/resources/mesh.cpp:1784)
1414:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1415-   at: add_surface (scene/resources/mesh.cpp:1784)
1416:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1417-   at: add_surface (scene/resources/mesh.cpp:1784)
1418:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1419-   at: add_surface (scene/resources/mesh.cpp:1784)
1420:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1421-   at: add_surface (scene/resources/mesh.cpp:1784)
1422:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1423-   at: add_surface (scene/resources/mesh.cpp:1784)
1424:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1425-   at: add_surface (scene/resources/mesh.cpp:1784)
1426:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1427-   at: add_surface (scene/resources/mesh.cpp:1784)
1428:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1429-   at: add_surface (scene/resources/mesh.cpp:1784)
1430:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1431-   at: add_surface (scene/resources/mesh.cpp:1784)
1432:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1433-   at: add_surface (scene/resources/mesh.cpp:1784)
1434:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1435-   at: add_surface (scene/resources/mesh.cpp:1784)
1436:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1437-   at: add_surface (scene/resources/mesh.cpp:1784)
1438:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1439-   at: add_surface (scene/resources/mesh.cpp:1784)
1440:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1441-   at: add_surface (scene/resources/mesh.cpp:1784)
1442:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1443-   at: add_surface (scene/resources/mesh.cpp:1784)
1444:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1445-   at: add_surface (scene/resources/mesh.cpp:1784)
1446:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1447-   at: add_surface (scene/resources/mesh.cpp:1784)
1448:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1449-   at: add_surface (scene/resources/mesh.cpp:1784)
1450:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1451-   at: add_surface (scene/resources/mesh.cpp:1784)
1452:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1453-   at: add_surface (scene/resources/mesh.cpp:1784)
1454:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1455-   at: add_surface (scene/resources/mesh.cpp:1784)
1456:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1457-   at: add_surface (scene/resources/mesh.cpp:1784)
```

## Last imported resources
```text
[  74% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_a_LOD2_Transparency.png[39m[0m
[  75% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_bl_LOD2_BackLight.png[39m[0m
[  75% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_gray_LOD2_Color.png[39m[0m
[  75% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_hl_LOD2_Specular.png[39m[0m
[  76% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_n_LOD2_Normal.png[39m[0m
[  76% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_trunk_cut_01_n_LOD2_Normal.png[39m[0m
[  77% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_bark_1_Picea_mariana_bark_01_LOD3_Color.png[39m[0m
[  77% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_bark_1_Picea_mariana_bark_01_n_LOD3_Normal.png[39m[0m
[  78% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_branch_01_LOD3_Color.png[39m[0m
[  78% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_branch_01_n_LOD3_Normal.png[39m[0m
[  78% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_brch_cut_02_Picea_branch_cut_01b_LOD3_Color.png[39m[0m
[  79% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_brch_cut_02_Picea_branch_cut_01_n_LOD3_Normal.png[39m[0m
[  79% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_brch_dead_Picea_mariana_branch_01_dead_LOD3_Color.png[39m[0m
[  80% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_brch_dead_Picea_mariana_branch_01_dead_n_LOD3_Normal.png[39m[0m
[  80% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_dead_Picea_mariana_fol_01_dead_a_LOD3_Transparency.png[39m[0m
[  81% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_dead_Picea_mariana_fol_01_dead_LOD3_Color.png[39m[0m
[  81% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_dead_Picea_mariana_fol_01_dead_n_LOD3_Normal.png[39m[0m
[  82% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_Picea_mariana_fol_01_a_LOD3_Transparency.png[39m[0m
[  82% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_Picea_mariana_fol_01_bl_LOD3_BackLight.png[39m[0m
[  82% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_Picea_mariana_fol_01_gray_LOD3_Color.png[39m[0m
[  83% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_Picea_mariana_fol_01_hl_LOD3_Specular.png[39m[0m
[  83% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_brch_cut_02_Picea_branch_cut_01b_LOD2_Color.png[39m[0m
[  84% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_brch_cut_02_Picea_branch_cut_01_n_LOD2_Normal.png[39m[0m
[  84% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_bl_LOD1_BackLight.png[39m[0m
[  85% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_brch_dead_Picea_mariana_branch_01_dead_LOD2_Color.png[39m[0m
[  85% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_a_LOD1_Transparency.png[39m[0m
[  85% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_brch_dead_Picea_mariana_branch_01_dead_n_LOD2_Normal.png[39m[0m
[  86% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_gray_LOD1_Color.png[39m[0m
[  86% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_hl_LOD1_Specular.png[39m[0m
[  87% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_2_short_Picea_mariana_fol_02_short_n_LOD1_Normal.png[39m[0m
[  87% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_trunk_cut_01_n_LOD1_Normal.png[39m[0m
[  88% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_branch_01_n_LOD2_Normal.png[39m[0m
[  88% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_dead_Picea_mariana_fol_01_dead_a_LOD2_Transparency.png[39m[0m
[  89% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_dead_Picea_mariana_fol_01_dead_LOD2_Color.png[39m[0m
[  89% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_dead_Picea_mariana_fol_01_dead_n_LOD2_Normal.png[39m[0m
[  89% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_Picea_mariana_fol_01_a_LOD2_Transparency.png[39m[0m
[  90% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_fol_1_Picea_mariana_fol_01_bl_LOD2_BackLight.png[39m[0m
[  90% ] [90m[1mreimport[22m | Picea_mariana_HD_Picea_mariana_branch_01_LOD2_Color.png[39m[0m
[  91% ] [90m[1mreimport[22m | fir_1.obj[39m[0m
[  91% ] [90m[1mreimport[22m | fir_2.obj[39m[0m
[  92% ] [90m[1mreimport[22m | fir_3.obj[39m[0m
[  92% ] [90m[1mreimport[22m | fir_4.obj[39m[0m
[  92% ] [90m[1mreimport[22m | firs.obj[39m[0m
[  93% ] [90m[1mreimport[22m | Tree_Pack.obj[39m[0m
[  93% ] [90m[1mreimport[22m | Pickup Afghanistan.fbx[39m[0m
[  94% ] [90m[1mreimport[22m | BoiledOne.fbx[39m[0m
[  94% ] [90m[1mreimport[22m | T_O_E Locust - By Doumty.fbx[39m[0m
[  95% ] [90m[1mreimport[22m | document_file_folder (1).glb[39m[0m
[  95% ] [90m[1mreimport[22m | Picea mariana HD_Arctic mat 100_LOD2.fbx[39m[0m
[  96% ] [90m[1mreimport[22m | Grass.fbx[39m[0m
[  96% ] [90m[1mreimport[22m | flashlightfbx.fbx[39m[0m
[  96% ] [90m[1mreimport[22m | Picea mariana HD_Arctic mat 100_LOD0.fbx[39m[0m
[  97% ] [90m[1mreimport[22m | Picea mariana HD_Arctic mat 100_LOD4.fbx[39m[0m
[  97% ] [90m[1mreimport[22m | fpsarms.fbx[39m[0m
[  98% ] [90m[1mreimport[22m | Picea mariana HD_Arctic mat 100_LOD3.fbx[39m[0m
[  98% ] [90m[1mreimport[22m | Picea mariana HD_Arctic mat 100_LOD1.fbx[39m[0m
[  99% ] [90m[1mreimport[22m | Tree_Pack.fbx[39m[0m
[  99% ] [90m[1mreimport[22m | Finalizing Asset Import...[39m[0m
[   0% ] [90m[1mreimport[22m | Started (Re)Importing Assets (227 steps)[39m[0m
[   0% ] [90m[1mreimport[22m | Executing post-reimport operations...[39m[0m
```

## Import log tail
```text
[   0% ] [90m[1mimport[22m | Importing Scene...[39m[0m
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Background_Tree_Atlas_Diffuse.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '0' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Background_Tree_Atlas_Diffuse.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Background_Tree_Atlas_Opacity.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '1' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Background_Tree_Atlas_Opacity.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Background_Tree_Atlas_Normal.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '2' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Background_Tree_Atlas_Normal.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Background_Tree_Atlas_Roughness.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '3' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Background_Tree_Atlas_Roughness.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
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
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Branches_1_Diffuse.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '7' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Branches_1_Diffuse.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Branches_1_Opacity.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '8' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Branches_1_Opacity.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Branches_Normal.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '9' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Branches_Normal.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Branches_Roughness.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '10' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Branches_Roughness.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Branches_2_Diffuse.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '11' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Branches_2_Diffuse.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Branches_2_Opacity.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '12' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Branches_2_Opacity.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Trunk_01_Normal.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '13' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Trunk_01_Normal.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Trunk_01_Roughness.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '14' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Trunk_01_Roughness.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Trunk_02_Normal.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '15' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Trunk_02_Normal.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
ERROR: Resource file not found: res:// (expected type: Texture2D)
   at: _load (core/io/resource_loader.cpp:325)
ERROR: Can't open file from path 'res://assets/environment/trees/low_poly_pack/source/Tree_Trunk_02_Roughness.png'.
   at: get_file_as_bytes (core/io/file_access.cpp:907)
WARNING: FBX: Image index '16' couldn't be loaded from path: res://assets/environment/trees/low_poly_pack/source/Tree_Trunk_02_Roughness.png because there was no data to load. Skipping it.
     at: _parse_images (modules/fbx/fbx_document.cpp:1081)
[   1% ] [90m[1mimport[22m | Running Custom Script...[39m[0m
[  99% ] [90m[1mimport[22m | Saving...[39m[0m
[92m[ DONE ][39m [1mimport[22m
[0m
[  99% ] [90m[1mreimport[22m | Finalizing Asset Import...[39m[0m
[92m[ DONE ][39m [1mreimport[22m
[0m
[   0% ] [90m[1mreimport[22m | Started (Re)Importing Assets (227 steps)[39m[0m
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
