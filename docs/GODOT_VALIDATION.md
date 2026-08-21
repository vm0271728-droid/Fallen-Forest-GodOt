# Godot validation status

- Engine: Godot 4.7.1 stable
- Branch: `main`
- Tested commit: `de24f93d412e1df74b1cda47768ae440bb3d6d03`
- Full asset import exit code: `1`
- Main-menu smoke-test exit code: `0`
- Gameplay smoke-test exit code: `0`
- Runtime floor/tree physics exit code: `0`
- Asset inspection exit code: `0`
- Overall exit code: `1`
- Result: **FAIL**

## MAX_MESH_SURFACES context
```text
749-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
750-WARNING: OBJ: Ambient light for material 'nature_bark_fir_05_m_0001.jpg' is ignored in PBR
751-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
752-WARNING: OBJ: Ambient light for material 'nature_bark_fir_02_m_0001.jpg' is ignored in PBR
753-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
754-[  92% ] [90m[1mreimport[22m | firs.obj[39m[0m
755-WARNING: OBJ: Ambient light for material 'nature_bark_fir_07_m_0001.jpg' is ignored in PBR
756-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
757-WARNING: OBJ: Ambient light for material 'nature_bark_fir_05_m_0001.jpg' is ignored in PBR
758-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
759-WARNING: OBJ: Ambient light for material 'nature_bark_fir_02_m_0001.jpg' is ignored in PBR
760-     at: _parse_material_library (editor/import/3d/resource_importer_obj.cpp:60)
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
1229:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1230-   at: add_surface (scene/resources/mesh.cpp:1784)
1231:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1232-   at: add_surface (scene/resources/mesh.cpp:1784)
1233:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1234-   at: add_surface (scene/resources/mesh.cpp:1784)
1235:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1236-   at: add_surface (scene/resources/mesh.cpp:1784)
1237:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1238-   at: add_surface (scene/resources/mesh.cpp:1784)
1239:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1240-   at: add_surface (scene/resources/mesh.cpp:1784)
1241:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1242-   at: add_surface (scene/resources/mesh.cpp:1784)
1243:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1244-   at: add_surface (scene/resources/mesh.cpp:1784)
1245:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1246-   at: add_surface (scene/resources/mesh.cpp:1784)
1247:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1248-   at: add_surface (scene/resources/mesh.cpp:1784)
1249:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1250-   at: add_surface (scene/resources/mesh.cpp:1784)
1251:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1252-   at: add_surface (scene/resources/mesh.cpp:1784)
1253:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1254-   at: add_surface (scene/resources/mesh.cpp:1784)
1255:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1256-   at: add_surface (scene/resources/mesh.cpp:1784)
1257:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1258-   at: add_surface (scene/resources/mesh.cpp:1784)
1259:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1260-   at: add_surface (scene/resources/mesh.cpp:1784)
1261:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1262-   at: add_surface (scene/resources/mesh.cpp:1784)
1263:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1264-   at: add_surface (scene/resources/mesh.cpp:1784)
1265:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1266-   at: add_surface (scene/resources/mesh.cpp:1784)
1267:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1268-   at: add_surface (scene/resources/mesh.cpp:1784)
1269:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1270-   at: add_surface (scene/resources/mesh.cpp:1784)
1271:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1272-   at: add_surface (scene/resources/mesh.cpp:1784)
1273:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1274-   at: add_surface (scene/resources/mesh.cpp:1784)
1275:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1276-   at: add_surface (scene/resources/mesh.cpp:1784)
1277:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1278-   at: add_surface (scene/resources/mesh.cpp:1784)
1279:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1280-   at: add_surface (scene/resources/mesh.cpp:1784)
1281:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1282-   at: add_surface (scene/resources/mesh.cpp:1784)
1283:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1284-   at: add_surface (scene/resources/mesh.cpp:1784)
1285:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1286-   at: add_surface (scene/resources/mesh.cpp:1784)
1287:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1288-   at: add_surface (scene/resources/mesh.cpp:1784)
1289:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1290-   at: add_surface (scene/resources/mesh.cpp:1784)
1291:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1292-   at: add_surface (scene/resources/mesh.cpp:1784)
1293:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1294-   at: add_surface (scene/resources/mesh.cpp:1784)
1295:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1296-   at: add_surface (scene/resources/mesh.cpp:1784)
1297:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1298-   at: add_surface (scene/resources/mesh.cpp:1784)
1299:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1300-   at: add_surface (scene/resources/mesh.cpp:1784)
1301:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1302-   at: add_surface (scene/resources/mesh.cpp:1784)
1303:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1304-   at: add_surface (scene/resources/mesh.cpp:1784)
1305:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1306-   at: add_surface (scene/resources/mesh.cpp:1784)
1307:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1308-   at: add_surface (scene/resources/mesh.cpp:1784)
1309:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1310-   at: add_surface (scene/resources/mesh.cpp:1784)
1311:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1312-   at: add_surface (scene/resources/mesh.cpp:1784)
1313:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1314-   at: add_surface (scene/resources/mesh.cpp:1784)
1315:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1316-   at: add_surface (scene/resources/mesh.cpp:1784)
1317:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1318-   at: add_surface (scene/resources/mesh.cpp:1784)
1319:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1320-   at: add_surface (scene/resources/mesh.cpp:1784)
1321:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1322-   at: add_surface (scene/resources/mesh.cpp:1784)
1323:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1324-   at: add_surface (scene/resources/mesh.cpp:1784)
1325:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1326-   at: add_surface (scene/resources/mesh.cpp:1784)
1327:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1328-   at: add_surface (scene/resources/mesh.cpp:1784)
1329:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1330-   at: add_surface (scene/resources/mesh.cpp:1784)
1331:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1332-   at: add_surface (scene/resources/mesh.cpp:1784)
1333:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1334-   at: add_surface (scene/resources/mesh.cpp:1784)
1335:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1336-   at: add_surface (scene/resources/mesh.cpp:1784)
1337:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1338-   at: add_surface (scene/resources/mesh.cpp:1784)
1339:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1340-   at: add_surface (scene/resources/mesh.cpp:1784)
1341:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1342-   at: add_surface (scene/resources/mesh.cpp:1784)
1343:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1344-   at: add_surface (scene/resources/mesh.cpp:1784)
1345:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1346-   at: add_surface (scene/resources/mesh.cpp:1784)
1347:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1348-   at: add_surface (scene/resources/mesh.cpp:1784)
1349:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1350-   at: add_surface (scene/resources/mesh.cpp:1784)
1351:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1352-   at: add_surface (scene/resources/mesh.cpp:1784)
1353:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1354-   at: add_surface (scene/resources/mesh.cpp:1784)
1355:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1356-   at: add_surface (scene/resources/mesh.cpp:1784)
1357:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1358-   at: add_surface (scene/resources/mesh.cpp:1784)
1359:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1360-   at: add_surface (scene/resources/mesh.cpp:1784)
1361:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1362-   at: add_surface (scene/resources/mesh.cpp:1784)
1363:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1364-   at: add_surface (scene/resources/mesh.cpp:1784)
1365:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1366-   at: add_surface (scene/resources/mesh.cpp:1784)
1367:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1368-   at: add_surface (scene/resources/mesh.cpp:1784)
1369:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1370-   at: add_surface (scene/resources/mesh.cpp:1784)
1371:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1372-   at: add_surface (scene/resources/mesh.cpp:1784)
1373:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1374-   at: add_surface (scene/resources/mesh.cpp:1784)
1375:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1376-   at: add_surface (scene/resources/mesh.cpp:1784)
1377:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1378-   at: add_surface (scene/resources/mesh.cpp:1784)
1379:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1380-   at: add_surface (scene/resources/mesh.cpp:1784)
1381:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1382-   at: add_surface (scene/resources/mesh.cpp:1784)
1383:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1384-   at: add_surface (scene/resources/mesh.cpp:1784)
1385:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1386-   at: add_surface (scene/resources/mesh.cpp:1784)
1387:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1388-   at: add_surface (scene/resources/mesh.cpp:1784)
1389:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1390-   at: add_surface (scene/resources/mesh.cpp:1784)
1391:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1392-   at: add_surface (scene/resources/mesh.cpp:1784)
1393:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1394-   at: add_surface (scene/resources/mesh.cpp:1784)
1395:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1396-   at: add_surface (scene/resources/mesh.cpp:1784)
1397:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1398-   at: add_surface (scene/resources/mesh.cpp:1784)
1399:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1400-   at: add_surface (scene/resources/mesh.cpp:1784)
1401:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1402-   at: add_surface (scene/resources/mesh.cpp:1784)
1403:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1404-   at: add_surface (scene/resources/mesh.cpp:1784)
1405:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1406-   at: add_surface (scene/resources/mesh.cpp:1784)
1407:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1408-   at: add_surface (scene/resources/mesh.cpp:1784)
1409:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1410-   at: add_surface (scene/resources/mesh.cpp:1784)
1411:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1412-   at: add_surface (scene/resources/mesh.cpp:1784)
1413:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1414-   at: add_surface (scene/resources/mesh.cpp:1784)
1415:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1416-   at: add_surface (scene/resources/mesh.cpp:1784)
1417:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1418-   at: add_surface (scene/resources/mesh.cpp:1784)
1419:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1420-   at: add_surface (scene/resources/mesh.cpp:1784)
1421:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1422-   at: add_surface (scene/resources/mesh.cpp:1784)
1423:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1424-   at: add_surface (scene/resources/mesh.cpp:1784)
1425:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1426-   at: add_surface (scene/resources/mesh.cpp:1784)
1427:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1428-   at: add_surface (scene/resources/mesh.cpp:1784)
1429:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1430-   at: add_surface (scene/resources/mesh.cpp:1784)
1431:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1432-   at: add_surface (scene/resources/mesh.cpp:1784)
1433:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1434-   at: add_surface (scene/resources/mesh.cpp:1784)
1435:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1436-   at: add_surface (scene/resources/mesh.cpp:1784)
1437:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1438-   at: add_surface (scene/resources/mesh.cpp:1784)
1439:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1440-   at: add_surface (scene/resources/mesh.cpp:1784)
1441:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1442-   at: add_surface (scene/resources/mesh.cpp:1784)
1443:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1444-   at: add_surface (scene/resources/mesh.cpp:1784)
1445:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1446-   at: add_surface (scene/resources/mesh.cpp:1784)
1447:ERROR: Condition "surfaces.size() == RenderingServerEnums::MAX_MESH_SURFACES" is true.
1448-   at: add_surface (scene/resources/mesh.cpp:1784)
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
