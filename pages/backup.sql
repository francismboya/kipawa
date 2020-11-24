SET GLOBAL max_allowed_packet=1024*1024*1024

SET FOREIGN_KEY_CHECKS = 0;



DROP TABLE IF EXISTS course;



CREATE TABLE `course` (
  `courseID` varchar(20) NOT NULL,
  `cName` varchar(50) NOT NULL,
  `depertmentID` varchar(20) DEFAULT NULL,
  `employeeID` varchar(20) DEFAULT NULL,
  `level` varchar(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `classfication` varchar(50) NOT NULL,
  PRIMARY KEY (`courseID`),
  KEY `depertmentID` (`depertmentID`,`employeeID`),
  KEY `course_ibfk_2` (`employeeID`),
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `course_ibfk_3` FOREIGN KEY (`depertmentID`) REFERENCES `department` (`depertmentID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO course VALUES("ELE06101","Operating Test Equipment","ELE","KICTC-STA-0004-2020","6","12","c");
INSERT INTO course VALUES("ITT05101","Operating Systems","ICT","KICTC-STA-0005-2020","5","9","c");
INSERT INTO course VALUES("ITT05102","Computer Maintenance and Repairs","ICT","KICTC-STA-0005-2020","5","12","c");
INSERT INTO course VALUES("ITT05106","Computing Mathematics","ICT","KICTC-STA-0009-2020","5","8","f");
INSERT INTO course VALUES("ITT06101","Object Oriented Programming","ICT","KICTC-STA-0007-2020","6","12","c");
INSERT INTO course VALUES("ITT06102","Web Technologies","ICT","KICTC-STA-0005-2020","6","12","c");
INSERT INTO course VALUES("ITT06103","System Analysis and Design","ICT","KICTC-STA-0008-2020","6","12","c");
INSERT INTO course VALUES("ITT06104","System Adminstration and Security","ICT","KICTC-STA-0009-2020","6","14","f");





DROP TABLE IF EXISTS courseprogram;



CREATE TABLE `courseprogram` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseID` varchar(20) CHARACTER SET latin1 NOT NULL,
  `programID` varchar(20) CHARACTER SET latin1 NOT NULL,
  `level` varchar(11) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courseID` (`courseID`),
  KEY `programID` (`programID`),
  CONSTRAINT `courseprogram_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `courseprogram_ibfk_2` FOREIGN KEY (`programID`) REFERENCES `program` (`programID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

INSERT INTO courseprogram VALUES("11","ITT06101","OD-ICT","6");
INSERT INTO courseprogram VALUES("12","ITT06102","OD-ICT","6");
INSERT INTO courseprogram VALUES("13","ITT06103","OD-ICT","6");
INSERT INTO courseprogram VALUES("14","ITT06104","OD-ICT","6");
INSERT INTO courseprogram VALUES("15","ITT05101","TC-ICT","5");
INSERT INTO courseprogram VALUES("16","ITT05102","TC-ICT","5");
INSERT INTO courseprogram VALUES("17","ITT05106","TC-ICT","5");
INSERT INTO courseprogram VALUES("18","ELE06101","BT-ELE","6");





DROP TABLE IF EXISTS coursework;



CREATE TABLE `coursework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseID` varchar(20) NOT NULL,
  `score` varchar(5) DEFAULT NULL,
  `remarks` varchar(4) DEFAULT NULL,
  `regno` varchar(30) DEFAULT NULL,
  `coID` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT '	',
  PRIMARY KEY (`id`),
  KEY `regno` (`regno`),
  KEY `coursework_ibfk_3` (`courseID`),
  KEY `coID` (`coID`) USING BTREE,
  CONSTRAINT `coursework_ibfk_2` FOREIGN KEY (`regno`) REFERENCES `student` (`regno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `coursework_ibfk_3` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

INSERT INTO coursework VALUES("20","ITT05102","33","pass","KICTC-CER-006-2020","ITT051022020");
INSERT INTO coursework VALUES("21","ITT05102","14","fail","KICTC-CER-007-2020","ITT051022020");
INSERT INTO coursework VALUES("22","ITT05102","22","pass","KICTC-CER-016-2020","ITT051022020");
INSERT INTO coursework VALUES("23","ITT05101","35","fail","KICTC-CER-006-2020","ITT051012020");
INSERT INTO coursework VALUES("24","ITT05101","14","fail","KICTC-CER-007-2020","ITT051012020");
INSERT INTO coursework VALUES("25","ITT05101","20","pass","KICTC-CER-016-2020","ITT051012020");
INSERT INTO coursework VALUES("26","ITT06102","11","fail","KICTC-DIP-003-2020","ITT061022020");





DROP TABLE IF EXISTS courseworkstate;



CREATE TABLE `courseworkstate` (
  `coID` varchar(20) NOT NULL,
  `costateID` varchar(20) NOT NULL,
  `coaccess` varchar(20) NOT NULL,
  `costatus` varchar(20) NOT NULL,
  KEY `courseworkstate_ibfk_1` (`coID`),
  CONSTRAINT `courseworkstate_ibfk_1` FOREIGN KEY (`coID`) REFERENCES `coursework` (`coID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;






DROP TABLE IF EXISTS department;



CREATE TABLE `department` (
  `depertmentID` varchar(20) NOT NULL,
  `dName` varchar(50) NOT NULL,
  PRIMARY KEY (`depertmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO department VALUES("ELE","Electronics");
INSERT INTO department VALUES("ICT","Information Communication Technology");
INSERT INTO department VALUES("MNG","Management");





DROP TABLE IF EXISTS employee;



CREATE TABLE `employee` (
  `employeeID` varchar(20) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(55) DEFAULT NULL,
  `file` longblob DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `depertmentID` varchar(20) DEFAULT NULL,
  `phoneno` text NOT NULL,
  PRIMARY KEY (`employeeID`),
  KEY `statusid` (`email`,`depertmentID`),
  KEY `depertmentID` (`depertmentID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`depertmentID`) REFERENCES `department` (`depertmentID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`email`) REFERENCES `login` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO employee VALUES("KICTC-STA-0001-2020","mboya","francis","felix","mboya@gmail.com","�PNG

\0\0\0
�����~���|��z�HΪ^��@r���}i�|M����I�g��/��c	�5r�m�x�ȤN�G�����掮<R�ܥ�
%�����ݽn���V�;�&4F{�N��\'W���F�с��H�%�.a�.�q�:��\0���.���N\0o/b\\�q�2����\0>N������B
)�3VHk�\0�^3����S�M������\0��v���l���oP��2�M��C�hvҌ�gت�Co�1M��O(hWB�7��oڸ�q��R�%�kV�М��������d�K6�W�w�d�\"��TB����9�F���K�xsAj�P�uJ
s1�զ����%.����MS�)���	\0��^�$X|g���F��GlFs�9=��x����L\'@��[,@@J��
ej,@8�u��jL�F:�+�KTPBq�g��
T�n��J,1d.�J5!6\"�3�2����
���%
NP~P��J�z0�f�1i��mZ.Z�\0�����$%a�+4yW�Ձ���O��^z�?�,.y�]�__^����s�?Ǒpi��p���x�3�
5QǼ�*�m��7��F�QhLOJ+_AP�#8�zDX����}|���hj���j�U	�J#�,>SQnő!���ֲPe�g!ԯL��;�q}�0��$����=,m�&�r� O�ޫB2*\0+v�\0�W��
�2�S$�XC\"t��\'Y��bCx�6�璳]�[���@��3�TR��%������w����F��\\���{9A���R��R���{���M�\0��7`��}
4��< ��PO��d�؈�H�,�:�����U�QB��7b�%�X6� �c2fCE���}�^�����F�p�����F�ѕG�B@�M�@Ob�
N:��-̑[�>��Q�\\j�/���\0�hh���p}Y 4&���p�\"$F�։Oa��A̔5g9�{.��<ZE�2uz��ݜ�t�J��J�����>�$eӴ��EQB[�����/鏉��Z�,Z̀> Ғ�|��gSf��B|��O���VM�g@��n&�d��7�zʝx6r�/hqK�q��K}��<
�.��_�\\�i�}���<$<=�ڈ�,=���H���0�5�=�N�!5�i��˱�>e�6B�.m�,1X�v���EN\0�d��E��	�yr(��`�ȑO��<h9w�i-d#|�6jF��u����]<[o-�KVؒ���7J�\0�^+H\0@��>�<���1@9�D�4��t����U�z1z(B��ق��{�z�j$kA�+��pCnP��Ɛ����]ުvC�A�����oY�i@�O^A����n
𝹡��\\�HU�hS�@gkׇ?<ҙ�ۑ֌�w0Uؐ\'Ug7E~�l���]����C7x�{N�Zt�.܏�B�*�>CG�z�pB�EWmM^ˁZ��D0���T�����wj��*� 6;U��v��8j�B������]�-��0G�l�g	4��u��X3D0BQ5P���|���F\0�)k
�ۨZ�C��n�pM�2�!m���PA�?h5��x+��PĆZW{��#\\L�#\":�
S��c���8e��/��Vhy\0�\'��ɔOD@�%h�
Y�Ak�q)�#�E9+�W�)LGzm�k�
���G
��FEU�+p��,P�[�\'Kg2���K�
�8J��B*������\0lA�נ�(g6��̎��F+�SUP;��9���	�����&\0�����$7��?��U��΢�H�93�����	��ՀJ���uC�>W�hʀ�#󨜣�H�P3�ifڎr\0+��il���e/�*Oj4�fZ���õS�ȗ_2Q0=�8��[Q/0��h��M��F����(\0p�6����Z���ٟg��Z�v�nk{_�F��A�[ڤ�x�dF���%��u�G��!��\0`��&���/m�M�iJI;}�1P�d��m�j��e���w(am�i
& ���v�n�v-�ٯ�V�l�,o)��Ô��a��y��k=օ1P�jkPpI���}$�����Fl\0�x�	r��l����5�q�vSޥ.�
��x�7�*>�\0�5�NFC\"��k�3��WXWCs��Q�����p��c�E�/�S�yT�V��L˷�QlݽQ���ٓ��X�����Ձ�<�2艔f�rO[�ɀ\\r$D*>�@�bb���G\'P
|_�\0���/�8:Igb���Hp�r���#��B�	*s5��%[�+Fc7TGXb�3X�&�G��RƚCp�9�q�M��鉓�7z�KѴ��<���5v�\0حx�ߎ	�Z��UBK�Gv��ve!F\"��a�ZbE��s��\\{�nѲ�(ͭ5A�$���c{��i����}��F#̊���u�\\�Dt����
B0jCm�6�y�\\D�.��M��M�
��j�j��\\_�v{����$\"���ɯ����6���H�t#b��
Ǆ<H��<�؝��K�ȼn���AБ�!F���b$�l�V$p2rL��<�p���@Mdeҽ3d9QޤL�!�$�X��bm��}9X�����<���Y���MVj?�<(�r�o�xf�Z�I�-�*A\\I�;*E~���Tѻ�iQy�я\'�Z�6���q\'ɭ$����Q!��@�E_\\���
��|��I�(�/���7$�MD/�M��vϟ���>��=�Me܇8Y�S�1}���������-.O\"?r�%?\0D��#P��m\\�\"o��DVwG����J>e�T���( �iӃ�=T��*qY�6��l�V�/@v����H!0�z#�	�{Ŷ!BjtȪt\"�a
k�t�k\0;����j��+~���e�A���/�-@�a��\0\0�iCCPICC profile\0\0x�}�=H�P�O[�R*� ␡�hAT�Q�P�
�Vh���Ф!Iqq\\�,V\\�uup�\'G\'E)��\"���q�=�����
Sͮq@�,#�L�ܪ|E�0�>����(��Y_��Iu�Y�}V��7��g�nX��ӛ��y�8�J�B|N<f���.��ƹ谟gF�Lz�8J,;X�`V2T�)☢j��Ϻ�p��Vj�uO��p^[Y�:�!$��%� ��2*��]#�D���A�/�K&W��B�������l��䄛N\0�/��1w�fݶ��m�y��+���6��O��m-vD����&��;���.�#h�����)���5wn�s�>\0�U�88F������ι��Ӛ�C�r�?\"?\0\0[iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:e80094fc-e5db-4b5d-871c-4837ffe60b8b\"
   xmpMM:InstanceID=\"xmp.iid:0280ab5b-1e81-4baa-bbbc-d5bfdc3f8bed\"
   xmpMM:OriginalDocumentID=\"xmp.did:19384096-6c09-49fe-a7f4-ef1e23d899b6\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1602735017102960\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:005e17c1-e12b-41bd-a045-887d764fde16\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:4505026f-ec80-4470-9da6-bffdc05cd363\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?>c��\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�

����\0\0 \0IDATx���%�q&���9��%�ڗF��E�q`c���H3C�1�l�@O��z�y���D��4�H$1\0��ݵtfV.w��s�}~�{�����]�PKze��ʊ7n��_>�������+��.�W_|U����\0\"�|Ƿ����5�赎��埗/^ud\"��;��_]��\\��~�\'�����W﵎�
2�jA|3�u��T�KY��6�̴����23KXoH&	� �̎�|��W��jX��չ�wMKD!XU�=�*�����M@b�n>ߛ��U;�&�̜s��~L	L$���K�J��L�����Կ�����߄��Ṗ��
!���39��]̬k31�k���j�X�������U�i���:�o\\5�1
��,e#T���ts�F2�9����Ӌ���q����M��`��܈rΣ��sUUUU�}�V��*��%]u�PU@.\\\"l�۬kS�Y�/g��y�Y�8�{��d���ҘSτ�Vm3��F�pq ����c�H��L
Wլ�������N���r��`�!P��`�~=����k}Ì�]�c`\"v�XD������������tL}dn���ԁ���{K} �b�B��M]t�l
���&�Ŋ�H���df�!�Oώ�e�>߬{u;�X��:�B��Q�j�6�0�\\+��dGw��]��4��.��Ә�����DT�1Dag��:Ɛ��&�X�8P!H�TݝcB��̒朳ږWЈ>�x�|zr���ͻ�7o��n�䰬}^X(L��uE����,�\0 &�Tu�D����ǟ?{��xq�V޵Ӯi� ���Y��!F��D\"��q�y�p��\0R�!�M�9�s rr�@�$�@\'��O�}1��z�w��v�\'�~H1�u��!\'u���-�����by~rrt�������[���(,A�`��s��O�f�Τ�Y�%r\"&0\0��$\"����ǔ�c�U���Ou�j���b���W�7���T�PJ��{��8;���pr�D������翺8?�$<�{8�3�� 2\"
!���d2��I%�y�Cc]H��m5	���9�c]U��0ccY�&]��cL��WA��lџ�|�Y��nߺ}:�S�0�����������~���5v~݄�k�^`\"�����f�!pঃ�$f�GO����jy{�5ULêבɈD���$���\"�
�MCIḥ3WM
U\0;�I(Db01�3�Ù�L����V����7�������yo~pz�rM�<���ǖ���?�MgJ�PUw����J�赎�šRVg
�M�B�kW�.�����l2�ߛ�����i��9�. E�\"Gg!�9Q���N�/vQ.�2����c���աb�bA��U>;_.G��~�G��e6몝�EU_�����o���!6s$p��|���~A�ٴm+
�!JMU��5��\\YK�T����`g\"��(��y��	���v�Cܷ?Š�7S33O�nd \"m�G�X��b}q�����ᝮm}�D�ԏ�\0����k��ĝ���,�t~����w�ͬ��>����6!��
(��\"̂���L�A��hkG����`�����[���
#\'T1;jf���
���mHc]ŪꚊN/���?�Us��&]���l����3$�{��!wg�Ȓ���ѓӓ/�t>�O�(x`���	Z`y\"!\0r&g�@ &\\�`w\'�����ri��Ee5\"S�ɔ��
w����%��A�f�ͦ��˳�c\0�ٜ(�C�+J�lg��ѷ_��a1��l}|���8�Xo+�u+�Z��46���}F�,�,,03\"����R\"Ʒ/�����������
>4����݇M_�hۮ�`���*v����ӳO/���{xx�Wc	c.p��Ȕ�m�㫓g�d�ݷ�w��A^8�艿t���
W8�����1{ޛ5����Φ�� !	d\"0m�M3Ϟ=Ƹ�$-�f\0*nH8��!u��0�_@��]A�U�f9�����+f�����49��}��^�N����o׫�n�TH�V��
�Pr��5}a��Ko�k�>�6�}]����z����|6��iV��12#�Ȉ�������p>o��������\\{v�rv���69s\0�K�\0*�K�U㻌�%�C�������>\\�/�s7�\\,/B=�W���պ軯�� OL��8==~l�s�E\'ud2be���(A��É;�T��	,̡�B�!�0q�@���ڒ�w�fG<TU{�KWD`��J��P�`��ݴ�}�p��g���to_-Ew&�
�}�9wއ���y�<{v~�Er�p����D\0;:&&����I�s�1�(�G� �\"�B�\\r�d����EU�9c�G������@�dp\'!\"7*����\\E6�I���\'��G������3��Ƴ;�߻�6z0��[�����i\"!r�%���Ș��$�[�;���\01B[����8�����K%���X�̪�~�a9g�d2*���*��,�Ė����`6gx(>�\"H��t:ݟϞ�<^^����.����@��;��yu�lX-j���Z�
v��Dl$`�=���d\0�P��PJX�%��$ԓ�s-\"�v���]�	\03b�I1DHe�9�x����f[C�`@�.��7]]5Ul�j6i�~�U�̋�]8{޸k}mG3�ˋ�4���ͤ�1x�[I�S1�L rrgr��8Q	��:�؉X��+	�u�LI���((\0`��%;�#֪J,9g�hv����ԅ��.�\"�!q�k�����u�n�f���$�k;��xd�h�:q� �,M�i[G���
0]�r	��`w�Q6�-��0�P�)4U�!/���3��\"n����e0�3;
p�
�/��n-zo��ɫ�6��q|��oMA��%l�u\'8[j08��
��7���yX�O�j�Z���tq2�1éT�4�d��*ql\"�A���ȱ�m�L�f*\"��r\'31N��}߳HA���H28)�wuN
aO�H�B�q82*P���B���p�o�泇��>���i��!��.�N�!��WU�F��\0=ߢta{m����9���0��Qv��,���߿^:p�<sOA�X	T2q$J*�Opwgr���A�b;�@�%�]!O��B`� BWp�99ps��k\"�f�g�ѐ\'\"5Ct�\0�p��`l e����b����Q\0���[_���w!���\0BMS����Gf�|^;u*�@\0_&t�AQoE�M�AH��\\������+A-�iT�/���E��l��0#q���{�ꋈ��B����BlJf�Д���?�v�h��u]�V��(^\'m#���vb��sU�
�9��ab�iYb��FN��`dP�����b̃&S��m�2;D�Y|K��$DN�1�\\D��b�1ƾ���Y8�@)18ѻK��^��z��ccd�[��V/�)�-�D^G���V������4i�4lF������p.���<�����{��YGU$�L[D\0bfw9��Ld\\��)�HtW&�Qb����<Gn�jf��y�Q��E����2�[�y���n��D$�U�@��<l�i{�Tl9qA��2��3c�rݗתjf
M�	�JLS�����TpyZxy
�eG�/Ӭ�B/���Խ�L��y�0���N��<��31�(!�8�f�H0+�����0��=��sa(��\\�PWU���?j%|����.��14�bJl��\0O�sQaq�������U�Ҧ��Ch�R;���I�P�`��J,���ťVՒ-��]��{���	��0X���
ъ�jfP�騔hi�%-���dw&7��tp����b�x[	&�yKk��Go۸G�I\\.S]T��P��ad�F���`/\0/i)!�U�VG��`��k}�sO;�\'F��mf`\'�)�;x)�De��c&�@!�u]�M�������\0F
������hBW�����\0P��_B�.���Q�����U����{��o���23�2V�J�2�����8�q�pڃ���H!�MW�x��[`��A&K�ݮ���\07�ݷC��݄��!�x%�m4W\0�E;�W!���*�}G�s]gzt׶��Bp�%C�5T���3�;�80�03g	UE\"�1ƺj;	İ��*H�W^K��L�EGw����XA㻸l(�Ď���j2�ȼر]�������:��&����[j&807%���d�-	���C�/���L�#a��AX�EdG8&�۲�L\\\0~��%d�����]��d��P�q�,
�h�rJ�0�lfF���\\��i��0mw_��TҴt�}ã\"���w�z�JJ
w�X��EM?��iU��iڶ��1��r��S�7	�m΂]nKՒC�\"�lZ`\0�L��5�JD�,��q\\�l1Vc�q�9���
k	���?_ֶE��Ci�-�ﺙ�E}�<�7۾ҕ���� ��@N��x�LUU�\0��U���M�7y���W�\"\\ 5E���bf&]���\"KAґ9���<߀5$�̢�s�L���9��8�i�<	��c�4MݶMUS]�t4�.�6\0��bŔ�;!�v���o�\\]���
���:H
���ͽ
��ǿ���m�n��/����\\�m�\"o����E��]F�ٴ��f:�EBl��q�J�G�QD&�vKy���W�u���͛�f������}�G
zu}cX��8}���GO���9�4��O�ܹ3��gg�a� Դ�����i��`aS��j�^�GG�UU��XU�;/�@6�MUU�i���hǏ?���l�60�(H���������,�\0T=����f�Y����X-C����Ç���O���>������l��G����\'�|��\'���Z\0\0 \0IDAT������V��֭[�7�w��t��if{���ǿ��/���g�Id��u�M\\�yK#�--����&��I&�<���_�U�&�mSRB��aۊ�k�KiX�}����z�ެ��
�����?�q۶��]rCe�����Y��\'ǋ�����ν}���m�j2����뺃�U�q�^�#�U��g��ry���{������>�l3����N�/NNNn޺�?����\'?��������+��l&\"%�\0�g\'G㐙���<�?��:����M��G�f%�D(	�-/�����7o���,��Mb�/>��-�U�� B�iLf
���z����X,�7�u��\'�}���?����s �|��
��s�|K���\\�t�\0;19��A���������<�y�g�Έt>������@�>3J_�|p|||t���ZUU�a�\\���V�e�6�{�N��>�L�S�Y� rs�^-�m���TATD��{�ף��c�9��-B�uof����ɬ��|޶m2��8h�n��X,u-�ݻ�C{ ��ѾjD�5}{��U�J�ݘ�����w������6���Y����pr\'͆����ܷ��B>?�N�u�s>[�=;9�꦳������po��	�j��_���ݜ�ܠ�EK���Q��AAY@]��7�&V�M��n����:�4��\'ݬm����lnDP�nf��T����WU%M����\"���J����t��c��t����Df������M��_=�ǔ�6M�r6fc8�l%�#F�4��[3�?�����޽{qq1YA��i����&�I��Y����D�L!T���	�sP�}�7�Mi���ߟLr����Û\0��)5XQO�a��y6E�i��l�T��yzzb�k;��k�a\"��Xwj��[��O>��\0TU�r��)�g3P��-��{�\"1g��<0�;I�}:�t�^���j�Z.l�@\"�@����*4Mkf-�i8�8��	#�Q7����(�B(ദi���X�1[6
:�qk2�����̻E�.DՔ��0��a�<y�h�C��:b\'�Y7�1VU�Ǵ\\.K#Y�%�SzJ�)VҶ��(�JP�,L�\'�I�4l �8�L�������*I)�4�Y{ƶ���4�2s;�f�=�8����T�`~�����\'��/��^~\'�kh��8\"��I�\'����ެk�0��f���{Dtxx����G}$�eEV�%.l�����q���8��Ы�U��%B۴�nF�z�::z
M\"cEDj�^������ZB��A��өH\\o��C	�d��C���UU�b��VssR5G�͘�����������u?ƣ��E���X5���/� /���]�w ��K��G�k{w��G��wc\'v���[�����|�����i�u���i�voV����C����L&����	��~I�����K?	�D�@LRR��Q5{N���r�\\���*\"]��u]`�eܽ��^����)�\\ ,)
�9Y7U�(��[��w���P�U���b�\0�ME\\��P��+@}aa!)l�C��8�8�\'�N/.��8ܻ}�m�X�2t�� ��{{]7��1���r��\"��}J��\0��=3�+=ս�#�3o��0l����\'���|q�\\���b�PQa\0��?����&���C}���+\\:�D�f�ϧ1H\\�/�޾��W��ѽ�����.��o�������\0��� rfrl�~(����H��2���bMuL�3`�J8(�l]j�����ک�i\'�V$9r�4Ӯ��rQW�����E�3\\�]!ff(�0�)
�	�BC뮥��\0�m�aX.�)���nY�g��j��OH-��:k/����l���������M�uUUFiGv�\0��R�y2mE$.���I�Jb�$��8�Q�N}�,ٷP�-��u��F�\0���n#ʔ�n�P?;?k������:����������I7{vr!\"�0L�SU\'r�r)�|�`0vh)�[v\'8��_��z��9��m6�����\'G���G��֭����?��ON��7�E��g��q̟����>Y��[�7|��w�B�8?[�7\"B��(�8�jrE����ʏjs�H���
l�+&�C��3�Yڬ��O�6Ms���;�n�usr���_<6�n�?j��gg���ɽ{w���W����\"g�Z>��lqqz|��l�b�]�L%��yH���?����߽ӆ�O9ցEV�ͺg�4�F�gg�ͺW���W�tq��05��j5���9|չz��Ui�����{���X��*{�C�mA*Z_�qvp3�������b�>��0�L�.������Y��lK#�\\.Kn+�0f�������8dw���̴^ۣG�n�d� ̫M�l���*�I�4�|ꤚR\"���ѣG��z��|���Og��ݤs3�q4�yTqu���|~1,�iL.\"uUI�s�~�_�{�o�;0����|�v����G٥�L�ZUr��3�;	|db\"�\0�{*xf�^oJ)���}aoo��|�\\�7�2�ن1��f<�5�M���%�Ûe�
5�]
I�k}+R��C*x��󃻦TE�����?9z\\�]�Y�ɔjD��لDę�P&��뺭�@��h������d̓�d���������ӣ#�-�%�9��n�������|��%|)�w������4?��GG�����)ñYj��Ԉ$�A\"qD���������7ʎ��m��>}�

`0p0b TU3�oU]Cc]�<j����B«=4_��|����M�Ճ_�M�6i�]wGYӯ�d��v-T9��7�Ē��kڠ=�f�\\4ę��LSҤ��0f
\0����h��N$+\\�\"R�P
�1���u
�4ƑR�X,6�M]�{{�����������b�G��,���ޛ>Iv]���{�[s����.t7zI�\0	Q\"EQ2EӤ�%G���p̗��|����f�i�1��-MȒ,۲dR�h.\0	$��k학/�v�=g>ܗ����w�_tTduUe��w�Y~�w~�ns����<Ȥi�-�:��^�_\0�8��y>~�m4\\���{���jAD$f
7x��haDDQ�L�I��S
��9<<4�D����4M��Q�]��c@��b��w��Zk�㵠� �UU�w� I�h2��{7����Y��l�싢\"�[�ni���Z\'��d����$v��r�2�v�ڟ�rU�����o���~�ǈ>u��g�=
��$@�E,�m�!�\"	�LBzcC��4���8No޼��1�gv�ɀy6�-x�,GG3\0��[�����,EPEQ�n�\0�QZP��;�q�������^{m6;Z[[�|���:�m����\0� u�wX<�(B�)Zo�������̓ @\"�r\0�\0��@H\"����D��0��Ű�4�H\'Y���p2������W�A)�ԯ��b1ϒ�K��|�͋O\\����V��:J�����Q�°�eߔ�|Q;������?���_k�vo���О?omm)�J��m�$�^���@fa���+Q;넎���˝�6����KI�en�DЍ\"�0!D�V�f0�z��
QQ�QR/�BJ�����A#3� �)��J�{�(NR���u���a����/O&B�ɳ��R���M���;��ݽr�Jh�������\\__g��d3\\_��UAD��\\)r���{�ۺj�<���@jD�P��-\\�j���G��ڛ���5�>�1� �t����A�}a
I�ցP۶���z�:��b�F�X[���K��3UU�q\'I�$��Ș������)ȑz�ۺ���yq���uJ�6\0�y8/�$�UـhE����kǍ3@���-��*DA� J\0H� ������2?Ȇ~H;>
:\"�	�Xt�D	�a+�{/�a9��#P��DumLEQ��I��n�}��1��ڰ� �S��FCo�;�H�VJ �2�P\0��
����G屍��:� 4��i���ʐ�d�#���0	3&2��AbPR��s�[�4QX�`L��D\\\'��d��$�ĵ֞p��9/BZ�&B
��ޅ�DZ����ι��A/����%��<�1����\\y�L�+DaV�[{�ú`��yQF��)��l�+q�|��6�󐏒\0��T�H��1_� ��`1lT���81!RO&��i��*�Ҷ����`�+K�I)\\u��w:d![}�@`� �J��X3�
pA}V�=�\\���;����=U��=ljCP�
0ˇu�0Ɣ��0ͶΟ�ś#ה��Y���;�g��WU,ޓ�^k���J۶Zw�l\'�\0��4*C��a:�#\"��fN!4F�Q����2�X����������9�V:��<��wo��{�~	P\'i��=pW�	c�!Y�A
,�,MQY�׆�͍��>��K���ŭ����4F�O^���(�G��O�[f�,a�D@�@s��>
�VU�u_�j!L��1q7��@gn�ֶ�9/\"�\"8jT�$I]�׮]��o���I^��e%&6�u�i{Nb�$IXr�8�������Il4!�����}�����?�����϶�fv��ٍk���If\0\0�X�����!XcлP�O7�B��6+R���T#�,�*\"��Ҷm�Xk}۶���J\'�#ҪuN��~�o������=�D���P�4�U\0j��7�ϭ��c�����a����q���*�� i����n��������W��AST�$́,3]^�RD֜s\"
�)��6��6m՗DK�I#bЉ^�m+�OD$�%3A��)��7m\01ۍ���\'�]���KߺѶ�օ�A*��6@�T\'�38�~@���~�[�~����R<����Fp(~gw��7^+����>x��<�Ed2gyҶ������i8���C�(��8ɳ$O�Agq�&:�� h���¡i�;%A�l��������D�X\'I��3׫��pq�s{��ͷn�\'Z�ܶmӴ�����X?��?��( ��$2�ivwwoݼq��C�����ΜY�Ї>��/�M4�Xk�8n��t�4
˜;�ˈX׵��MjB抈��y���;\\��C��at�Z�\\�6�4M�x�8\0������e�Z�\0\0 \0IDATYv����K�.j�uS���|;����(���rc�g�~�Q|�C���q����%I���޽;w��-�\0�H=���4�?���7�~c��=fȒA۶��kF(�AH���^�;\0&��H)Lc�(,,�:F��]J�����/�$`faBĶm���,��3F����!�x�86���֍�3g��k�:0H�����5��w�*���G�f�Ŝ -�+�&��o���K,��7��
����uJ�!_�4��5�k�}�e�����@�5MC���3�ڦ޾}����;���\0�F�J�#��Q8hΊ*N�օ��؋/���ݻ�6�ò,��i�`]���,�@��B1
,����@k�*�zQUi;���I��&2I��,\'�m뚦u����
 \0Q�B��C� <�P���MQ�A��#������.��˵�\"�\0[�V�b��M�V�t�(f�b���mn�RJ<[
�
�ղ�ID&J�ml�\\�F���� ����k\"Ҷ�ilH1üG۶�Kٛ\"n��;���ٯ� \"ethA
�x���EӶ�m�m�11{��z<���׮]c檪V��.��9l�V��c�$
m!�D�!��Q4����E���+��)����L$PL���ú�؟̂��~�i��@X֥R*H�1���������|�c����E����(��#�h�N�����J��)M�ܶζ���ۦn�$Β$1qBJ�QZ)6���c�]���QQ�	{(���Bom[Wբ.��ֳb&�\0$ފo#õ�h��F��(�����ZA  $�$ݒִ|K���{w���O|�S���׾�_�v��<K�ֵ�mE F���:V�]�L^D�i�#f�䊀Z)E�}�4-{\0�s��}����<{��h���,�U����>X��>v����m��i\"za\"r�FO�^؂��V�6�\"���@*�ܾ��\\���+�:2)@�n���g�ڲ*�b6�Ӻ��,��4���������56Fy�:&`� �D����JwaNk��˺�,K�R��\0Ο���A��W���}�L��p��Z\"c˼���&(\"�9\0�����B�F�#�a�$\0�J�/~�w�43���b�@Y��F���Vp�|�(H��q���{�D�1Zk/����Ll4)R �m\\]zǸ��\"�h�Q�.LD	���o��1}�+��L-T��J��q�y/�I�1�\0��|U��hz��Ե!�s�kMS{o��;7
��.:!uO�4�%�ґ�����\\S�4���5.=6�ET�	\\�����~��楗�QՓO^�m{pp�y�Lݔy���\"\\f&�-\0����k	ie�!�HE����~�����}�\\T������:C�����?�?�>�\"�
O ���ФC�D�����[�HþmU��^�w�zB�Miqr��~�}�@��W������b63�ʳ����{ww���u�&����А�ީ���pe��e����\"��1�9+�J�`���|i���ֵSQi$R�l�f����~�����7�xc2�i�X,�$�e���_���{�I��u]�9��zԑ�ܽ{�����?7���j, I\'��i��{8d�u]i	f��L���à(TV)bV��Ea�Բvg%��vַ���H:a�\']
��Bh�:�f�����������I!2vjK�P���AR���{o����X�i�g���\0<�&��8���\0D/�|>� �d��+���JΞ=���nWFM�j�U۴J�SמI����~i6}�ʕ+\0��9���Rf%7ֆ�<�u\0¶��bZ���/���s�2r�ν���@�NWʻ�CO��0����aŗ���)*������C��з�	!���`��|Ƥ��q�f�:4�Nz�)s������4���������wn���L�X�p���cc�s���3&I��bf��t���b\"\";���23�����(������_�妎^���e
��/����8��RM��������������净B,�-��6��������{)�@ȐBA�
�E�H�\0`�P� 
��^���ݻwO�U�+$KN��,����[$PʠR� @�APlۈ����<d���5����G��*�j۶A@������ޘ�ր̮Fe�D7�1F�i�ٶm�X��q� ���(�#�d�Y��!h�����8��1���}|_�z�u�gg�!�㶮�$�ԧ>���������,9F����	Zg�M���[����y��sϗeD�&�3EQ������H����j�\'�e;�J ꓄�ͩSc!��%,�!)P�����,�١EA�2��L���;J�G�4���&��M5�C$D��;g��888888��)1kC�6�����c�U
�)�RMT̎��X+$���󺘶u5=�cg���[�bEq��&�DB��3R\'\"��)2��0�Ri&��(�ǂ(��
<��1tr|�����hfiQ�Q-�[qj�Z�2&JLk��\0ԭWdB,ε����1`�|��Y�m��t~����C�η#B�7��9�-gz\\]��ֆ��M]E1[̧�k��N
0�\0	(2��8������+,�>չ�u�1�%���r%���ή#Ѭ,[`����8������??P�ʳ�9�w�g��L&�����7�4�����_��τ]gϞ����#vQ�(�ܹ�$I�p��N�Pˠ��Dd�F���Ҹ~شm_��y9��ɡ�HY.HG��6Ơ҈�\'#�쭳\"�J�d��/ɩtJzy�E=���>�AZEC��!����D��$��]c�Z��#�u�{wz���}ow�n1=�I��A�&Fǉ��8��(N�(&mHZa`���g���pf��VZ�\0�v�8ǥu_�u��W*��$�g�%�(��ˆ��42��\0�H�1��l��F{�;��p���s�~�n߽9=:̳tmc
#�������Tk��Β���︶�{禰cfb�*EJ	!������4Q8c����ܹ@�
�؆�uE��a^���d����\'���eĦi��.���C�%�Y��H{����
�\"B��\0�l�T?I�@��.U�J,|e�Ŵ`o\'���x��o|��W�����}�ykk멫�������ۃ�詧�A�8�,9*�݃��������0Z�����X��v:�c��!Я����
	A�\0���Z+Dom����a)�d\0X\\(�����=\0!1�GE��E����:PJk\'Q��F!F  �6{?f�c+|HR��
{d D�0Ҡ5��I� 0�n�1˒�C�@�MC�u؊�H�$ &Ah���o��ߺ_�է�=5��F KҦn�R�hM&d�E�n\'l�A$��k��b�1�i�� ��1d�Bv�=�w�}���^����.�ƣs�\0�9K���:)��n��������>��G~��_���`��fH���$�s.(FQ\0�����9`k�͛7�$���i�`+��J�N�\\�9g���Ed<޾}����?�ݹ�̳��O^n�ֱO�LN�U����9N��+ 0Y���m]b���Ǒ\0����	������Ze�$X�r~���r���g?���гq�蝋\"CQd�$��R$����`�Ν[��nWe�fi<Hca��D)1Z�I�MWp*�����)A�P҅���x��i|Sfi~�jz��~�k�h��锦i#\"��s)���u\'����u��3��8�t\\��0�S�Z;�EI�ky~&�������G���?���|ty�L)�I8��h��6�67��������/]�r�(�m�*E,P�e����0[�:��m�/�z��}&z�=e����_��x�X�EgR����/��;�n?q����������Fq�gD��R����@��.1ՁI⻅����n{��yA#�
a�[�2���i��4!�ZJ�,cQ�#8�qc۲,^�;❈D��\\�����(�D
�Vh�1I�t���	Q�;����q���كx���ܹs�1m����/�����~ekk���0��m��B�.V�-�[H��P\0dYv���\'�|20\0)� a��<\'9�������/�T�<{�����%ΊI;B�u��8\0mj��F�[O������޾���|��?*�z0�.�$���(WN��n�H��C^���z�-�2MS��*��<�����ҽ�_�?��sύ�ASVQ�i�`Xd�N�>��3�*<	������XF�V0z��z�u�)c�I�q�Dz�&XvP���v��i�}��&vM�4���5��l>=\0���5�xn��H���>HFJkC&�J��g�r��|POĮ��h�j\\��4M���k��b��[�n���<�����ʲD�T\0Me9
\"x�-$`�N,�����ī/�%��VB� %���fᚶ�����`{}mb4�=�) �� ��1�
�����`���ڲ���+��d�W�Q�v���~�՚�몼|�r ���;\"��8�ۦ9:���=���}�V9;J#�q�i�ЫQ�5EI��I{���������x2Y�|���=���7_��_�����+a��O
�7^z�n�(�Ǳ���>Q�,�\0�<o������W����|��O|�ڵkZ���z!4���q/��>�:������p�}E4i��!J)E��a�
^*�v�����������x��\'��D�{��H�HU�wn�|���b�F��Ƥ)��o��4Z�l��*0���h�,!���t:���d�Ϝ�8�ݽx������Ͽx���0��V�ݟ����o2@Ea�=��P0�ѥ�VJ��<�m�|�W�����e��g>p�ʕ`���V�h�C�����4�Pa�*݃�a�\'@���w��ًH\0
h����ya�X@E)/oˠ����_Q��mOQ��x�J�Td��\"BAĢ�gY6�LL��m��a�l8�9X�y�hc�LW@@P�%D
��<�=ۀ\\�m���6��PD�9s��\'��<<<��+��FvsY��GQEQ��y���-���^=��{�<�&hM�����(f\",����\'�w���.ũx�h\\��۔X�u�^y/�qfRc���ݽV��d��766�w��=�\0y>��d{�>���e\0��h��:�u�;�Ù�&j�FG������׏���4EE��{�,���;�I���ѡ��S�����KD�~Q�8��sv�N�a��!B$2��Z6���u�1T�A�[����7��H�HG�X�\"��Ý8b�8��$M\"��\0�V�<�2Q6DQ���B�L�W�#_HA�0tC�6\\
��PYax\0�P��b~|�}Q�~h�MӨ(�w���j��0��X��p1��\'�^�I�s0M�T<�c�ؽFaV�AYVEYWM3��������W����}���wn\"J�$a��Y.�E.H��ZTE�xϓ� a�I0��N_Bz��}�S���t\0w������5��/��	��Fg�S@��� \0	+��*?d�~�{��	��,Ls�l4p�Nl�:�q��O�}�[��
���,)I6ϟ�t�Z�-ܾ}��� 4Ϝs� I\"m(�V�w�i�Jy�W;�\'~t����I��Mh����	������	~k@:B
XUU�C����XU~�}�h�yOk�d	�wQ�ѫ�Sd~G7|�UzXn�4UJE���_��R���V>0���hlLn���yzT�m�:v~y��3� �x�Rk�QS;C��.��tAE&`g��~��w��A\"�\"��If�sΖe��n�SMd��z]NX�\'��v����~�L�*Q&�=L��4nފ�H����1�,�03)�A�$I��?�U���S&���������U�:ܖGGG������v���4U(�w��c����b^(k[���\"�M`m��dl��U����&ߜ�Ν�8:,
�q�e٠m�,���m\"�t��cDH����m{��m��5��ҏ����������#�����\'^z���+PnP?���~�D�OT�u�$=o��hq?ڏ���{*-�=���VT9��+�b�F>88͞�b���罏t��&����q�(ˇi|f��_��O��߱�u묵��1B+҈�l{wz4um~ns㉋N�ym`���G��<��޾}s�XLD�0�����|��,�GD�~t5�	�������G{_�h\0�ޥ��=�0�$�+m�M�m�`�\"�Vi���u�D^��w�0����A#�l�\0�����e)\";;;Mm���Z��f��وcG��h�L}t4��d<͚�\0� �0���
�EQe)Jo]��G>6�x4���p�I+P\0@Z���8I�4��s���[��P`q�ƍ٬x�ڶ�{����\'�s���)w�}
t��$IB���*p�{`1<��(C����It�}�4�� �_�f��űQZH%I�i[�#�F����%y��#
 {��m4�����4
����շ��ŷ_�X6e��[w�U��ku��*�MfT�3u��y�:�&��ٓg�����
�6&��nw��j��l6��������W ���:4((�\0j�2��?m���˗O�~��W��|����@vQK�^������D-��V+\0899��f����L��6x�e�H������Ǻ���\")����5jQ��x����q�@c�p<�����_J&}��%�<�݈�oQ|��M<\"����0y�9��i���E1��!�C����l���Ӿ�9��y�B�9��N���a��iȩO�Ħb�}��Ð�0�
\0�ry��sf�/^~�m�4�Ս����R4Z��Ec�B�Q۶S�,��Ş�r�>�Fͦb���}�SJ	Q���*�ME�w6�>�@��0�f�����WW�~��b@�j�F��C�b�eF`��[L{��B��aw����O<��n諪r�����ϯ^�5��r1�ƒV���!	Ҵ��D�q4��C]����g)��ׯ~����9	D�D�t�3�^<��m]����C�!ʺ��;e���(|�>g�~H��+z�DXĦ�����9��
��׋�I.���$9�w�sAc�1�)E��d6L㗊j`�o������94�>����w�>z�M�LTY�U#�������p�9��;%`�I�=Q�Ӭ���1�W\\Ζ�6�22�-~jiG#\0���*9GxH��H�z����m�Y-7����\'ۇ�+\"�KS�ZGH�X��\\��kK�T5�!�C�wr7�1�sV��	���w��R�\"��yl�Z76�]__Ç����>�f:ޫ�;��m�v�X�V���7NM5榯���zT��س�!JΤRyJC�\\^����UĲy\"�lVaVՎ��g��}�%}�n4E�G8F��؉�@�٢T�4fDVf�?ki�G(.*���n���r���d:k�T�P/�\"z$Dͪ��\"y��m�۲����Mƶ�l6�>��1m�@�4���8Ks���tiC��ܤ�D����9wDq�]�m��������
H�2
j�w��]m���˦uH���UX�@n.�l	�}���%�e�O��8j���ƴ-�,�>�dN�4W�b�uZ,��`�|���^��{�H��9v�.�^8�0�z�k�J�_d3H�Q��)��z��,K0��X,��9���������(dg�TI*�4����ͻw��~�*5�\0^Yl�!��ju�㏘Ң�<@�Q4�G~`��p��<G�Ꜯԃ�~�^�#���5��,)�F�����E�f�7i�z��e�7��E<Gс@ER�m���Ӟ�R@�rRڶ���_����ư�r��m�\\.M��\\�����k��{���_�uQ+�83��_���8���� H���\\��i��B��И$�*�\'��#���B<G�纾�6QA[.?\'
�� �
�!�t7�! �y�\'O��w-������R\'\'\'v�����E�Ȃ����<y�u�t�����%��|�Z���Y�J��~wQ+�I�`�*��IE�>���^�Z�W�T��3�(�#��МGf���4\"��\\a����L��Q���5j}�B!-�h����	�F����,9��.�*�b��	˗�=��K��3k��m��n+tn��b�0�B��1_�r
!x���7o�sggOf����\0��9_!�Ĝ�DJ��%\":rDΓ�$�Z?)�>
r
��1L~�(9�Ŝ��_禌>�n����g�l���4��)����.?Y�B0��4�,(�}`�)
�!��(+s�6ܑJEf�����\'�z����>��fG�4�����z�\\>�V��)ZS�����۵�w\"�RJ!�27U�w������Q�g��n�Ф ι�qU�*8�ܶU^�/���w���SQR���-Y\0�����q+��=@9��9��ٙ��c�A�K��/{������Rșc�����+�(Dc�\09�4�9sR!
�rQ��T�$���S�sLC� ���h�ܲݲ)��Tgw���4n��q��}��ڪ��}�����^����z�u]�yF�U ԋ�o�^y�iY���C]�*�#A͒�c�����g��O@X2?G�\0�5�������u�v���f��7�_�����VC
�s����{��[�M��7��g�w
�ߏ������Y�Lj�c��NjRԗ�i|SkF�
;�}i�Um+gNU훦�CEDF�2U�2[V���6O\\ӌ�1��=��{��w۶O�<1����Y�����~(\0x��}����.�_��]4u���gF ��&�m���a����L��D���+��l���V+|�(�g��|>/�����z�1��|��V0ٰrAF�MJL-��ֲ7���y\"�\0{�Q�i�٬���3.0~p�ƱMح�1s(�����#)�����e.H�#����~�dUU?��CAsLFYUONN.�ޫ��u�vn9����m��&�8�a�~��E]K��e�v����6U�@�9��n��iw�?j����U4qR}|��R�b9������r:e�v��E�m;��
d�����O�%L���AU	����Q�~�u�J9��ȥ�H*圲�c4X~޶\0~S�\0\0�IDATTZ�\0d��D���G�WU]7�s�U�uS�r�q^W�۩�ڻ��&�뷀�u媀�a\"��$�(��x�q���q����\'I1���
:@��֢U����s������������|>�i5~0Ϋ%L�!~DK9����ED�D����j@��?��}��ܑ 4_?��\"������*�!Ծ�iV_�j)s�j��璾���a@��v�l�g3Ŧq�s�M}��{�Y�7�%�Ӽ�h�ܗ*i�����C������W��NN�sMU�a�n�μ�>Ͽ��u�3�ԾؾD��1�I��H�8��L�N�gm3�C�}�[�>���-���2\'� �A��ߴu��mcL�B=��**��� ��,˙E�Y��@�D���	ڪ�.�CUUd�,���xU�o\0���s�Б3O%\0#�����^Ӏ\'c`Y�e �QAԄ΅}S�����@��k���E�w��buì\'�e�<\0�OO��(Ŝ3���nQ�GULY��\0�CEN��\0��l�g�#�ӣ����؉����x?���M�P�\0���;�]�L�H��E/0��}�#�h�ɤ�*+X����._Q�vJ>��j�-��f�u�5-�v,S��F�麮�:U��Ixq�pX�Ģ��\\�aL��7?��O[,������O?���o����˦&�7�2{zzڞ�P�v�~��!Tq�[G�113�#A��&?0��r�)UUŜ�3���{��ɏK瘨�\')�ze�\\�0��rt�>�R��`?f3�Vq_^^�u](�jv\0VuD|���nƑ�DD(�:�d�S[C�U��Ε�8-�
^0��..%����b��5����������`[���g��5F2���cǴ~��v�eg�ܫ����&���Î=�������z}�70�)+`�+��|����!�rBT��ƽ߰�5-�?���lmL1;���zQ�1T�hQ�Ț�a��`,gM�:�x}}]�PED�d��8�\\�UUw7��̚YD<�(����֞w5�P�\"x\0Pp�{t��ŌA\'!�K!\"��Y~�����eȩn�f1\'��Db�~�a&�[
�����n�m�>9r�qK��o޼Q��s�\\�9�^�{�r�W~�T1恹�C=��Y)�B�ʈdx�S������M��JARN��2�)!\'�5J�b�Gy|M.G��X�A������^���&<(�$<��������a(��
���
��JT�S�t}���v������w�-G��>a�ԋ�=�_.������W��v��%Xx���J�T ek|�����fM��<�\'���y\"�ˆ�~��}��O�f��lf��n��Bc�����f���f�����7	�#�f�n�@��ZWN����،\0U�)���_����8���f����b�W���
�sJGR����t���6;I+\"����b^`�Xz)tʃ��2a;U0���R����Jf,�����?���P����ڄm�\'���i��f��VɌ�������q�y��¤B�����>Q�{P��8���@��e����Fj����0�$X*��U�<ҏw5����|>���n�+3O�L�R[��Oc)��:R@B�泶M�H
9k����d���@��-
\0�C�m�3c?H��)\"�D9����{��{p���i��^��(z�5�Y��GJ��*�m����ٳgUU����;;����1!8S���Y��і�	��i`��CD��s\0�a7s3�cӞE�!�����V��ϯ��F>ޭ�I=�9߅�1K��L����~��hS`;c��c�\'\'\'�_����>??7T�QE��3�`DJ����hv�A4
�3Ґ#(`����d����u�`��z�X��y��cz@���V��������{�A2�p���9qv)��zfnˆ\"�$ft�ڿm�>�]�HΏ3K�;c�s����$�|���ι��ӷoߎ�=�`\"�0Zp܏�V�\'���mr����wS��gTr�1�C�hm_���|���A�*\"{���0m6}���NN\0 �C]U>3��p�w1\0���2:%���#&$0�u4��qr	�XR�u����+S���H�uݤ�D���tZn�aC��V�W���f�gc���U߼xQ(u\"\"*�\"��(�U1�Lj�UQ� :gzp�w���c����sΡ������Q,�Te��N����4��&XU�8�g���+M�{e�4�dePJ)T�Qp_��}��QBSK5P�����۷�Vl��o\"��}V$`f�CJ�����ɂ@S?<Y,��7����;@�t��9Q�q�S���Zؤ\0 N�[�f�d\0!
%nm�\0�0\"�<\"���AM��ԝڶ��6�0��`�ɜ��Gp.��mw��Ѷ��fmW�R7$t�s��	����[LQ��ܡ�q�9��\'�Wc����ų�%#��5Z�{���(h�W�+�9>Z3�^OD��b�����h��5����eɺY!���OOO���ɓ\'����f_ g�*��޽{���#���������P�	9xD����TD,�r�8��`R����v�T����8evC�ٯ��t<\'bi�#�����ʚ5����\'3у=�����1��������\'O`12h��]G�U$�,�d��c?�j��#K2ك1-EDO��SJ�c�9K����l�����ݻw��Z2�x�\0s.0�U�~�L~\'e��	�Fmz��� �F���:�`Žŏ���8ԟ���/۴y@�[��\0Dc�d�(��H\"oD@E\0r�^�桗��ϖ�3������#���SB��Ϋ���тMG�U	����ؖ�o�����_��Ɗ>�T�U�$��U�\0cdf���ʰ�9d昳7�*�����G\"�br6@��U��a��~���\0D�J�<���YJoT���0�C��	!�@	@@	Q��#��Z��M�	�����*r�0d��i㑘�r6��=���C<[�l�X���2@��=oIm���~{{�\"����,5G��&�B���12���4���`le F��̬�!� �nAA�\0�\0���E�4���
�(�(+��j����@���Q��@QA�}�����`�;]f���n�-Vc&��?QJ�#��y�m{�B���~��o��<��=UU�CBp��L�#\0����V������z������YMUEU�����}
�^ة8I�0�*¬m��-��R�G��@C��q�����	\0�Y0T�l�_��_<�}�}B���N]��B�o�,c��v����ޗn�9��kt��|`����6�o�35ck;Y��h�D�L�u:z^������3~0jH8rd����P����~;o�Bp�� ��?t��Q�h�\"V��2 M@0K�f���{xL�$\"�s�n<����
INSERT INTO employee VALUES("KICTC-STA-0003-2020","EMMANUEL","MNGUMI","TUNZO","mboya3@gmail.com","�PNG

\0\0\0
��=�������4�����F��}�|/i|]	�]���������g�o^�%)�~^w��s0���o_���w/�:s��g���h�~������=������uS?n�=㍄=����W�_�y{_����M��o���a�H�o���7�����s<�����S�#ne-���pcK#��i��ī��Z�;�x�ۡsb�3T
N��_{�{U�!��+�+��eN�y		�G��_��Q^,/̝�~}�J��-�Qz�N��������\0��s.&$2�+-j�-�q��gr�S���R(�KnR�$�G��ϴ��K��f���*��I�$W`�~Z���,��RJ-��2ʬ��Zj��
�fK-��jk���fO=��ko��>�q$���:��c�99��ȓOO�0�+��ʪ���ƚ���y�]w�����EKNX�f݆��t�)��v�g^J���o������;k�}�������#k�eJol�Y㣭�8D�匌��xS(訜�r�N�S���tE�\\eQr,(cd0��
ʵL���k�c���
�N瀹ع}��H�KY�K:�F2߮����[�q���Fh{�Pz�s���|i{�ɽ����4�#��}h���Ag7�uw�Ψ��6��Z\\F�cj*��nX����J�!.��.�Z9e�m�r��é+���%�1�Y�z)��`j7����ȯ�؉��\'q_V.����V�n߯+�L4(ʚ�y����8��5�m��,���vi3�;��&W�)�u�37��=\\�g\"V�`,���c��9�\0{��m������帻/.�қ�޸P�4��!�:s��;��!,�	��TЬ\\d.�>-lN?KVIE2
||�ȯ�K��1�+�D��8��W�����\'-#�譒r�2	!
��t���6.���Y���@	�<k\0��mr6j*7e*���r-��ΰs�#����r�<ꍷ���Y��As�L-װ��L�B����+�.h�]v��S����m�R]�@��¾0�*5��G�vS<~�p��@�j�r]�Ƿ�Ri�xR>�S�x�Z��D\'�sApꘂ7j)̹S�\0����^-lFS��
(\0D�[��wA\"9��n%z*�cN�-�+w����}�K��Ý�qW��(tV���	�3i�C�R�;,��
�G��?�^w��OWn�pC+8Yi$���Qe^�7��%�b�h��<w�a{p�ҝ��.�,J�\"{8ݡhrW34P�����\0o�ܸH��PغBܛf(M�_���QL�)N{�9�L�Y<3�rO�N:��J\0	���1ʠ�X��:/��V�)�a�rE��G�?w�ד��Q�QF�|;���&�4�uh�)�j�@y9�άË�VgE��u�
W_�:��2x$�����O���\"!��աqa��D�T Y�6�\'x��v��h�}�����*$kJ�6/W�u�4g�1*U�W�E	=�!`F	��X�44�D�87%�]��s2#�P�b2=���ɤQ��|n�)QK6TM:���A
�R\"e�?��������2f��B��\0�.��ڋ�q9�7qƊ*�|sGǓG�w	���{���%��
�~�6hߟ����=�F1�N\\\"��!|Ė����\"��B���E�a�4��Id��\"tì�$�mR��A�(�Np�H�w�@�	�sF�7&n��4
�5
�b�h��\0D�Fk�M��iKҋ|�^��h\\P�uє��Пi�-i�N��ӈ�
�2m1��.]�/@U��mEZ�m��Q2��.B�8��\"���g7���a��K}
�5��~M]��� F8:f	��\'$I�
0)��Y�5
tbg�XT?���1%~v���澸3>.{9\' �ҵz����]��@C��ʤJ��t�0����?�� 1d�n��} ���Г�]J׽��pˢJ0>i�4�!X�+��Ц�4�Yh���ٞ�p�h
V_Ֆ�ZH�ܣ� *��Dbq�8N�pe�4���~tP1���\0%�
�&\\�I١(�f]@��c
�
n+M!��D����U�vH
(��k%��;��*
��M�D/DBߥ|�\\�[Z�Ѹ{i�
b\'h�O�w�����H1�h$pOh��|�8�S46S\\�R�p�Vh�:$�9B�x�t`)/��S�7M�e\'�V���,GS!*���H�4��\0���U-JQ�E��oN��R� 	w�\0١���W�Qk@TUo�@J�e�V�p �V��]L���ā��f-�8�4(8��v���6�(���<h<�d<���<A
@i��j�`���:xE�t��	N�F�`&�~���VNAJ�����<���63�f�!P������=w�-���1����ݨU8�Pr\0?@��;�=��Ec�\0{��V����E��{��A�!�v���		0ҹ�f�Q�F�Ǯ���:	�5ߍ�:�#~�;OG��!$t�\\�dW��J�J0|�i���N^>�VW���bN0��bR��
��U�Y�9�w*ڛ�X�5GK_Cژ�&�o1�B�Q�L���P�/�b1����(�4`��Ƅ�2�
^Ҵ[@Ό��`F�Zq�� �GL����bB]-Zqu�@Mxhʗfw�*n=˰L��!�$�0�o���E�K��r!{Żo�S��+�������	m�*���V�b��8����1b\0šL��Z�Y55q��X���)P������)�R�	;�0.�\0����,�T��@�nkf�m����#W�����!��\'\"��R���m֓�(���M��t/�\0�iv��\0u1}$�
�R��\\��\'r�ks��%��F��D\0L��ァD`�զ�6ы\\���*c;���Bo�\"4��[9���0&jSFB�[MZ���iQ��b%���_�Z�фrjqR�VҜ<⯵�7�V����פ��3��]����}�\"�f�A��K��ѱI94�p�fF�X#���>���Μ!$ZvBL�=�,�;��x%;z�:�*�YWlNSgs33F�̀\0E�k�	�p��P�0{nG��h�3D��,�	��d��գ�\'��[��5@�Z\\�(o��f�{`��)5���F:��(�\\4.;�ᆖA7��U\\3m��Di�A�iȅzD�����E��$zlB��Y��I,B��Z
�I{���!��Ҋ$F@��052�yZ��¶QX���%��
�J.J�!�K
��ē`Ts�B�V���P��h�=�E\\��P��:5�jU��kU�yC��Rs��ydjC��عk�Ӣ\0*FB0�T�6\'Z��D�6�Щ���6n������b��w��%����b!����!rk=�-�����%O_Zs*��&h���d�ؕ͝^U�i���e�c���IP (^OI�n�)�x
M,�\0���~1����9�	�n��v��P6b�_��&#�)Chj-s�--��
��R�ڦO��4�CSB��{E۠7w��Cr��&Gm�������?Z�
��C��lS*�k��c�������t���j���⤮��m��H�HSE>�l�U	hhk*���.��Ѯ�^y�d�6������v�!�i��͢kE��,iMK�H-�h��<Ί����(�tD�
Q�Hڦ�C�jh�=	D;�Y4�@�P�ĺm
h������\"���#ږ��ˑ��^éeG��ϴ0�c���I3VmU:h\"���]C�c1-R�H>��srk�PB]+Dh2��ǐ�\0�ז��ĕ~�pʲ�Qn���u�&��Mm5k[@@�C[�������^P¹ڙs� �X��X]-\"\0x�Q4�4M�+]3�G%0�M;�
������\"��,�Z�z�\0̶vbw�/����1z S��1�����a���强I���I��sp�Y[��+\"@�6����G�JM\0#�����Nk-TfZ�j��
ZH��0�#Є�)�T��$p����\\񶷧��B���溴�5Q|?���?�P�]��L�
\0����2��x���e��hw�y~�n�J<�e
	R�g4k9�^B��F����.���WS���`62��\"�{ѡ�?�)a6��&h��j�{Z�y�m(݈V�K\\�$	����v�6�kî�B�\'�I�VCdu��U���L��\"P�Y�]>�vHSZP[|�[�������zG^9u���f5Z*ę�Юa�U�C�ܯ�D�X�~�h�g�����ƣ��K�1��p[���(5
C���5�:�~�p�8C�����xm��T�R1
�&L|1k\\�Z5��i�\0pj��>^	6���/��,de>��XC�<�r9�x��:�3{[�1�s�S<����@\\~�����\0U?������u\\j%uZ��s�u��PA�Ү�{X���P����*h�>�\"��b�Ǐ�k�{���3t!���S�»\0
]���KK�������DC���h9�O:�)�� $`���\0k57j�:btJ��ԎpP��e\0�8�9��ѥ~�z.P��mpb�~�dn�����К��;P�Ek��l*Vcm���E\'���%�����֢_���M����)��h��I���..�D�ף����p�$dCO����1W�Κf^�j d5-�8���F�%�
0�_��_�7�$��,�ifIZ{���h�e�4�J�#H��!�\0�ֻ1�ZM���G��iq}kŉ���T����x�J!�Sf.΋��&Em0��y#\'t0E��$Csq}��]�Mw۴F�wʆ*�A�v\"O�2�b0]o���H�O��JT7?��Z�v��&Eq�Ձh4��1y����D$Ahd\0\0�iCCPICC profile\0\0x�}�=H�P�O[�R*� ␡�hAT�Q�P�
�Vh���Ф!Iqq\\�,V\\�uup�\'G\'E)��\"���q�=�����
Sͮq@�,#�L�ܪ|E�0�>����(��Y_��Iu�Y�}V��7��g�nX��ӛ��y�8�J�B|N<f���.��ƹ谟gF�Lz�8J,;X�`V2T�)☢j��Ϻ�p��Vj�uO��p^[Y�:�!$��%� ��2*��]#�D���A�/�K&W��B�������l��䄛N\0�/��1w�fݶ��m�y��+���6��O��m-vD����&��;���.�#h�����)���5wn�s�>\0�U�88F������ι��Ӛ�C�r�?\"?\0\0[iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:011c6aac-a97e-4564-ae44-45a413cb63fe\"
   xmpMM:InstanceID=\"xmp.iid:32fc5e34-9874-4759-8dcf-ea2341a247ff\"
   xmpMM:OriginalDocumentID=\"xmp.did:11f8f5aa-b0bc-449f-b60d-e58ea10e5d96\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1602734940009856\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:846064ae-6b7f-4d7d-9e35-eb6552a13356\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:6346ba81-26df-4462-9a6c-0aa8e5258de6\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?>�Q�\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�
;-	03\0\0 \0IDATx��I�$�q&����m�Ė�Ue�\0�M$�o�$�\\�0oޛ?��$/<�43o�ds���~( v@��P�^����/f��\"sPsϬ�D�M&�0�yyF�{��}**��\'\"��8>������Kp|c��8>�1z|c��8>�1z|�=>~a{|	~.Ǉ��������������q��������q�����8�������G�����sЈ\0J�\'�\"\"���1��1�v��{��|����jCȳ@�!Ƙ^�t�65��eQ�ڶ��U^\0���nE��}��?�u2��g����Z���0�� *\0�a$*�@�4��l0dY���t�b�D�`:�ϳ,cc\0\\�yC	eYVU��\"\"	֪�^��n�M�#��@D��n)D��8��/?Fӻb�\"���ڄZ�roVE�YDf���:��5��y���(b���\\p�ƍ�;ۣ��ܹs��,KgܲQ��g6k|����N�l�FU�1iU�؎�J���;�>Bi�e�d�b�	+i�v����N�ha{{�ʕ+��뛛�	�O<�����Ν;��[[[eY�y^�5����\"/�
��\"��Oi�I�t::�kqb�&��̙3���g\0|�,��_��h8j}�̪�h\0�mS��s�Qn�6=�З�x���c4��\\�,�=3\'��h^��ۉHUg�������������?����vUUM��y>g�Y3����CJD	����W�`J7�7���h���i�xM/��<}lOW�[k~��/}�K���g777������r[7�� �r��N��������1��������񚰕 �4����_x��|�;�ϟ�r�J��VWW�b������������HVcLr.�eMֺ�����w=a�Y�d5ӧ�\'���,ˊ� ��t����mwww����￿���}�c	�y�Y�L��+�\0=���-Y��D.&3��M�<�\0v�v�������>���˗��)��dR��9B��fMӘ�{���,#��J	�>e�Yf��\'˖)�a�}��~�6�4�M�S�4M�E�~5�9��O>��x<>�|���Ν��rss3^�g��~�ѻ�!,�i�L�;����\0~��~��_}��7�A
�&�Izo�4̜���{�,�2�T5}foS���[,�W߽{�e�#��U�{�sz�Z��ӧ��{{{���W�\\y���|��}���~�w~�ܹs�{\"JW ���|���1Fm���|fY6��^z�o}���<���_}ggg0E���BXYYY�C��\\U���{\0�]8�{߻�i�N^o����ӻ��O�l����[kC�Ȳ�Z��ۄ�T�����=��S\0._����o���~����GG�Q�A�HUU˞�/���K�Q�\\�O�˗/��?�я~��S?IT�1f<��)�����|�tk�(%�z��LZ�y!��m���܃�㧗���{�>�J�h�_
���6��EH,Y!Ѡ\0Bh�<O|�Ho��1\0�˳ ����z��4M�qs���>�9\0��������j�E� ��@����3	���$~0J ,T \0�pR�9��\'�/���g���?��?��OBY��ܼ1̬ �c����ՎPZ�Ll}\0\0!�.��\0��ek)f[\0^4�z��]�8韬���8�[nDfm�	1�X��h��x]���[d�ٳg|��y�������ӧ�\"��)��a��b����{}�*�e ������{�o��o|�{߭뚬I�m��>�tSD!
M�&�D�ʉu�)H�PQ\0�Ζj�Q\"N+�$��	�U���*C��H=kB�����\0��Mgҭ�[�$��@Dڽ@U�өq��L�o.^�`�`��={ﹳY��9s�-��i��g��/�#`��O���kG��U\"��A��>�5;�;�=����������DL�p�
�4BT%\0�J�
�5)e���z�ͣ%��(a4Z9�L��\\�ͦ�hu���������槫2��:��^�plG?�9-қ)_�M*�x��W��7���ŋ��AY�QB�é1�{a�%�#ǔ�)!�YYd�2Z��eV�e��̮&ߎAy�WU��9��S	���E�/ҡ���O��f��tUU�+˲�rb���\0��;��1�,д��L�j�?�d������mc�\0M�e&��BP\"\0Y�gyٓt���r��o~��t��GT[	�}\"�
c�_��\\��m��u�c������k��f�I�^5@��3e�3�	�^Z����ǃ|e4\0@Z��09c3��9fTe�9S湵�Ƙ\"˳,KA:3[�i�M�����@I��ܶ�\\�*	��A|hc�h�X0i�6��P���s�fA�n=���.\\(�e�pV�\0�M\0M
����5�f0���̙�ZŜpN��L����ј��Ea����V�2�E��쭅C�1)��4�3c�Q�Y`Z&\0����{������\\D&S\07ƃ�;MP��aXq$*`�v�
��)�jue�a;�Ͽ����{ϙTn�K~!�&w#FӶؗ=�?���p��\0�)�$\"~��S��h�D�e٠pG\02k�1��+�ቍ���pX)P\'�%�L�g�02�\0b�1���1Cca^�EGO@B�2Sb\0>k2cTU��fڶ��3g���tڝ\"$ΤTm
��h�Z��ʲ��d��?�|>pb}m�v�;���Lf�R�
��)�*�&fR�� ���_������?��T��3�~�ޥ퟼��[O<��������McL��?*��C
PN�o�X�Z)G\0���\\�n<�VF�QY$�	bP	$ʤ�P�1DH��
3,�N0�q�/NJTQR2@�\0X)ϲ��J�U	x]�$���g4C�
C��1d\\�y�i۶���PcM���Gy`8ZY�<�=�o�ܹ����w8��\0|�T�M
�ԩS1�h욦	�U�7\"]J]C�6g])�ٍ�����[cV��y\"ʝ)���M���UT��@��0\"�̱-��TT��͈Y�sS1q\"/S��܆:���*��#��!�`�����̵�4*HՐ�eb�qnƹ�� !JPa��L
5��a�н<v���[�+en���G	O�T\"%u7[��M��jr�L���`��%)���H��R����D�+�����&��1��u�J��YQ����*��\'PUZh�
c�2�ɶV��@U����\"��f�M�
�(�\0����?��?˲��}�ߥ�ٲ(�{�JW:����2sQ�.]��Oj������*��j��R�msi���O�o����9QW��4Al\"eH7��yDJĆ Rq�\0`\"әI��<.�S`�
1\'��¶R�-�\0����B !!�2��j��s[�����I��I�v��p�0����(/�b\0`�Ȥn`fM�6u�����|^����w�y��g?���.�M8�=�K�L�9f~ꩧ���o7Mc͢ ݒa#�1wfP�9#�`4�V���pX�L�[C�t���i��q����ҥщHɦ�	G�=퓐x��d�>�������?��\'�o4J�,�`�r����DD��.�+8���1��d�q�X7�V�}Vj�!9�B���3k��y�G?��g?��O}
@���1�����4�`BD�y�+W�ln����d���ت�Ge�6,C�\0l��Ѱ��0��4w�G%]d��t��2���`��l�3�Bs\"R��qO�>Y<j��.?`R�
N���������b�.���\"U�����VJެ2�2aPdvm<0�@V ɽec���}饗�z��{,�UwR�.����y�^xa8E1�zN���Xk�UQEn�t�(0�UnHTb��X�*���v��&m��d���\"BL�?V�H�m�%����l�v�v�T��1�\\ %U��B����[c��
R��rTz��w�2wpΉ�c�Hc�����p6*6����A���j�*$D�F�vv��\0Ó\'�X�nI�݂Ѣ(��{���/��r��M;7ĩvCc�Hn�aY��Cl���+\0��ƨRZ4���
!MN]�J�N���Д:R5D*��T\"��x	��9oGu����R���#���P�`��k�.��3�
J+�ڵ�%�T����d8*�XӪ�
�B
ǫUa\\d\'�?��+4
�M�Xk+�e^$��s��C���%����-��q�]�reww7�2!��y\'�D�qU��?\0���BC^f;��W�c�eNF͐a��QuwV⤈;*0Z�Cݶ��\\*�[�uo�ln늏%�hRN	������UUZ����?
ٌI!��I,�07y1�����_h�fP
��WɎ��pΥ����>���]�zbUY`0(��r�*��8�4*�af\0T�����B1F�/n��&O/%��4��E�O,]\\Bj�z��/G��;��~���O6�E��\0&��{nR9U����v���J%0�B-\'~	���d���gc<�o��d�x�s��bR���IUU�������7�����>k���z�kF��-���{�k��v��R^�/�\"�2\0eQ��ʳ��1��,���!$�nH�#���t�\"ң͖SMFW�$]��\"����m��=\0�����5u����ڮO+P�w@lJ�L&I�äQ�$&-.&Q8C�a�
�i퉅\0�d�*�tB3��eY�e���\0���~������FZ�o���d2����e� \0,�!#Z�����t��]�[c(%�!���	i_��=HYErS����m�y�=�%�@�[1�wI\',?��wpI���n�� �*�$�ڝvf�#`H��l��e��&!nd��\0��SFՠi���Y���B�/^���w^wk�t��Xt��~�zߤ�,��``$\0Ȭ�3gH�`
7.KK�͘�aC]�$�H\"�\"����Q&I�B@-���������u�-$��C��-��{<v{:u.��s���z�.����zy�M�z8�6�uP?�k[@[����|��Y^XEר���wf��`4��(����P�l?U�a�=-��H�8���i,�ɭY[#���@�C̙��`\\f�0�1�z%�gRb0)!�f����N<
�IU��99�]�J�\\<&����J���V%J�(�Y�����/޲��Wb/w�Ut��JN)�H߱�DT)����X�̥��A��벰sX1�Q����7�z��7_��\'?��,� ��ad~���ª-֪�,�H4���5\0��$b
)e�O������N\\������b�Y��Zn�~\"�Q�X�`�O4���$�1�ePJ�y�oܸq�0+�֦��T�`����Vea�R�e�����hTf�����$�-��F���t�-�S]G��\'5୯\\~�2	����g����=�;:Zl�+:��k!@Ѷ-l$�J�*\0y�\"�&��XCLƌü���ٵ�W�1����m��:3�ê�R͍��rY�Y��rk,Q*���
\"�n9tg;���K%t�l���[�(6xW��A�U��q9�tBU49��i�M�_�E D$�
��
�:�;��Y�6粇�1�Z��ܖsZ2�	U�����y��)��cJs&nE��wÔ��R��F �d\\ڝ@Qch�heRY6�f>P�MN������~��gl�jv4aF�[J�\"I�\\9縓��(1�affK}Oc�:��_����|��w�eX/�d�~8�T�aʚd�՛DK](��kk+����i�ժ(��Ʃ��{k=֔��KoGG�Q�a��T�Q=Cj��j@�YbXЮ��}�Yn�����ۆ�\" �,(�豷7S�5B�-zO��C5-d�E&�Բ25,_t�W%&>���ul3��>އ�iB�g�ׅ�3ui�4����D]|j-����L��d�B/�w��ޅK,����n3�}?�~�R��Z���EU����U3��-�M�(��Ԕ�MS{�,QJ�k��4W�S�%�=]���9|\0�{����gm9瘐{�Yn�u[�F�������v\\=��\0/�6����myn˹P\"K0�F>\'!�2��+wV��C���\"<�T���Z�\0�ؙ�2�F⎴%2
j���M�v:�Q�?������I�_f�rc�;�\0���[�����i��b\0�l����/����,��rgt���k&�lz����ռm��І4	�T�\\�֩j�:D;W���R�el���W��I�\0���\'6����쉖��I|!X�-�8�623)3��k,�ϗ�L*���L��$<%��-5���핲4�D
6J���&�!u�P��<e:
�	�Q�q��G�H�T�B�G��p:8��R7��H����I�N铨���t0(��JM�\'+��\'�*�u��:�ێ����n���ӧӼnX�T)�\'3�:2,%	!�ԵU(	�B)F��u}�I�weKD.��bP\"�,���(�
�����젨�o�`���r8Xd����?���1��iL�|(�|y&����Q�6�d`�%�R~=Fn�w3CFa�S�\"b��1.�ڮ}�Jg�����
�+*Q�s\0�o����Pb�d�����]	�F�0j�Δ
�EU֦�zL���ַm#^�Ĭ
ʔe��(�V�T�
�ڮĎ�Ք�Mm��	�(&��V�6��8�AaU�c�ڧF\0B���1��dm�j��1�(ѭ�-�d���;����6������.]|��S��dԤ7G��qy�T�!�$Էat�mW��1���i�$c��H�EE#b`�<����=V�W���N��\"�i������h���\"]��M*
2�(TԄn[ �aJI����5^�BҐ�z9��Dd�M�����zCZ��ʸ�:�y�����`\"N\'Ѕ��Z҃�æi��н\0������c�����,zyϞ={᝷�)����+�Iɖ�ok\0u�Z������������.K�`	�3��iuTȝ�;�,s���*\00�:!�H1FQ��܇�Q@J�I��M�՘&�	1�I�a��KJ$ R���.��1�U�,:/�\\?�4�4�����<L����iC�����d�2Μ�J������d�c�r^z�m��|���?���@Ƣ���;�A\0(�w���o�����~n�Y4����`�h��\0���7.]8�N�����y@;�ۦ��F�p�E�\0B��h0X_�����Y�e%\0�j{�}*w��\0��j����,#� ��KE�6\0�X0G��SK���a��m3��&���t>P�vgw7H�����y�d��)_�J*U|[��������43|0�y>��*�*�
h�4U^�����ʍݽG{�Ï>B�.����JAk󖹧�M��q�N�J�b۶��ގv�l��c:{�����\\�xywO�2W�E��S\0\0O��,1����t0��g�{�k7F;������jY�+kc\0̢֙�L��(�$ ���\'\"(S��WxRC$%f�P\"��zc���	�`��d2��޾z�����d2i�O!���w4*�s�)�6�S@���V����jg����v:
�&��,�AQ�e�
B,��wB�\0����.3���G*�0N���}�ș3k\'6��K�[Su�����C?1� 1��G}tss�څw���.⢗\'�*dk}�mk\0\"�h%��Hں(HC\0�C�0�2�4�\0h���@9V1�����ps�����u�-!Xk2Vc5
�D�Y��<���9��QP�fX�*
���5HE�uۘ̔e���������\07�dw�~B��e�ٍ��џwa�ي�\"v�R�xb\0yV\"4ؿ����c;��|��G?�G������+i~�x\\Ŗ�΃�K;�-)B��ԗ�ٲ͘yR�&����n�r1yQ�Y^��\0f��J��7Ώ��޳\'�����SEa4r�\\��N����e�D\0^�Fղ��*0+Y2�0 !�}LΆ�ΤrV��Qٷ��Λx8��:u����W���y�Gw���`4��j��9�޹tqkk�����������Y����!��p.F1b�b�`�3YI1��2�_��/L����/8��y6�G>��?�I����|��rw���{�3���ݢMk�:읿��?���>��k��|��ߜ�:y��WS��T �!aDYǳI�W[����G�y��͝������*�j�6XY3Š�̽��de	�>v�{��o_��󱝿v�ʹ�PU�5�[㕄��s��~2DCP��3�,��8i��ts��Vѩ낆B\0D)+������;��l��l�8ъ��/\\?h�؝3�ipl�e�P��\\�q��w��Z[����e�ZcI��,�E�D����(#���o\\���/� ��~���e1����$��ع�O�W<���ɶ�n�y�ͧ�C\0�:�NO^�r���|b����wJfEUe@��t:�\'q����q�����tw��p6=q��p�`�ķ^{2k�^&�&
��1�Gy$6�G|���sk[g糃�W����;\0F�bT�e��
2��u;M�J��C��7�7���m�6+vvvw�F�k�㔿����k�_x�;+��/_�VV���X�
[Z����G<w��M�n\0�����[���\'��,\'���h.�iۚZ�b��s�m_�����S�e.�~�b�v�ܧ~CU��� _�
���aT;����hL�`ūW.>�8��8{�
�~����ޯ}���]��M�r@Bm��`xV7;���Y��F��Q�k.�=���|�pz��6�|��y\0Ͽ~~m4�/���c?��}�7O��|�c\'˼0ٽq�����ppzKD��a���&�GVHB�-����\\jBA������1� m��i�L� �d�QN�<I6�9�^���֥����J�ͳ��Ӄ�ך�/��*����l���ҳ���څ7^��3gOm\0X�8���QUbk�k�$�U���F4�����D�Μpn�䥋ׯ�ܫ�N@ ��6r7�P��q=���ng��.��O���#ü����<\"O�w�� �č�����`6��Lgm�r0&�������^�>8\0��#��K����~��������\0,�������ݯ�_���}�~���?��fo�ҥ���dw�\0�!�6�@�2kE$B(�F�1@6t�\')�4���	P�}���k�#j�ۺ�+���������\0����щ����`s;��������>�*���>�G����O��3O������/�zps��<x��Vu���!v��ڴ���F�bXfLq��p3�w�����ƙs�pN�=J�D�\\������&�p�.}�gUf�\\�<;{�ĩ������̦� �D)w��$�\"�<��.\\�z��U.��>�k\0��x���=X�R��E��`\0����+7���/N���?�_;����>� �GNo����k�/�o��1������\03�Ȉ(5\"	!�MF�SjxS�=cWݑx}�Tg\"�z��1mۮ��G2/\\�|����>�r�����V֑��y������g{���&����͛;��g�˫+e��|������˭�X_I#�D� F�ђ:�M\"��yax�\0���2���;���!&�o�ƿ�j���^_��,�ƃ4Y��N�]�8(+�D���o�DHL�R�cӴ��x8�^f��d��\0�\'N�L3�=wVch��xX����f��v��K/����pP�����o��7�x���\0�N��܉�����|o>��\\�P�)1�\"J�!����C�47GB�Q$�Ę�A�$j@����e3��\\���w�������Ʃ{\0�����7�7�:]X�{����O��^Z]]��{|sm���/��p���à\0�V��q�֚�uB5��D�2cs}�C�fZ:.`�{\07/_���ͭ��݇�K��Y��+��Em墇��VQ����}ϩ�\0p�+��o�\\e�e�o.3k44�5�@$]�<+���f�p�� ~��z�}	�w��o�����=�[��������o��\\�&<�ݯ���������������v��}����γ�<e���=\'7�v�1��(���>w��Q��4�Ѵʬ1\"�t�?��$6JB�o���!2��*�b4|��w�2?s����k�_��K�.������z����6���>���|@������ޛ[�^eb�Z������{oΙ5�J*�E�4R݄��m�o���~����g�;�7�jؒ�
Gr�7����=�KG��joX|��D�*c\0D�d�]��=����3\0E��eɦ�N��m�����㌈���0%�Ƥ($��\0���ŧ�ү旯\\��ß�?���u\0U3veq��������˯ݚߺ�y�d:z��Ǟ}�~��hR��4
^z����7�U6�㓹1f��I�M`<ݼ��k�qUV5߾ul-��\0˻�s������*���
k)b�Kݹ���B.����>ɝ�%��K6&���P�B��}-�壋�s\0F�	;Kl�u\\�;�8)3C���:�Y�ր+de;������b~||r����բlF.�x���JJ{N��<w��w֛M���>��\0�|	����ݓ[�nr�h�)K�(�s��RL\"b��*��Y��L^���d�:b&6�Ί���\0�O<��x�(
���QT՝Jp��qH����BY�qc\0\\,g�{kmY�UUT�͓��֯&C��� �\"C��w�up>!��Q������.�J��&�*J��Σ�)�1T�����ȹ��e
*�aSϔ[e�D6�Yd
1�m�h����\0x<���`��e�^��\0��ȸ�ה\\��94���@����������[g�,3�eY2��d}g�34�nx��K��vt���C6�܄H�|����(ƸX�]2!�~�����NG�&�Qɇ{Ƙ,`�����Q\"!J\0ذ16�P�t\'J5�r�g5;M��s���sv4A
�jq*)וkۻ1c���h-�D�h�\"o�P�P��De���	ʤb���BR�I�^��!s]L6�>��B�e]�6Εe�3�bҘR�Q��1�(,����s����ʐp3�DI��X�s傒��E5�CQ�+v˿�wv=JPp�h\03��ln>�l�rP�M��y\'��[�[3Ԛ-e�A�ATF��f��Bc�\"��*�u5��X��1F�XD(��P�x�Y\00V�a���T���ã}���R�ٚ#s�v�ML����v@y[�& �s�9g�#Ai�8�>ZkW5u	�F٭&� ��|�>$��ZWp����L�Yu��X�,\0�\\_C-b@	`�V&5��$K�L��?=<�s	��\'�l�q1J�?�eu��C\0�:�i\\)J!�to�;�V�* �ʬ�`��9:e�+��b�\\�?�d�X[�R�l(�Gu�4�BH*)�]7��r��}��Z$C�0�r��K�>��3�Zk��M�!�dw縒��V�L3���3�*-��^���J(G�pƕ�h4��b��e2����`�\\�FE�|T���zJQ�E��\0\0 \0IDATDC�,��N\0��y4QJ:�|�8�%H���̄���V�Q~�C�(	��_��<�W�nT��ȹ��-_�(Wc��o�g�E�[M�1�����e�,H>���qP�36F�}�4㺮�����q�m�6�g{D��E]U��w�5O��-��v�f��9e9zh�����w!&2e�b�lH�?���Q�v1�2o�ۮ�\'S���d,)���,���B��V�`�B 2�J[0��=�Ȭ4�:��bH\0%R����O���P��<0��g���?�Ϫ�H|�q��\0|����K��������y�c���.ףI(yF�H�R��uf�$\"���1���a���)e���$u�y�mc�sƘ�w�R����
\'?�(�|Ԓ5dvz\0�~�lwry������{�u�{��;k\0Ƹ$�l�V���{��CDZo�ݫ�$�C���|<���{��bD}��9��\0p�v��x�#��\'�l�N�����(`�a�d��b�{��&��<��#7��� �O�7�,���K>���-3�`���sM�E��T��Z�k0w�t�/?�vr�\"gF�9��9W�u3��f�^w���\0���^B� ���
	$�|k�ho���ؾ������.c[%�N���q~N�E
m��޻7��W����\'���摍�A������|.<K�g�F��Gs,AD���9���>�������V^<��������7I$-E�V}�\0T�e01�����-�ϣ[�KRV�a�b$�6�M�]Lx�n�E���-��23��Z{6�J;?�|��u����F�Y0�w\0�V�\"��B4ܟ*\" �z����\0���mע
3�x�|�	�@��|_��v�+cT_����Qv��~��\\�r���ܽy�t��1YC���I�� 3z�u��^�
r{��2v�n���1\0��}W7o�&龬Ig�t��dՉhG�4����g��N�1���*8��X�v=�K��!ɬMDp��YCa�H�4��t��,�!��HY7�Z�PU��Kk�8����(������~�J�Z��cE�m{\0̶�{V���w�z��@��l?����]O�uM\0��f�^zٳTu��d��<�P�f�@�3B*)�m�B�������Ӻ��j}�\0��le2�n��@��\\��uǾ70���ϯ����<���03�jv�j59�U�ʭ�\0.컪t�����d2��u��\'(�ep�V@ӹ��w��{�ѭ�pey�TUw�{6/����,�R����\\\0��
�=�6cL�u!D��ƶ��	g�غ3~�*��%�<3��w�ܵk׾=�գɭ;\'\0�_�5J�%��\"o
 !g�]�y6�zuG�.\'�]1���8V.�
�ֲ�	)�>����)��`�^�1�
g�;b�bZ��{�U��\\��V�un��Jry�T� Q4쀭%��`C
(!�4c�ԟ�~U3�p�?��9��!�I�4���!�{��|����3�\'���vˡ\\��}�[�����џ��7���GD��Y��zQ�!�sV��{�ltΈ~0v����}U�B���RZw�$�Zk���.��۶]�ם��\\�eYVy34*cɚ¸���fb�)��]�=A���e��U�lPĔ�h��v3c46��
@��n2��;�&Ji\0�Hd��^UHT(
NN�F�bo ݧ��.%�tp�:̀1E$��g�mVJIB��S����j������ߋ��e��)�u�*-���������ۺgz�Ru��#�\0��o~s�ޔ\\:h���TŎ#����Q^�\\B�E�=.�+�˲��:$Y����_��E��(IMQ�f����{�����e!��B�Bd0={��ͪ(]a4��j̡ɪfe隦���9gh�����IV�v�D�t�H��\"�M
4S\0e�MiR�拍�CH((�rl�=G���o���#��Ʈ�n\\��lR(�Lۭ�e�-9��ܶg��.Fy�s����z��٦��vݶ]�\\��V�Ƈ����]Ռ��@M����u���`*8��f��ں`���j������a���(������8O���į�t�ϧ���4g�y��#M@����`���G��e��2f+4|�~_ߍ�7�B������\0�Ѥ�|�FDAֺR��e@�0���!?
�����2k�4p�T5S5r�VU���յ]�����:��b��z��Ԍ�GGG��}\0�mS� |�ϗQŒs��W)����RQ�j<ɳ\'R��b�0�
d�JN�$�g��>������Iӽ��l\'�������i�X�!�&��D��N�����cT�6�K�n\0M����_�}x<k�(�X�3�u@�$�x����sT\'ݓG���eic�!�BB��c��}\0��;]��`4m`���\'�wL*:��ʲ�����Ywm᪲�\04U�4
 @�F\"څ)���%3\"3x@&��۷\0UP
BJ\0BD��g_�|����Q�m+$�7Ʋ��n��h���J9\'�ã�m׷]�\\�;r48f\"�Ѽs:K�g���\'\"9�xΟ�����wC���������Ν;\0�p�i�7�z��h��n�Z\0�_DI�w>�α5yM��0�pQXﻶ�@� �_,m*��,�J4��e����1�\"U�x�s��9�Dqtt��\'�<�pUu�c9�Ǽ��7���4J U[\0�?�p�ԭ�o�^�I��Qmy��\'UMt֓��]N���DFTy(aEU)
\0B%�R8Y�����M���U
��\0Ũ��>���7.J
U-��#x�e̼�t]�d\0��hˢ\'C���2�D���p�l��yۮ}�w�N���c�W��G�g��yW�\"\0�׭
R
!��*KU^�|y�و���g�����*��C�>�&�y�&߾�7;�L&eYf8_Y�1&��a���:����\0�T��k$MH\0D�@�T6t��X��n���ƾx�D\'U}pAٴm׌G�j_bTk�9L���{��n�~�T
D��Kg�oPpm��-��aMiP�4l3h���\0V��~�f��ÐU���M�;�\0�>���r�7�2jꃃ�ׯh���I]Uf-�H`y��:�*�+�F������@Y�[�2v�E�7������9L	�>&�Lj�\0�f3�D���A(�^S$r\0��hR0e񉈁�ђ�Ę1%��f�n�(�k5��s�<ch�6�W5�����+C�/]�t�ƍW��vJ�u��
�.+�YG�}\"&k���	H�;44���$�B�cZ����/��
�$����>�^�r��l�7`� �BY�T�RRyT�}�l k��Z[U	�k�(�ظ��|�Z=���E��g*���ݻ\'�z�1m�U�T�������erL\0�(gFQV��)�$$�
(����z@���\\���)�����c��~`��S�N���>����v���T뢚6i�v;�Tl�7ʠݭ�!d;d�+sY�a��V�vyz7w0U�f���������0
\"\0�c��<I\"�!�2��(�����f(����|۶�U7;:4���p�ҥ<3��構���Ua0��0�Q���)�+K\0>��Ղ�/���m7�֕\0��>����8� �?�\\��-��G��d$Id�t����ߺy3&�l��&�mJ�R�CG*�cܖ���;s
��h�J�
�ʂ�e,C�i�Y�˔bݔyJ��\"B����z=���pYO�jz�di�����|��?�O)WK�9o3r�F�}��oL������*�j`
�6l�\0�c�Ɣ�� c����nбaǢRd沦Ew����4�w�]�Q����*�DPr�T�Χ�+�� ��DƸ��氎>�����li�)i2�p�p��Xb� QaC!��{�}U�6\0|S�IA!Nu<����q\\|�q������sC/CL=���k{���݆��p��×��v��A����I���������+���t*+��$�))�`�1�$ �{��eJ�]೺I�R�C�\'FY��.�-�|!� ��F�J���6Hb���xSb���D��8�=fbKd8��@�l�d�@{�Ĕ��5d�ٝ�UJI����S�S�)ĤJƾ|�Ԏ\'�L����_����#|�1֜�S�8�Y�J���98�o��G�{9�E �D@5*��v�6{�_�����o�9��^x��q��ޔ\\���T�L�8���\"�VI^R��1�@\"Q2`C���N<��:W:WT�00L�LԈ�3z�\0��qV�D���dQ4S�<Q��R�H
֐*e� A��!`���\0��d�Ja�@$H�&:����_��+������~��b���k?{���`k9%��\0��O��L���}aSpm�_x��_��o~��\0��|��.M�{L�8�XѤ��L�BNQ\\]�Eh�������B�{�q�:C�pf0���h��T���<����F�
�)�y�nW֣?��g��	6�y�ٛ��\0x�����#����~�����q�Z)S�]��7�D�X.\0�M���͏{�Wn��������<ӆ ���/��=z�pf�t�E\0��C���	��D
�!�(����e��}�z0����.�d,l�-�f�?�*�n\\JDLٺ/A���#g4�u��)��C�]��)�����*��[0�,�xI]�c�w�y���n=��h��������?�s����/�م�KeiR����wΝ������=�T��@�+�����O?���W���~~<��zu*/�<�0�^=:�l$D5��|nf�&RRx�%���J�d(�d*!0 6N$Ʈ��(ˡ� c�)�JI����VnTE��o��6�&BRL)��>E/��Ӥ*Dj9K�B%��\0b��F��$F���ս��O�R��Ɛ�U6I[��^� �.�m�ތ�{\0V������������O|�\'��9!=���Ĵ{{��I��<�����x�O}�3���h<:]-R���ޥ��I6}\"�
���@H
KlM�P�CI�!Xc�
a�O��R3��]�N�.�,��3b@��*U��Ui�	\"�덛^z(��?����+ק���t���`5_��{�K�.�����/�����&��oFEɹ�1S۶DTU��y��
wP|�o�o��SaǊ�W��Q�4/����|���׻.�������vi�E��ׯ�F��P��ޫ+����z�O��=����-�A�5v+hlY]�e���*6%�)��$	��6����2�PZ�?����m_a�eX��rጵ63�ؐEb�$<��-<!Ĵhۘ�Lfnz��x:+T���w
Ь�6�۟N��(��5�����ӟ���۷|��������j6�}�A���b:��{֟�y;�ь^� ������ʯ\0������m\'�\0��]���\"������qY�D�ϲ�I\0�]�D)�H�!-����9��q#��I]6�Xf!
)��!ؠ��_Y.j��(mU�DD�Y(@QN��X4m�6��q�7�ǣ*�5Kd�)�)���տ��o�(8�W��LhI��q�����r�\\���>�j2��A�8L��벺x��K�-��B��ӷ=s����K/}�_Ƚ����>��-�Ѹ.
�c{�ڔ��������yS�[�V}Pb4�t��u��4Mc������?��\08>9y��\'T�t�PUKh3a�a�Х+�}���|�O		)�l�|���|����o{\0�9�ic��3���e��LR�Y�\00;�r���
b����M��E=ndo\\y�I�Z[���g���2Yk��\0�=y�eV\"S���j�������e�v��+/�\0�.�(L�I�� ��3Ph��kW�^�|�d�mƠ&B�L���EQ����Ʌ��o~���g~�g~�?1����`V97�ʾ�1o%D���1n�<�w�3�<�|��o��d40�޺uk<�2s�^��!S��x���G�{�jr��$ͳz������]�Q���^P8Zw���ii����ʅò�r���\\��ޣ9�+�+�%Vf�y�y4�1�U�
\\�~=�h&���!E�:
�v���oM�%����لIuЬS	�P�͝��ū���M{3DTe1n��aO��6�!XfClYb-\0d�J���\"��r�b`�`��ثjQؔ��.\'Ž�=�N$Yks�������ۿ������ɟ�ɟ���8<<�]N�oi=�7^[��y���<f�-�J<_�M�\'�\'���g?������8��c���2�XV��e�#��R�f$k��Q��:�Y����?�8�!����\'���g��t6g�xf���v���v�]o�\0n�zq>j�_�.E���^~��GGi�\0P��p�2�dr�
gkr`	�0B���9\\آ�9[�:3��<z�zU%K֩n�?ӪaC�j�|�޼t{�\'���d3w�x�w��s��mœ��c]�mW�J�T��=�iS���p��狰T�z�XS�`�,&��
�#[H����P3�!U�!����������a��x|��E\0���?���}���x�bN��^57�s���d��v�7��:/���3��*7��R��>������/|��g�prrrxx�ct��x�3I-�C�a�j���B�EU\0x��ǲ��ŋ/\\��g�?3�t!�pkΘ�\\v�*0_,���d2aE�-M�Y鋩4�)��@c�Y�̀Q�P
`Cd�;o�f���Y�[�{c\"R��M\0�e��鄔K[�����[�Փ�3]ߪ�F�\0Kp��L���>%�j�^��PU5\'�?�{�t����ir_��K�}�睤w����S�6��b��6��^�ܼy�[��֕+W>���#y�ǜ(�ybh���������n������1���n��k 2U\\�>��g?�Y\0�����+�\\�ti<߼ys4Yk۶�\\.sk��m۲1�A�7\"2��\0��F��G��/����x��3��Q��m*\0��j�Y�����Z[�d�r�\0�S_�hj��Hd\0���+�ALD�s��>�fv[P�4Ӡ���(H
\0y55���e[T�0Z/��z�W\0^|��WNϯ�sI��c�t@aLŠ��ʴ������b,9�4���KD�%o.UY+��\"��Wq�DQbK��ڥ^���Ӄ�m�a��\0�<~i��m��/�4�۞�iw�@�Xj�j�ŦDqQ-����,֖Y��-nD���Éu��Rd�J��Dd��[q#���|��*�\0�9�f�hck��1��z��d��mtV\0(�ДVj�,�n�+Q��V�1��W^y��W_}��go���G}��G=y�d�677���c��Ng�*��v��u�G���$����<�����?��\0�z�n�a}}}8.,,H/D��GF����0U��s-8���#G\0hc��#����[����F��ȴMC����\0�Y�8�z0e\\U��dZ����d�,��\0D�D��!M,j6SI�M]��\"p�ψ�t�u��2~v[@ZA9��\"@2
���f88s�L���7_YY�Z���Yj�A����q�\0L�ZY=��tcckcc�(�|�u�25�����֍#��XU�x眵��nx���_x�o|�?�0�G}���Z]]+���Ri�j+���Fe��e����<��/���/;�αc����V�e���\\�\\�*yJ��n��9?*x�N��z���rq�Q�CG�t���_���\0�tz��* 2�(x��f�c_�\"�M��*z\0�B�U�T�i�|��R�����ZG�N�$�sf�Q��km�2)t���Q�\0Hۊ�����2&k�@BW��olmoo��VWW�,�������i�`���8~��=�Z��9��{+S�H��3����h�<��f�A�9Xk��C!�5�T������w���?~��?��=��C�j6�Ƨ�����~������?���������?>p`���U^�$I����K�BPJ����M�{�eZu\0KKKR�_\\\\4I2��,�$Yv�S���B\'�\0:���r�8��\0�`��&E��<�&���PV��)����i�e��Q0�	��6J�\0�F��{/B��,iɻM���l)
�ǭ���#G۽E66���q�w�&u�]v�Y��6�?r✓Ҋҋ��p2)�b^2��LD�(ʢ��4g����O~��[n��O|�O<�D�ו
FY:km��W��_/?*(���z�_����?����曷�eY6β!j�Z��i�J�\'a{�3�^�Z��4���d�͇#ez���;n/��8\0p���\'�%���,�e�G��(�4��\0Lf]��{El���%6��!��ڐ%lm��I+\0���X�e�N)�eY;�TxЙ#{f��s�ą��d�|R�
gH��A_J?���O���[oi\'��q1Km���R�s�CUy������\"ƣܹ\0�$I��Di)2]�
�L�a�ǆ2W2]c��e�.��J�>��Y����nnnnnn����<�̷������\0~�ᥥ%f�:vh�Xcl�D.zg5A|�h�X[[{��g���ox�����h+�9s���j��
�%�~^U�b`fV�g�$��0.��n����vۭ��_8w���h4����(��V\'���[OdZg�24G���8_DBY�����N���^������A��޳O���x���Ab��v�|}`����k&I\"a�T	�[`���E�e��<������w���v�������O��SE����\\�Zkm�QiZ����?�uL&���Z+vVEUUkkk/���\'�|�����n�֒�*�$>��,ݜ�qS���L���Kـ,\'p�A��@�t:��g\0��ˀA>>�n�a���n�j�	���}tu�؅�mTe�����G��Ɏ�UU(P>)	qR\0^g>R��1�*�qᵂ%ƥ�>��$UY�\0�7�(�^�c4��h����w�~du\0�*QрT
Q)H0
\00v>�����l �$5�̚�,}�Bp���WN��h4�e�x���o���MǎZZh��Z�\\+�ِ��e�c����v�����N��]	�h��M���o+��t!��E�o�����RJi���Q�]~��д�hmB��I!�^����h4G����^|��K��_��}���n��0�O�ҕ��c�i*c)�%Ir�̙�}�{?��򓟈�6�d�\\�n�<[�p���ƌ޵��G��:�ϧy�����R�I����;����K?z�l�c�t:�y+t� J����H�Zl���ln
\0\0 \0IDAT^w��`-���\'#�5i+��v�IMP�W X��αT�ַ�g6����գ��ZXX`Ȝ?{���ӫ+�]��Ģr�
����h����܏�w4\'uA7�K�m��3��nI�(��YJ��[[[kr�&��>t��׾��g���SO=��O}��>���`���h��;M-��x�����x�W~�_�!��i��2��kkӬ*7I[�6>��u��Gq̲�d�I�@���i=a��� �l����5���-��,�����󣼝f\0Z�~���x�;�z��;Gz�n�%S�Ā�(���3S�)��5&MS\"�Bw�JC�2�d>3v��fpli���ZB�5�{�4d�I�%�(c\"�Dq�(��aC��TFz2�z=��L�e1.����m{���~�w�(�N5�\0�WN���6�Z���9J��$Y�W�
��Fedy�F�Ǩ�V��U�Np�&i�dD>/�L���5�1�H��s(
�1:�chX1�\"�����V�������}��O>����0s�����V��_��׾��O.,,E�k�F�
!̶(����53wM����]~NhT@��E_V���
nf��Y\"��:�/|����_��^a�ʖ��D�	4{9��\0if�9I�j#�Af��q�H�RF��!MJ�:z��Ws�Ж%ֈQ3�4k�P�*\"����|ޡ1��Y�q�܉;�i/(�����z\0������d�H�����Ȉԥ)���ɑ��ќ�|F�d�tbc���f��<O��u��\0�����}��o4?��O�{����o��F�*�$I�:��Q��,˚��lt��u��/,���,I��X��\'X��.\\�����Zk�&�M�1�Zg.�����.t���g[�������đúӒ�6�Z+�b����8l�\\Z�y5b�9�������b��GX��@P�Vh\"���=Si(EP
J���O\'R��sk�҅�rE�.ll\08���P������ᣓ·����*��^륟��$֘����,te�H]-Ab�
V/����/����ۿ�?�cc�����!�%��Q�\"�IA��y�Q��6Jk�S�ױ�K��l�Y)hEF���%za/S�j&��m4���<
:�ߏ��Lj%��G���:��G/�kM�G�k�٩)�(�)���MӴ�*��Zۻ��J����a�g�Z;W���Re[��F���(/+��^�;��}�#�<��\0D(qEaI�G�X��ԙ�\"ju��&��!TU%d>zZʨws%}��5��)�
@k�7t^ۄ����h$�NM�˘)!������� Kf�,�u2!�]�z��N����/��`��0���s������Ij�,1��)o�R>�IQP�����[n��c��څ��lʊ�2��X���� �|$�)�LE �T�A͵vwB��h�
O�HL���D��,��h��V^Lή_X9�z�ɓ\0L��X�$1����s���_�j���.�P�	�wٝ�u1Z���4���9\'x��j�������pm�\\�����^O|j���*�[�z���|���ǭ5ֺ\\�MtA*�Z\'!��Q;����x�����N������憱*�2����1
��<\0P�>)�ӛ�\"d��\"ٹ5)�U�_7�l��M��R�� ����CtQPy^)�/nl�}nmi���_�W�+\0e�^\\���N��tk{(3�o��+�Xh�w�\'�^
M{�r��Z	_j�M#����^��x��+js��k�Gw<\\B<�;wN2����E�|i�b�����G�8r,w��G��WEQ��P�,���i�������m)A�	uN]��5���������0H	�X 
��*x����k��{K�����>���fKK�5+fŤ���F\"��锾�5q�G
��޼��Y�!�M� ������\'O�pǝ��rQ9�@��I�$m�lD8w~��g\0�&
e���5�U����F
��_�4������զ��@�7�]_��f�;(6j������
>��Q���z�˘L���B�ә���\'O=p��a�e���N��1IΕ����bT̑b`�P��#ܵW�kbT��b���W��*]5.&�b2�\'��xe��������u+5��$�dqnnn^�pA�튤��z�+�aq�2s�gf���蒯��^���e�s��?�׋o�v��?���si��ZK�\'�B�IL��
;���L��;�]
Z�R,(�/�ɤ����2�E^��9���-�7pE&�k�Gw��4��bf������)�b���}|��7\'E��k��֤�]C�۬lWLJB��m%�N�d�,�t&�w`�s_��f����=�΄R����bDˌ;����횾�]�97��ں�C���ԯ&\0��1@+��5J+�	5Ę�eY�F�鐚��M��Z��9�ǻqa
rO����=�.�&�u��o���jT�Y��;_���u۞��$�*
����q�ooB�!�F|���a>���_���~8�;~4-,,T���7?~��:��pR���˹�O����l��i��*#* ��!UYT%dl������
<��H����c����=ví�UUu��;/���!\0kiqeaeuey��B�cR�2@H�V\\U�
r��ܜ�����쓮��_�^/oE���d^��+�0g
7ĉ�a�R0�v=���~v9�u5�Q!0!H�\"���J�SZ��/�=�S͋766Ν;��;����V�H���\\O�p$kҤ��-�2hp���4�6I���e\0+�ˏ}�í���{*��^o���K6!�	{��$�{_U\0�%�CY���$Y���\0�r�>����Ǥ酵��.n�����\0F[��V��+���p��c�$�b�@>9���T�g������

{P��&���ZTv����zr�mmmeY&tMl�dN�ЏH��̙s\0F�q�,N׆,�Km�A\'I��$�h�\0�b�G�l����&QJm�\0,��QU�<��?���Ç��������Hl��w�|�c=���t&y�[Y���J�������\0|������(m���0��,��c�����~������e1�GE��3���h��sM����`7�ԓT���+���>?*��9��T�Ѣ(�<�;Q�i��BJڌt]?J�������k�ݕܙ$��D� 4f�$
ښ�H3�Q�;�|��V;������Re��e���¸�
t�C�~��_����u�va{s�(K0[�Y�Ȗ2��7����������?��w>��3k�7R��5\"��|\\��B��`<�:v���soqp+���0?{������b�onn�F#����*0G�u�y�Y���%��Yk��n�ʟp��<�u���
�4)f=�&���daa���u��������l�O��:�Π_\0xꩧ��G��a�O�+W��UU�I�sa�5dz�*FR4`fmӅ�E��eYVεm
`}m������������`��@��UL\\���B,sD��Q^�Wt���_���>������xP\0 �F����W��:��TSb@{5qEu����z�q��C�@�{�ꫯ6�^r?��DC��o��xW�=�
X�AS(ln�5�l	RkI��(ď�Z-y���y��xp\"u���{�%����mz$���ި��.��Y��9iA�;wa8jM��&�`�c ����j��CGbm��̤�������Ņ޽��υ�ni��P+���[�����Ϭ�}g���X�/FBҖ���\0\0QIDAT{۩����GVo��]X:wqs��g*��fXh\"RLQ1EV\0�M4cmSDG.꩎\03E������]�M2��P^������5β׀l���V�t�fmtW⿽�^�(A�0�k����[�o�儵v����6���1!�ĊT�#���:�
!}Xj�~�܏��*�馛ǣ�@�����T��[��੥���_D΍p��?z�Ï��Y���\"\'��$�O����d�f8Qd�,�b+I;Y;w�9GI&�\0�������ͦۿ���gC�Y\"���6zuc.��R�+��4m�֢D*0���n�L�2��</$\0JӔ���v�W^�������főV��\0\"\0C��r��p��
~tZ�R��t:�Ν[__��c�$��@9+R�~��Z$C���
=���M\07;n�}�я����O_����\'����_����������/�t\\U��}\'oy��\06�j���Ҕf���݄9�D�kT��od��$1�M�ML�)���͋/J]y�ד���?:W����b��E^|uf��n���t/p�L�4�	Oڦ���;�K�əhV���^����x�� ��ݔ�� Q)�֤5�Zr�)��9K�,I<���S��|�3�d����;n���}���G��s/���ٍu������������G��I�d*i�$��#x�Q�3����J0��fҬ4�V6a�2dk���E��=��G#!��pv[�5��i�x���L���!�!
JY�@�����\"�}�E�D1���*ɟKh�fҌ.��ht���@��ҹťU\0g�y;k����N�:uۭ\'�Ñ8r��6�#\"F�cˬ1���C!r�m���7�<n�������8����q��_�����r��u��;��
\0V��p�j�c4��H
r�j]��5(6��}�1$Y:�|�V�i��)i\0[�.����SUU>)%���C-����:�������l���f�u
m#��5X�FZD&�Z��h4���2&a�O��P�Y�([_TJOcE5�`�ʽ~/�EĐ��%4�IJfŕ/�D�]�b�L^�]����a�_XX�eU�7�|��CD������P$��\0�(+�H��읈��d��БգǏl���ʫ\0�2ݥ�o���[��E\'k#�$1�\0�D���Tԉ�Ё뀨�S���D�bZ[c�$/���J]���룍s�N�\\���~��N��������.1o�Y��Y�����(6�]xeg���>7��T$\"��M�4��p����L*�D3���[?_��%�%�2Y�<~�����˯���/8|��7�y�=��b^�&M�,��*x?-�+E⼅���e���p�u�֊\"L�el�����5(3ͥMn0˓��@��<��v����pS�ք�@�����O!��$��U�h�Rj\\LΝ;wqs�ؑÒc��j����gޖ��h���zѕy�i�z�^�ua}
INSERT INTO employee VALUES("KICTC-STA-0004-2020","RICKY","T","SAMBO","mboya4@gmail.com","�PNG

\0\0\0
��%�V��Y�n���[i�Yk��6z�	p,�v��>�y���c�8�̳�:m���X��ʫ��l5��;���]����\'J��SN=v��g\\J���o���m����>i��׿����2��\'k|���ApR�32s �P�Q9�-��R����eQrvP��`>!�~r�����7���+o�;sN��Od�)u�$s���dm�m�O�eHm���D�]+#���S�Mv��Ŧn�E���O���]��\"���O��u�bυ���K=�*������W��y?�%F�����^9��1�Omzuڨ9[����l]0W�^[��G���:\'�6Έ�_�S�v���ެ����?_���$��Dy�L�B׌h��V�l�8��w����̔����Ug�uܱ7�1�u�I6������v�8�p��N���A�a���
�n���h�o-=R��O�uQl���2d�fL�d�U�sx\\uw3g��&�>���	W��ߕf))�Zw��S.������S 8[�wT?����`N�3�0��t�)Y㶙
��.��v��#��N���T!���o�ЦSy��y�K�ph��o�j�*m�`%f�~�W����Q�g��4�0�j��i�(��k���X���cq\0/L�W��y���Fz�Hf�$
N�����L8# ���L�g��0P\0:���=��e��N��MF�\")I��q[(�HD����5z[>�t�S�<栞itD]}�B��z{��t�C�Rd� )�P���1��N0

�Ś�1�����}#�����@��E-
I4����~�ŰPG�qω�Ei��Em�>�	\'�Xh܈�K�B���
�Y��Ū2H
���\"@��&�X�j��D���Q)0%@\0�@�PǑ5p�qt5�7a?]Jc�R������Z��0	���p?����T@&��9\"Y�p�o����s�p�Ez��۪���a���\'�o���kP9�e�砂�A�T�D��M{#�P��x���$��ky\0k�Á�P�|$��X�EwY�
�P��=�i)`��ʛ�4!I\0�Ç��;�p�A$��Z.R�WZF�����Q41-���jm�`� ��a�������!M�L倃��f�(�΍(88��K}q�7wb�p/M�q�Ե~7��A���C��Q��ux��\0nc����E�$\")�0��\"���{���F�)�K�����q��e�Q@N��5x�$#Ow6 �K>WJ�hJ��]�n[Eܡ�5�F:���>����-�0�T��c��Ihx��������[̩J���)���͞b�����1���Sqj�o�+ɶ�4�豒���M�߻�bp8��d���H�m��աTf��{�]��͠xrs��j��Q�ϗ>P@3J��U��Qr���at� 2߮CuC�5�@�3�E�QX����JY7�f\0E��zL8�N)�<��9��Oɮ`y��>j���X��P�t29�:�B��R,��@�P�$܊H2�ZW�6����cx��XZ*Z3,�	������f�qXM�/�}���MЭ�?D[�#�\"Ĝ�|�G~\\�ü�=�j��G�f���ؒ�����\0��}��c��SH�ћs!�R	|�a�:SŸh����1r��%9�ؚ�K�`Bf�6�8G�M@Ẑ����	�:U�2�1h݄A�{��\"��
�%+��e;�a,���[��(݀��E�Z
�{���G�J�c��G�\0n8�L�W��09��8XRn�Z�e��zhD�7�X�T�MR�K�Z�EE���#�2�F�t��g Jݼ��
�a�L�*� \"CEd�p�Xf�~�1c@�~�1{�#L�y��ЉG\"�q��h�����i�gT�i�H��!01�k�}��h)J��>^F�:Qø\\9?(���͠��aZ����o++i�����}ʅ�e��Ť��is�Ԗ8U1��2���ǅ�� �!��4=����M+V@���֍�`	+Qn�T�=�p�A�m��͂,�K�s���У$����4��.YES��J�h ��w���J��~��4hY����{��=�#ă�w�OE�ed��f���@\0?
�
���~��8�	��(��i�Z\'��t���\"4a��-v
���LZ�*5p�e3���\0�n��U��Xr8��g�k�r@�ڱ��Gި9 �m09�޼L8�
�F�UE�e�]
���\0ѐc��:`X0%���l=9Y^$ܯQ�G��-�pk�G�˚=�e��V�)k���t+�al����8���vd*m�%Z�9vpe�&R�K��m�� &���ߩO�7f�D�o��A�z���
�ѝ�،й,��iw�ˉ��y!���v���f���@�oN_
)R�:h]B@t�0m�ԁ���2�
���
#/b���ʄ�\"�+*7��_0���W}	�H�[�չ�N-c����`C�}���8�\0j���R�.v\"�T��FJ�ӊv�C��?�\"��Tz��rQ\\�S#�	Ȉ��[n]Mo�<�o
r���~��(��i��iWĿ���)\0�9@�:~Uk��
;�Y�7�X���u*���A[���Aj�ĀE���נ-<��Z�
z��ҩ��Ż#�z�
��`��UD�ql^F�NhF\'�����6!�������3�6u������|4�m��-�ڲ�:]>���2d�9���Z�hh~�i�@ah-EB	��� ��ǜ�9<���je�\\D�V�`=�e<���\0�Jyc�p�_�ܦ��j\\�#�������S/?�W���h��e���u���`{���\0�	��O ڏ45��^A���q����0ρ3�[Y .��3��k��j����A��tx��Ӟ-86A�����f�!���D�V�Ƃ|��ɔF.[��݌�[x
�
һ���)F��emlՅǢ��MT.q�W�T�:0��c�0�)Q��9F,����&���b�~�DjQ�]鳸EǁQ��1���t���4?� �+\'FrN��!iP�#8�]�,��9�F�fs<\0\0!�}����\\`��th�%RO��J�riJ�_`��S�N�7)|(�l\\S�MSާv�(.EP��^T��(ºZ�C�2�b�.�B��{�P�+2�ij�Z^z����A
�����>�-H�Z�W0I�x�S$������?\"a�v�����D)Z��:���89�À�(\'�B�A(c��.ŠۺῬjD�)~ji����u iE-�xh2p\\�UX��<�D���	�D�ltX�Z�z&k���8D�% ��Om�z��T̳h��35Z9l��4$$n��G�9��2��/�[�B�\\�
�
q��Q���wm�0[!���; ��tU;E��p�Q�ڋo*ƭ�G���x�4�΃�+.�(y{���;\0g|ǟ�hc �Gh���;��+ތ]�w)W����7x�i6�?U�o?}�-O�(Zf#�锠�\\�KV{����t�х�6�����*�`\"�uQ��!jt\'8�chH�D���.$��v!�;Xm�кl0�Y�[�}fF�S��&jH8��×��\\�\\-o8�,\'��Ƌ�(��>(�$%L��|��c��
���z�Y�j3�Q?`FB��ڽ%xф]��ѡmH)H��0?�f��
!�N��fM�Q�Z ��{G��_&�a���604t�%�n��2�XTs�Uخ���ׂ\0mA���{^������~� �:sڵ3�P,�9:�L@�
k�!\0�h}U�r\0
�Q��<���*JZ�F��]3E���}vhE��OR�`����;�(?i /�Ú�EC�!
u��A���r��J��]|� �D�j�Ӊ��3
d��
<(O�1��e��,yzj�E�a�D��0��َG�U�����9����eQ��u�&C�G����(�P���.��d�$P-o���(OWy�<0�8[��`:%�0��VuJ��m���)������!���lz
�Vh���Ф!Iqq\\�,V\\�uup�\'G\'E)��\"���q�=�����
Sͮq@�,#�L�ܪ|E�0�>����(��Y_��Iu�Y�}V��7��g�nX��ӛ��y�8�J�B|N<f���.��ƹ谟gF�Lz�8J,;X�`V2T�)☢j��Ϻ�p��Vj�uO��p^[Y�:�!$��%� ��2*��]#�D���A�/�K&W��B�������l��䄛N\0�/��1w�fݶ��m�y��+���6��O��m-vD����&��;���.�#h�����)���5wn�s�>\0�U�88F������ι��Ӛ�C�r�?\"?\0\0�iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:d5911094-666d-46d9-9fe9-28ab2895a298\"
   xmpMM:InstanceID=\"xmp.iid:7fb6d9e5-b0aa-4d69-b7b9-c18fa0391d86\"
   xmpMM:OriginalDocumentID=\"xmp.did:608ea00d-ca57-4f4d-9992-16657defaeba\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1602726849641753\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:15ed563e-1c0c-490f-b8b1-bbc8716b8614\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?>�b�4\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�
6�׈�\0\0 \0IDATx��Y�d�u&����r�c�*�@�H�%S$Ŗ�&�P�&�[������;�?u��O���m;r�VP��L��\"A� A�\0��T
5�9�s�����̛5\0�QU�;nde�͛yN�w���o���p��R�����u�_�]����:���:^�=^�=^�����xc�xc�x��g�� /U���:�{lG���:���:���Gp��1z���1F��1F���:����P��������Go6��\0\0���*�1
���O|雾=^�;z�-�㝩c;zS�P��Ӽ���ulG����؎�\0]X��ulG��豙8����؎��z��ȷ�}��\"\0�� J�!�b0\0��Z�:1�����\"QAD�1� B�{E!\"D̷�Î1.�\"��\0Q}::��;��1:�}��q�*3�\0�\0DTb�uq2�^��A׍��^�GĎ�3������
��\0
kP���Mk��,��@P@PI�J�!t�9D�T�pVRPM�ID4����2\"�r���w��/��+�����}l��RJ�Xh��!E	�<g�}��lG���7M�9c�پt�{�}���O=��c�W.��{��.���������z zxxH��_�)��pM��%���Cd�[�����S�M-;R��X[[��A�+������tDh�hQ���r��R��:���|�~��íS��m+�\\�V�v<9��w@ߍv��(B�_��z��/?������dthI�cSX.�����df���� �J�D�*�\0J� @�A	�P
��:0��v5�͵�o�G���+W.��~���D���!�n����ﶯ�]��j�{������������t2Y����~
,�SJ)DN�w)Ɛ\"���KÚ\";�ٰ�H\0��\"��X�c@cA3#�5C�$aJ� $��;���;��i�پ|��M667�|�{m�]�~�=uꔱE
. ��\'�������֍G�՗�|������K_RI��_;;�urK�.��\0Nǣڹ�0�����e]W�D_X�$D�S�� Zf�ׯ}�H �1�T�iJ޷�h
h�*���0f&dB&�DD`�Ɠ�[[EV�v2qƨ���Jg���m��p�@�T�nuu8��R
�ɤm;Q�R�/�������w߳���\0�Ǯ����,)QU�1{W�TUu�b����)�,�\0��`е�w}�O����҅�R�:\"�`���`��+\\�#\0�!��XD��G�H�Dd
*��P	-�L#b�*)$՜)ͤO�����~ݳ�]Y:V����hb�a���ٸ�(ȠA�dX����*	
@|q{\'�]a]���G�9�߻|��}�U��Fd:�VU�wb�n6}�b�8��o�f�ĉ/~��\'2���ܳ���+!	���CRd,mY;�)jLI��@�0Ve	 \0�*��w�I@	�:DTRdB��*GU�s�,�p�7Dd��b����:c��MO��L��(�q\"��@Ju�,��μ��W^k��k����S�\\J]ו�A�\'f>��-�`�qee�?~�����!�~o�W˂�1uYu]�S���\0�� �30��%AT\0I\0*�f�R�T�5ìb����\0�(H`C�����D��b�,�\0fF\0RA $6h,�l�ȩ�������ԫ{)������/B�����w�5�z�e��8��ufFD���/��G�{���g�������Z�4�{u�4�
*�jC���
@`\0���B\0R-�BUAT!�$��TU2$d�H�)z\0`��JEQD%D�$*�����(�H\0�l�3֠�ֶ�\01��������\0�`z�4�b�౯�%W?��������Ϝ9��O���W��հ*�\0tMK��+|3�i&�g&��I�p�\0��՞�!�\0��
IU!�cM���1FR�̊ 2��D\"�DH���\"!
�`P������ EM\'�����p8|�����˿��곟��pe%Ÿ��1z�\'JG���Ϝ�����
�R$@@	�\0DTc�QI�vb0Ć8� ���BQ	T���HT5�  �����@�N�Xg�s��^Y����=rc�pw��/����ڧ>�)S���)ݮۤG�������C���e/5�x<1��VWw�_����#��,��ʵ���p0��^YhL��B�A4�*����\"��0T�t�A&�8H)��J�hQ��|�9O��<g�+�d$ �&D S���/�B�$>��w�肯�+��o���{��)��@� %MQD�ߚNJ�r���k�Qo�>%]�qY��W�N\0�ٟ�Yv��`*k��������SM^���?ʺ��s����K�S�Yp�9e&u�������`��oE #^RJ���DH�!x�H{W�l�4����е����	t����-0K��x�������-�ę(Xa0�t���	\0D`,;g��p�Yk�q\"���f����D%Ώd�2�!4�&��Z6`�g�UP\0�̈c��\0����{}}�+1}����3ϸ�
]�:��(\"��6	�ny��u-m[�5\0�^����>m&�j��seY�eY�%���3��
��ӃCM�4Mn�SU�-
`�=�[�ؖ]\01�PX{��W���76V��֔�-���	4��5�����XAf�lyOKh��~������Y�	:��5�O���Yb�1VUa�][[�X[+��W�w�����>�=k(�\0\"�@��;��͐�+u�IJ�������Q����1.o|��r!|^o��y�-��뗍�b��>QR@�lJA� �H
1ƈ�Y���Mۯ��AЫ��d3��o=�((�>#��4v]�^����#��1*��s��Ԍ��镅��ٚbFR��1��Q]Z?Ԕ�vws����!27��V0
@KQi>�\\�ｏ1\"b����d|��R�J�	U}�ї�yR��J!�\0\"������ƨ\"\0\0TUe�;��3�_{U%V�0��!��rJ)DQE�z�I.l~�*kz�����Z��P@Ue$M)i��<S���ʀP�UY�d~������ǿ����(�Y�Z�*f�=���t��[�#�u]�
�B���\'�Q8�l����_�6T�T��O2�B\0���$���}�rYW	�,lJ:	q8D�/|������4�:��9P�>2�5�~�z��3)�u�!��9s��J,��A�\0�,��L���CY8�eVq���}\0@�Es��u>]���.I��`���(\"b @!A��K�32�V67� $@�]r 1������^��(G}��؎���(:k��W_}��ӧ�@	�)�\0�(k=3V�HR���G|�,@�7#2�H���g��|���\0\0 ��/?a��1��^� �#$P@ I�2���_�d�_Q%) �R`@Cܵݷ{��~@���b�ǣﰏ@fv��_���)��*
F�H��2
�7\\7�|Q@%3�@ �ʌι�(Μ9��%�ۅ{R��p{��L �}�����JU���-��⼇�fY&HL)-�~��x�I���La.�:��uASe�)C�*X-^u��/kG\0 �����,�E\0`�$�IA0�\0:Q��!�*&q���˗/Ϻ�*���
\0\"�u��:��;si���KUY��w�?����k��223E��1� �I,�!�M����<�()�L֬���\"��<G���1D\0s\"�pNŋƣW$Zy�\"�Lů�-��_�����$ר0�jҤQ
�}4�f�<4���_�U��m���	���V|��в�3m��)d���:ʯ\0�
LBZδ��f�f���lv興��9w�ɗ.q�קM9+��;2sJ0��3�+�����tΪ���i��u];�|!D��6|��WU���E#�o{}���:�C<*Ms����������N&����&N���r d�-�g��xY�2R�@�&���	f^�.߹f3k�?�2�Rc�f�jY>�%G�f%�Y�\\�w���ASҶm�ZB����~3,r��k�h��e�C���hI2��.�&��U���
-�;��2\'�%���Dg�s}*�*(�L����ThΏ�)���a�I�.2\"f\0F�r��w��[]]]__g�m�ֆ�xײ���o���*(GN��[<������,H@ZNh�����%�y=F���\" ��$\0�1���H��Tj)]�̼�,�[��fi�Eb뷲0f!���e2�Xc
��.M�^ƨ�c��Z�(�
F .atn��|�^�.����Z\0I!+�D$)�jQQR�)7Hɪ+@���E�%�\")�lPy	��n�I9�>FS�Ǉ����zQ]�	B��#@��@��[�L�0�\"[�1��k:�����z_�����zt.��sT][ϔ7fRf��܉آP%Uefc1�t�̆ID9ĘdY�\"D�I��[�\"�k!X��b��QYV5j¬�X�ę��g��r׮׍G�p�`�(�c4Cq9�����HEp�C!�(*\">�!���㜲9*D�1��6%1�DH,G�Z>BfI����Z6J!w�T\\29�ᓛ\'��~􁙫�輟������
s�*��,ދhI�q���Ө�P	4�W������J�&33E\0\\���7:�<�4��ḣ��Ȗ�ZP��R��KBH*a��s_Dt���^���P��WA\"K1�-�d7@�����l�>a�%�|�����r��;7�/�f��ʵ�Hof���cV3\0\"`��\\=��*[H�AH�)�v��>V�LHAa�vQ�sn��e��>��;e��,��(��=l)Ű��~��ٻ�8ak�]�8k*,TS�Rvlʹ��i8�cg��h�\"Da�Dq�p�v>
�ۮ���Q�h2988O\'!FA(�RD4&B���	j��OV�r��Ƙ���pe�.�֧�)E�,8��%�� s�z\\h\0矮����Kx�ڒ��;l҈[��g�	G2Iԣu����E���������dۆ@�\0�`lѵi҆.�A���py
SZ�#�پ1�
#\"R��Q�M�4������1�9�f�〲P[�=WZƉ����Ե��nl`�h
�iq�kn�\0\0)ƺ_%��FQؒ��
!�,�Kr��ِ ���x4�LDĕEY�]�E\"&]躤ꜫK����`�،��t��2v�,T��u�J��
*�Z�
h��Xc
kJ[Z�t\\��׋��\\�\"�D���Mcre��زd�ʂ�YB\\\0�(��Y�Ls�M��H�ބ�#�s��Q}.G���z�AA æ,0&Q���-GC�[cW�+k���x��8R�!���&i|���;��r\'$YƲE`��\0\0 \0IDAT��ɡJiH3+B��q��JT��w�{�L�f�u>)wI!u^C��\"���2��Ν�*���h�
���H0gc�<\'�2@��뺦�
+p��D��
���6G�Q�b�ul��uMS�
	�+���u~uuD1xoͬe��<g�e���%\03�W{�c��Y��,�G�*�YA�,a�ȑ\0D�ZFȜ$��ܮ;?}�QB�wu���+W3�����+��m��������7��V��!L���������},���C�saJ��K\0\"���h���B���5��(�+ʐ��VU�S�u8({����G`%a1�<\'�R�I`R�)�I���)���u�e��67�!6N[t�� \\>�u�K��������,����~{T��w�>�
�wu�өo���O�$��A�����U�%��`[B�
\0�.�#@���߹�o}�;������ٺ�ԯ��?z�/��������{bkmcثAR��Z�Q�L
`�PQ���:���bXww�~����Ӷ�mׅ�����˽^�\\��s����ۿ�W�\'����`7��uUɀ̬�1F�qj�t����ӊ(��D���A�:pŨi�$W�eUW�7[[��������~��{��!g�D�BkL���z8M�u]l����% à���|ؽ|i��]ol�E�\0)LG>��3e|l�αSQ��~:��?��*����6�Q�]�8����I����?���v��c?MG���â�M�ʙ-Qa�W�s}�<�!P%bk5��WW��NUbL����`<�����߫��SO=�7�ĝ�+L���ZW%���+�a�!w�$dB2@y>�1\"bI�Z�k���U��|y��3�ξv)&%6��1;����֝?~2�����\'B6d��){���[�l��ɰ�U�J�+���Q�Ͼ�̓��:���r�g��$%W��u)I>T����M�-�z�I���:������n{hnO��t/?�̳O}�;ܽsk*;�4.]��?�?ꪢ�����z�/
K����&	]�\"�T�p����lU5�v4�&@c�;�{�`�6^y��S�޳�}ycm�,�]��׵ӝK�w�Ǔ�pڬ����j��A�)��5uYa��a�w��9?����?��W�����w�s��g�����#��$����i�8!^N�������������i�6��̏��r�
��}�_��W�|������\'Oݵ��398 �ҹ;NnI�3%q��J�\\G�ǣq���ޥ+;/����4��Z�ܺ�wx�܅<���~�������]�N���_�~/�c��{���$!&$fcMQ��*���-,�H�D����J��]�θj�tۻ����+w�}e�N}����Ϝy���_���Oz�N�\'2eP���&>��������IH��kcm�L|׮�^{��N�ݗ���m��X����eP���! Yc�:]����|=\"Ho
��@����)�OT\0cI�_�c	
k�+Ci!����	\0��W�\\���H5!\0� i�(�I����~�?<��\'�;sf��ɏ}��}�ý�կ��7���o��W���{�z�K}����y�[[�~�7~���=����\'w�q���ۻ��^�
��R%F�[gH�b�>���|���w�W��ͽ�ý��K��YY]���;��=�ܙW_~�����h|pj����{��u�3�O|T�񵯞?��Kg_K������SU��h{w;�l�-����J�������z�ʥ�/��b�&��/��2BX-A�pU�����ˌW��0�|㊗�@��!Z�t�[|����-*�HD� ��J�h�p�lj#�/f��;ۘz��6�,U���z�!�x�އ���c�Q��~�����\'O?����w�S���Cteu����/�2MH�ҋ�	��;O����,?�s�8�|�ѿ�tqo}e����m�#I)h��Ec,g9vRMI�HPB��5>����}��ɓ���li��F�+u�8ݾؠ|���ce�W������׿���/��W!���0n|p�ʲFD�vT�U�s��\\e���������y����hƐ\"���&��a�B�-(�Ѩ�^or}K|�[����鏶τo׭.�e.6�T���S\"P\"��\"�)+J�~D@\"\0 A\"��FԨ*Y�w��吤0vu�׫KRqk��=\'��V�.\\�PD��掻�����\'����ʲ��G~.F�M�{��<�0 ���X��5�Hg�LL��ч���$���YФ�ʩ��\'ֆ��|�;���Q�1�&��q�ZU�jE���W���l_�WԶ,��4֪�oڪ()O�IZ:�2ZM�A��Ш0��b�������uOoQY��@��x�D�ڢ�k�)W�e\"���\\{I(\"���H��u�����:f;�޾���i�n��~�#y��~�̋J��{��˿����s?G�_i�o_�x����\0uP��е-3�5ƺ�:kȒAL��(�,f1�(��x�U����NƌF�����<u��z���_�羻����������~�g��7�������ΝU��{�[[�z�=��ea��Yw}��J��!��%�EQ����ʪ��Z�l%]�#�)��]���7����n��z�e��*�0)�+��`�}�x֚�f!�*�<�.!�������t2��}���\\��8������F�qCD%��~��_p��\\[��;����;�(t�GeBc�1YCD��T�*$�ܪ\\-Q��`
�H��2;bc���Ea�-�vι�������q�#4�X�[�7�M�Q�o`i?��뢬�XW��Y��!�����:VE@&H3�(1�*撽
1��u]U�G0II�xr(��ܔ�`4��ݭ�����p�NC���!����ו5�1�\0Db�,Ȣ�1Y$E��*RZE���Ƙ.�+�3�ɍ��x�׵+++R{W.[k5��^�ҫ���9\0%I�1ƶ>��\"r�h;�8B�Jc�sF���{4�ս������Q����|�[�SoV��<~J�w�,�=4\\��J҈��R7m����I�M�g�ZQC+�CDc��*����ގ&_X�l��J�.�K�/<��-̠�\'TpL!y��%�\"T��I�\0Te&��%Ά�L�*����Ĕ�LǓ��)�����i\'����_]]��=�\\��1fee�N:դ
�	�	D5	��
Ҕ�.��Q��3E���	
9Xg戒w��P�&�FoN�Β%¬p\\(��q���`�֙�JIA���o�֐Ss� ���0ej\"��@M
(ꈩ�Y$ �0
c�4�+�dG)��*�oC��P�*gu������þeBM :��f\"BH�3���PU��i�L|�!\":u����ڴ�.\\��v2Ţ��Ƙ\'NBg���RMӤ��i�˲a4&��k-��t:�d�)Jc0V�����I���@�ݣ�s��Ec􇋞��e������شUlؚ[f�(�{�=��g/��0O�RE%D@&FRU�����������veYZ�|�B�O�y�)3�F#M�m��3�J��� 1Ib\"$��-SP��$K\0LĄDS(���z<��vz���rm�V�}����/�WOn�6M���|7=���3EQ9gX�a�n\0�]�x��L�c��i`�Tغ*�+�`��(��X{CB�\'#�Q|���7os:�:8��Ϧ�� ��w���<�*��B�ٽ�IN�<9�U��km5�M�\0\"������Qa6dK�$�Sw��4z�_��C۵!���+��0Z6�cDTe\"Cl
�HHl���d|��UUU��w5�aoKXk�z��uꞟ�yH]���(����8S��c�A߲P�uF�M��e��:�%�=0�ll���jSt�i�	��5a��R��1�!�<�Ps��l��s%⢀��ƥ��4H�H�P)���|/���\\�� 
)7��c�� �%N��D\0�0����-�g�FVPD��U�ņ�4���ng�,K�]J� �����{�\"@�R\0�-w�{R$���7��U\0�fŋ
\0�X�Sw�Y�SVW�=0Εe�J1ļ�\0lMJ8��\0�9��o�(������!�f�\"@H�{�y�B�1\'i�ùka΀D�`�H��)[+���)�,w�>0�3&J
I4�1�XӶS������/\"b�/���s��D��\0�u5QJ�ӫ�4�@�i���{���\00�-��x��D�����ތy�\"�\0��RgBd�Sw���h<ŵ��{��U5;¼�\'&�qڊDDIg#�4�����3f�]ƍUUIc���m뽗AP$�FFb`$TD!F�����̆2����������K��:\0����ݴ	J��1����yF��󨪠���*IM�T�o;�����=���[����:��W�~�hF�H���N���.��)��R�q�������*���<��
�p��ȣ@���e(���9�4�=�������{����>������4Ҵ�S_M��}���ַ�z�!�T�{\0[���׮���\'��{B\0�)!<7.���se?}5�~��|�a\'�@.4���ͫ�]��1 3���i�L�s�؅0M\"9�r�U�^߀�������1��	��e�2�Ӕ-++y�BP|�.�%8�`�\\��2��\'2$c�,*
(\"\0�9G\0�-���`�RJ�\\
!x�y\'���@�
 f�H�
�b�pO@����I��C]�U��qH��^{
?s;�\"u���
�
ͬ�*��ܛ����t�R�R���+\\Hf���7 SSS1�@��a����@E]������j��`*�H����9WW�(�z.��-ϵ����Ή�v����rNf�����u{�5�����E�9����G��+}E�L�5~&�`w���X�������rΔ\0x�1�V��KJ24\0G\\f��$+�\"���r�ь�Հ�����b�e�I�B[*�v���!!	���rd�{G��D�<0�(7�i�\0���s��s��\" �!�0��8��9�\"�*�4�������W!�\0�ٳP9����<��^�_8�p�J��*I%�f����\0r�pBf�PR�qd�*�$��B�\"�fj�=,K&f��s�ms3X��!#Ba�)���*����&H���8~+XJd@� ���Nm�Y�H�gg�\"Jn+ŏ��drsv;��)
�-i�\0L��b�fm��Tr�&e��b1�?�)���j�����_�=�y��~|��|s+t0-�
�
:��\"���=��K\0PU\0��SJ\0B�ۦj곓�Ȅ��a��@��[M킯��m��|\0C�{�j�|p�ϧK̬�
ҭ��\"������߯���v�����W~�to$rA��M��{GǗ���z��@bSTC�6Q�v�>��дt?ţ�\0�$���x�>����
އ�
&�p��d}N	�;�!(X��������Rb�PW�H�׳�=8<~5�~N�-M�ЉLdHU�8<\\�}VҰ��Z
�\\����0c��:�g�m�T:ab,��Vu�wP�Oa��
\\q3\0\0 \0IDAT�c��g���>��|�v0�=X�u]U�F�Xr�i��V�͓O}�~�+ �����[׮][�泦]���3�m�/�ڞG�ytn��	
H�8<圧Ě�����j��C׮���w�s/����Rxi��:�za���joo�H_�ě>��������_���K����������{M)bQ%FD�\"k�E��Ȉ�����/*�Jbc\'e�E��$�̸٬�}�������~���a���iO�V�]UUD�X6NS�cL{G�[�k�:&3T՜Rr��jDHTFeW�D��)��fرODAEĀ��,ӐC]�\'\'�����v~��o�KϿA_��b����/͟鼚�r磯�z��An
m��d��5��Y,��Ir��b��/!
၉�{�Қ>{�\0��쫤����7����^�������_����i���������pW�Ra�+Bq��ڻ�fS�{
�<�uK�Z��SofS#��>���!b���E�&�B��fY��x���z=��\0�Y��v��0���s�$U�F��\0�^���扬�}�yr���U��Ï�~qp�ě��
M��lrUU�ɺ_[Ӛ����0�u�(Ұ����g�Z,׮]1��u߶�7��@T�M\0�T�������)�)jy��R��<0��jq�fW�PU�����g��a�p:
��ۂ���MIr��a����\\��z�n�v��^�xpxx������l6D����X�|��[]S�Wm\0I�?�c�?����)��!���0��7ǇG4bf�J��q	`j�S��OR~62\0E$��b1�;\0�2�z��ȫy�k�D��� �_���޼q�t8B��h���T�k�q3
u5
�{�``@L��:��4zϯ��/�s�R�|t����q�M���#����γ�w�í�BVU���d�U�)1sUU9�aNOOU�Uu۶�����s���g�1�I�\\�i`e�yG4���f�Q\\��8�L!1D��M���|6�U������n_�l6�W�|�4\06CODL##X4�2�6�cJ�K��.W������x���2�rr�Kz�����λvE0p��4���b��7��w�� j�H`L�lK�}�鴙u]W�c
��h�H�۷o#�\'e�����W�/@�4�J�y5UMhIuc��}UU����Z�b�b�ggg���W��ʕ�m}���ryz������:{��;ߔ6M3M 8�b��l1N����A��?b���ѯ�k7Ku%�Ȧo�������<NE�
�dR�_m%sE���Ód����^��aHIBթB��q[ԒsO=���8��<�G��z]��%��F)�G��fĀ���i�rN����l��1y �k�a�4MW���1�l�hupq4pΥ(m[�c|���Z��!+(f���3y5F_��Sb�jP#r\"�:<z��>�я��,�`����ܹ��=�Y(�9�qONN����qT�n&fj��V��m۪��]�bf(9�4n��r�Yob�m���<��b�sBDǌ`�1��&C5�R�g{GGGmۊH��u]cA��v�VT�SJD �@.�.7��W�]{X����d�
�F_�1�RBDnY��{2�axۿ��>�O����2R�\04C,:=.�bH��ݬ	3s����uS�]��u];f�q�FD*F3�� �Uu����������3��\0�qX.���i����s�LD�#3ϻf\'^t�D�t�^VU�DM�(���_�k�/���P��D���?�n�L(b�`l���z��7��W�$e��j�\0�\"RtI�y��m����)�v�0f@�RC����{�1O�Yƾ��~��B98�$���=�u������jX|�B���䲙Ν�b1�SVq�y���.���fiJ!\0PU�w���O���fP�jc�޿ ��k�G����>F��BJι4��	M�`[�R
o|��0�`=����v�x�����?�b���������8�%}���y0L���;0��Mr�,M*)��P�FQ��כ��\0 �˂i3��ۛ�\"32��H��S]��UD�JB5M��m�b��:TMU��c\0pH)Mjj&�bNS�Qsbˍ#����N	!�%�փ�Z�YI\0�=s�P�4�T�\0�Y�6}�o��,󃽫W��\"��X����l�jh`���.����\0��;���j��C������a�f��3A� \'SCDZ���\"*zP�fd��SJ5Gd����l�T�(3s��v[%[��.e.`Q30v��fn�Y���4M)fˆ@lޑ�l� 
V�H��*�p�Ԑ�0%	u#��C��sV�RΙ]�r�ֿ&����YO��ʻ�Y
�O���~_�t���h5�i�Z��M�_7����sN��>�)y�Xx_�����)#0PEPЌ
*F�R�i��q3�)ɬ[�G��e��Ҍj`*�ݙ|`�8��!�Z��4��J�Q!2 A$C$�2r-��-�+\'15�����`�6�M��{�A�9�>�>�1�~Ʊ���b�ƾ	��we�9�h9@��>
DH�f����1������aQ��j��֘���]>��.J\"�K��>��\'��k��u��?�#�
�QI_��W����?��i�bN�8:��������8����K���V�foC��ɨ�]7mV1F?�M�D�7n<���������ヽ�򴭫8���Иړ��l]��l��I��$�==�*�*h�`LȌ��31 #22X��A0@�4�*T];k��r1�c�::ڿr|�6M�S\'�xֶ����s�c);������7D5�l&*M�ƜJ4k��4X�\\9g�)����������SO~��o�����ۋӘr
UH)\"P�f�jU|��s��&�p�y~�Eğ+_����i>J�UU�*�9���y�B嫽��[w.�3��/��={s���s�5�╧�x|ti���,�Ţ���fclg���QqC�J�P2COA�T�Xۺ����gX�G`��}��g��ͺn�6�{,O�f�6���PXw���\'Wz/TԢ�YED@��i]�TU��sj�j �۹�����OI��{��ҥKo�Ʒ������5��۷��ƾ����������,�����]�W�pQ���r�����C��ɳ7�>���G��]����n��*Z��f�H�$
�6��nݹ=,���Bc̪���$u[=�=��*H��A��q�tpxB;d�j�����c�Qm�v���gg\'�c�ޝ���*��( rѾ-<:�l6u]3�0�qB�UU�6h&ZP29�cL�����~�C�ܼa9}��~�������z�s�;>^޾
�zv���q��;G�9r��uN��(�e���~��Г�;��KG�Y��	!�zo�˾���|��M���Շ�]��\'>���o�����Vr�q캮m��W����G/h�1��4
& f�����tgV�`�s���#\"5��/��-mE$眒�W��z6��?��g>s��՛7��C�����������?�����o�������0!�b��@���s&���ɹ<�`����l����{������z���b����l��o�C
\0�h6�UU���z%�9�e�tϼ���uu��5U��
.E�&Is�(��%3!3�Ic�)���ZN�4�����h��\"�Y%�&1Mjb*�E���l�\\.�K���d���n�HV���\'���l6�᳟�ܥ�ˏ>��b��ٌ�4�����������_;>>N)���4�0<H��f\\���.�R�9��G~���j��f�^��z�ʕ۷o7u7�}�.�ae�P|JVn۶�͈h�U�)��˺�¼\"�F�ImRE�,��1Gd0�$�7g�����;�woݽ�A-OqZ��z�	���N�9�\\�{�؀�k��s_�4��9����	n�9߼y���@D���O>��ã�G_��r�r�ݹs�~���w�m{��C7�zjvt�j��E�s��>Ɖ#�\'?�������Ν[��$����j�RJ�ӇTcDBC%�	48�ښ\0W�g��c�\\B���Te��q��0n�a]��f�٬D�H�s�b�Sc�s�ǩ7��*�4�f�IQ����1�%�$F���PL�DW\'�mS�/P$Mì��u�Ӵ�z��J�@6]��.׾��aj�fyv�G!��w�s�i��������?��>|�ם<{��q�g��P_��j�LpѼⅆU�B׻k[>���!�s�8���������yg`1�a�8�������l������ӓ��������\0�7nݞ�澮�N�uUy�4�oz��Y��hL�-�&�`L[yZ&j�u�j׃�#$���%��#��r��Ӕ�a�8���8�Apd�d$�8�H�v����Әr�M�1攳h֜%\'��z��1��f�)�8��o=��C��B�V�r�\"&�h�@
�eկ����b1#P��L�Ȯ��n���LA������Da�sbEU�������\'�x��\'�޽�ԡP�?��O�/���:Mӷ������!�8��z%�_q1�EC�(g�*���)J���������߽{���뵊�\0��3��8c3S�<�1�쐱�lR��� �Q9!�93�i�8\"&P@t,�NN���:MQ-O�[�3�2��0���,4ET��u�l��7Ӕ�8�1�+_M:MS!m�le�;�)�4���`���n����#��B���M�ʆ�����^��_\0
9vI%�	�1���~��9\'\"9g��67N�*�k���ُ�裺I�s�X�𨑵����K���ٜTH�;r��!��영����n0\0�j�ATATŘ��Iggg\"���<�^��y�����l����.���ۿ}��
���.?����>|��`Qy2��f����-꽨����U�Z��8f�m���9*��Ǭ�!Q]2[��f��)��7ô��e���8�s^-�Y�\\���V!λv�5 �ш\0�.�x���LE09W�}��
���������a�f��ju��q���>Ƹ������������?���G�	zn��5x�?����\'��4�7/8C��z�o\0 �X�bｪ��X��0�ޞ�4C��7�c�R7-��3�������������{�i�_�����ꓓ��b/�,���\0�y1��̔�qܬ0�ν��7�q�SD��+�T9.R���*�Tա��a!��j]�Ãã��C�q��42���\0�{�Zǘr��U����zX���0���Ř�w��g��c�#,��+���

tK[F-6�,op�S�͙#���x�F�ۜ\'pj��x�9�4�����Ŝ>������}��7���ӯ{��RJ�s�ǩ���m�y7�823圷�Ct=Z�&;�)�[��r�w]�R������I�V�?��G���7n<s��?�ٟ��q��?�я��4�P�w�Ƙ^\0+~���T���hE�P��U\'l�i%FK��	EX�%��^9��8�Y$��)�hٔ�J
��	�%䇏���4�8Ӧ
��
ɬ��#���j9#Q�x�	nd�7��T;ξ�����Nb���!�+R��s�I$-��n����m*G0�ZP5���]��\'Ni�<����  #;b��3�\\�A��dT�H<�U���t�vI�VdN
�%+���e~��WY�?f^dT$YY/�;��s����\\it����\"$PRsh�p�ED;l�b�k=�j�
�\"\0~���wh�&=�)8�F��y��t|?��.�Zo=�gϞ(�����z����~�N�:\0�zuff�Z����R�w��������^�W�V=��CU*&�������?��w�s�ĉZ�v�w�~���^���ko�s��fff�=�gϞf�ID�7�2H�$.g�����?�V8�s
��b$�r���s�\\\"	��SQ�UB�W2�(
$�
Ѥ���PMף�z؈�P8L#�&#��P���L�tb�8�{`r%��B	G`�΍Θ-
�:\0�G�\"X.?8�-@E<��\"X��#�\0}�u�h�2��X�Q��p�O��:BT�)��D��6O=����-��7�|k��Yn�~��c��?x�u���ᏼ��+���>����ä�E�F�R�\\���F�V~�WCx���R;p��y�Zwi)˲0�(L�4M��ƔM�~�U�5\'���S���}�������֍���֘�w�mK�
빆׏�i��;�ܸ$K� ����bs�1�iu� �V�~��Ό$\0y�J�IB��9-�Ԑ���D;��P�ȗ&�WAG`�X�=��}�\\DDAB�ED��1<���i�jUJǱ1Γh%
R
��Pc�J$�}I�r0@�.O@�P�@DT�y�)ARJI���3��y��f���v��\0V!%���e�ڀ��h�L8��b\0c���\'�,MH�v
��1Ƃ�9�|yRA�n5	]��\00H����b��ޥ{�*��\0Ž_��{�NLL����_��/���/��g�9x��K�_y�z`�~��I�I!H� �gi�yRQ��q_)�Z���V�#���N��P����k�}�Α��?yr���v;�2������n6�Bz�������/?����k�Z�\\^n{��\0w\\tq�VƘn���d- ZD�{���*�J�R3�x^ YTY�4�Ҏ` 
���\'j�a%%���W����\0����� �1E\")=)p(�[\\�`P��c�	<]G��9�X����6}N��9	N:�t&F@$��7�臲4ҷZ&�!��: �;3�.��۱c����x���v�]�������?���7�ӿ��������\'_x�[n��뮾�꫷n�j�
FqAtB����P���F;�+[ùz�%8}����
ܻ���4M�~�I�x��Ғ���o���v\'�d�M7���CT땰�����ٓ�x�������o�����W��&w�X\"B!sm�S\"P��H*��jo�3���#=����y�̶m���7?��Ϟ>}:�z����@��]^^�:ϺTJ)��(b��\\�J����ٳg��f�^7��ٳ�)��qk�59��(�tn�F�Zk9�Y(�бzcU|L]UJ%Y̍��XfT���a�k=�D�x[p��Q�PR���
9��|�^�j]�Υ�z����k���C�bm�1ך/��:�<,\0�0��:p�@Ǎ��$����-[��&c�_d޻����Ï>�����UW]u�]w]��0��n:��H�b��T�
O������|}7m��a�	��C�d,�r(p˨s� �
Ie�4��c$Y�M(�?sv>�u��=3� �7=�)N�W��O�ٯ}�o�[l���ю{{����̲���:#%@`��kh���S��.D�x_����Z�v���o}������ښj��.sx����9ޝy�3� ?�Zs��Ʊm۶W_}G���ysssI���?11�s��,�&\'\'�$�tb����#��8��*�<i����`��S�L>��o:r�z��,~�o-#��E�\0�4�������a���-~̕���9Ʈ�p� �_���	v0x��|�ȝl�e����!x��y����R�k@4���s����5.�����4߲e�����g�}�������z\0*�������Ƙ��I�S���YZZs��x
�+�0^��Xf�v���Â������|�Mj���_��>�,�ĵ\"f5p�\0��6
i�CI������D7�a�+Ɗp�S����#�����&F?缐�Yނǐ�1Ta,%/��bI����h4ؼ�h�߃.+�H�M�$)�$I8�IӔ�����(�$I�T�$��Y�m����o�Pg�,������_���7��ꉓZ��f��r3�9�K�d�׏U\\
\"MS6&���_ͥV�ј޴��g���׾���O����	��wk-�Y3��)��	á�B�+f�����ۇ������N�:5fff�s;v�ؽ{�;�SH��	�B�s��/��v�C@Ob���k����<��?�n,�@gMn|
!/�\"\0*z��(�����_��|vq���E]t�7�<7�	!\\��ͨ�m
Ԧ��J)O�:ōrl4�F��Mq�����®]�z�^E7�x�C�*��R��i����%�R�n��dY�<�ؚ��nG�wبs�93C���˲|M1#��\\�+�@�w�҇s���珅]��\'�u<��g��F�J!�8����30��N�ӗ���&��j����ͦ�27���kk����uNz���:g\0`Hw���9 �RJ�^n]n��Ҁ[XX�{7w�N6�O>��^~����SW\\�wۖͽ^��j��/=��|]?ʨP�#�)x�g�==栖\0\0 \0IDATw��{�}衇8�d�:u�/)3�j���0�~���!)Zፎ?>8�F�Q�T8�e�B>|��n`H�ꫯ.��4˄d?:t�Aas���z��`�o��s��E!t�mq�D�\\w8\'e,Y�p�(���{������_Y	�x�����ڜ7߫�����^��T�=��\'.�J7o��~T
������Yښ 
ُ��?�ʈ�7����Y����BJ�i��1A�U ����}D��?��O|�W���=9Y理H����nI�i��qǱ�>1��>��<�����(����A��V��n��\"2���Y���Pd�����:y�d��e[����$G��0<p�\0�UR�M�6MNN��嘉�2�
k��+\0��+v\'e�\"�{�p9@�9�*��G9-��ERU�(�m�����U��P��
Bt{݇y�?���%˲^<���i������8��j�Z��9�,�8.�$6���]�QDl�ZI;�D�&\'\'��*�(�#����q����x��4��֠5\0�\09F�sB�A�r��\"���6ēX;D�,�S�3��5�)G�#���<�&7:�&��$���\0�Ag�9+\089�yW������a�����\\�]��2x��C���$��&�pb��`�>��t΁�<�;ݮC0����&�B��P�Dtq��/���ȲL�i0B�ʊ��<@�j�{��Z�z��S_��_��_}i��B�6���\0�����CJ�>�%!��r�Z;99�*�=��׾�7����L��8�8J2�d]�]�Da�!�aX1�<\0��L�<� ͳN��k׮��e!�+��\\���A�15����<��;��:���wI��w�O4��ԧ>�}�v���Z���y��ʫEa��t6���X�\'c)�6s0�l]<��otV�Fi�\00@DґR�JJ�y�9����{����F�ր.$BRB��Z�6�@r\0���P�DD�?!:g�q���^���>��\'�(K��8�OT+�v7�:�*�V��׿v�ԙ�vgv��f���a �4\'�p9�vo�^wzzZz*�Z()Yj�p��jv�����~w��~�ˡF�T�)D���n��&CD��xgQ�^��a%r��^�X��ȍEt��	?�f��q���R�����z>��O�9p��w��O�S!P2P���
�9���Fo�}�����>877�D���i��L511q���;v0��}m�$I���+�|�\'ؕnڴ��h���^x����������)�y4�����\0:t�Z�QYBK�R����~�c X\0�9*��F�4/���� e�v�͸�RJ(.���}�\0�\0�sɬ�ÒeA;�7Y�CEN���Y.k����HD��X�$����xv��M۶�~�5)B!9��&��*k
|pm��#�
8�ڶyK���|�����ڭF��d)�Q��RB�8a,&)�4A�`�$U��B��<ouz��Ƙ�`��?������\\ZZ��J�>�\"\"J�$�s���:x�����O?��v*�
!��}��|>\\�5_ϲl���\\d���{o���ݻw�z=���y�͛7so��6��G}����_z�j�JD�^�	S#�����kD\"I��BeY��v�l�kV\\�h�����R�C�es�hL��9��O��΍�jY�2bU`yEL9�ѯy�
�Lp��$�H���^u�5�����eԭ��N���<��R�y{|2�s�dvv���6�-�Fh��o�333��)�8���Yg���ӱf`�yܼ`�z���3��8\"��ӄ�:���v�����^~魷��<�O�k\0�Πl��^GG
!���yK�ݮV�KKK�Jevv��뮻��+�$����I���ǿ�o�� ���n7�<��F�c��+���R�I����8�~8p#8��6J�(�\0�����*�J�eI(���
\"b_2Ę�y�[���i��-uu�`M�ˈ�=��dZ+!��g&�;ot\0�=�ܰ����@\0if׸Y�/���͛?��0q�^�?��I�lٲeqq�i=;v�PJI!��67�n���c翚!P,VG���K�tr>�	֑��h�ݲธ������<�G�G���C\'N�BHO{�0�[�ؘ����`�ΝN	!>��O;v:\0�\\s���2W��������ov`�F�W^A�����
,�#�x�87L�y�1sG����UG9�(�U\\�5�6�JJ�ZR*��zI>1=���+��9���Ig5:�5�ڛ�*S����E]���M��,[ZZj�Z�Z��ɓ���Y]|��E}Uk���8��)
��	��-v�q\'I��`0@$9==�n�� ������7�q����)q�@�Ax����:�^T����?����c�>�������󓓓D455u�̙n�[��
~��k6�ι���~��y�����\0�9��Q�9�T�7&%\"�T�m�ǵH�
�c���U���-Hc!�x���E%|��h/�檠R}���\0��19dYf�5�:ߘY�*e$�����{��j�V��� M�x�
�(ϴ�\"a3�� ���#�4?17��ەJ�uV	#_yD�eژ\\Q�Ԝ>����2��8���[�pE��o���o~3��$�8����q��/�U�ӧ���-@�׏����y�s.��R���\"]��a�����T�޵r���=*�m@r������{>����ȡ�o$�jgs�̹)�Q�p8�vT�!7�8��f�*P�^��ţj��yA������XG8�\"N�6��v�m����/{��c�9(�\0ѱ��ζlFL�������Ż�kff�����v���
��4M���S�---�y�\\��^��{�� ���1Ɓ�N��p�#S�]I/�^ǜna���oכ����΍�rM��İ\"��6.�&�u����������PB�P*��`h@��+�9��wU�(p�8���GD� �^ř��]u��Vzoϝ9��k ��s<ztw�u8*��h_@D�N��;����8�]w]���a����߿�ԩS3�f��s��y���__p�G�5�����f�w΀`f�M�s�nJ�D��P\'�&e���Ey�_�P����9�t��cAI&b2<�1�Rc�\\��ڨԙ)�Lˈ�X�k����Jg)
.�B/wH��~��~@�A)��ez�1WZ�ϡt���������JEAp���zc���``zz�C�P�ZUB��\0@��=p�@�q��Չ���l��q���L�L���J\0��l=3-�\0(?q�fa(8?�/�-����3%~�LH9�(?��g��</�c���A�\0���B�3L���k�N��>��?=?s���ZC�i@B�B/T~.NS$��άu�h��R� Ix�6�H�N��ʈ#8�\'i!X�p|����j�`��(y��Dǁ�a��~���d��_�ϯ���3F:c\0-K�u�\0�Ґ��E�XJY	#B:��j�պ��%Q�٬V�aT}��;[�lYXZ����<��j��mw�*�4M�r����G�����i���2ͳ���P*��P~�1����v��9�8��=ݭl\\�_�X���
Ϋ��������o4i�c�v~3q���
\0�<!1\'Gh����``X[�9�FQ�Zs��ڽu���@)�$	�������6�4xauz˳_��?��ں3O������կNLLp���h����su��h4�5r�Ν�
l��s>H0�(p���BJ���	��ӛ_:���}7M~p�d}!�y����t��9?Z����Y�~�6oޜe��ӧ����nǎq�fY655圻�{��k�RG�}����0l�ZL�Z��ע��]���,�������V���\\�e3}r�sD��z�}�D�����̺L�q(`Tld;�
�0�������$Α��hRJ	�$�
��5�������
}ל���v�}�w������я~d�
���3#?� ���_D�2�L� h�9)Y��=����M?����k@�������G^m�VO���W^y��~�w��lLh\\����Ç�ݶ��zHJY�T&&&��o�>vσ���lv:�g�yf(��ry�b�|���P(RBte�8�i�����p��MN)��nl���\\ϧ�]ϳ��
�yn��f.�d98�if���n��di}r�Z����#�d���Q$IeZ�Z��;�+�r���%O�k�n�� r�O���\\�W\\{ӕ��Y����\'��Ϳ�p�p����W\\q�/��/r�y���w�v�w�y�?�A.Y5���X���K/�]���ѣG�/��l8t)���
2�����	�y����G��L�_-��\"�#�u:��&7���{s�΋����8f�Z��(+0��c�W�u���9�+}�:��Q�$qo��v��v�m��|���(m���}�@��<M�^�\'I������|��~����]���jZk6��{�ȑ#SSS�v�;�6o�|�E���n��0��?���h��ONN�V$(���Bݻ�蘥��^��t�{=l�Z�~m�e@�0��R�cL�{2��� ��?��H,�2LtВ�p�x.Z�­�%m��Y-1�IL����F����`��������d �W�x�W~��C�LJb�����o}�w��\0\0�IDAT[����K/eӹ ws���-[�pQ�+�H���!ή���n��k����j5��\0\0�e_[F��0�l�k��n�G���.���o�[_F�3�1����9Sُ����z뭯��j:�xA�}���*��@5jU�N�hWD���HډJ���kD[n\\\0��lY�݊�>\0 � 0�J��vee��@Y�{�U����L���>	����o�۝妳ZI��Nwzz�3¯|�+<-�Bsً.�hϞ=�F�ĉ?z��3g�\\v�eg旗���[o��\'�<x�g�y��x��pg����1�*����G96��ڍ|W8O�Yϋ��}��4���p���r�X�P۶m���[��k�,
?��|��C�+:w�x��$����;$B�����:N\0r���\"�E��u�����:d VH)7o�>�l��kn����>�I�� 3���o���?<�e������R�SF���L�<���_|��Ԕ^���.?l2Fp�>|xiaQg��-[��ݛ�y��	�076�����饗���7ofxdyy�ˡ�2Y����r�E�ȯm�3g[Tr�cْʰh���:XQ�#7	���(���BR�9��$�-�k�h1/�\"�a���6�,��B���n�����j��������z��2}x�%��mnT�@�@�T�:��\0h�@y�\0�1�9�(H�\0��(���h���!g�Z�h�ݖ�G�:�9�,c��i����я����)�zƸ,}��,//� \\�����$���V�A���;�J�+��$8_�;\"�4.�<����Y����c��=���sw,Ν��O���?����q}U
Ij��Z�J����{���	ō	|�(�B ���K�2�� )KR�.K�Z�J���*��~��˸xrn�S�q���	��6�	��\0\0\0\0IEND�B`�","Male","ELE","0755656565");
INSERT INTO employee VALUES("KICTC-STA-0005-2020","EFRAIMU ","M ","MULENGELA","mboya5@gmail.com","�PNG

\0\0\0
��9,�W�s׍�X�Dbcm��|RacU*r�R!d�:�)��<Hoi�}��Y�i>���J�b��j�d�
zv�R���8i�9��ft��\'^\0�@5��J=ɪzW�Kԙ�.o|�a�9Y��&���W�r���\"V�t��}�Bn���x^?����5�G�,�8��0�@\0��q�C᷸�e���m^�%�*�$In
�m��A߶KM�H�2���U�0�XO��	v?�^w�C�����z|�N�������q�h�3빔����4*پ7#�L��>r�٭���GS��16�3πT����u��D$�0�Z�.A�ݦ���M��Zb�Us7�q��a�J�.M�ؚP�`�A���\0!���.��U)��Z��w�6x����>[�,�C���\0�jG��������)OK_1��&�
���I&I�eB��
໇�
����\'�SU<�+�y����e<����=�b�0fjf���5#�KK��s�}\'b��Mh�C��D�g@̎eD:�*?��N��
\0��\\% ���T�P�B�J�H�!`�B��Q��͠IX��}����*o�G0&A$�y?w����kR�]�̭��I����0�t*�p�/M
=^�#ٽ.9�i��@���p\\.0l��RG�<(�䡪�j�����o*���y���p�|�k�����?�
,�P�a�0\0�v)�[�����0�L6i��O_zI�^Z�����x�!�@.���q�	�(.�������th����\0Z���7 ��
�%y5ʏ����#�/QC�**����>e��B%\'P�s��9��7eXIf�b�CgRS�M
�1w���dCh_��2/�>��B���ˢ�p\'�:^[�$4O4>���^���{� �RT��
�����)@��[\0?$��^\"Q��{۬-w��.{J��3/:��|`��|�?�GE�)�N�F\0A��bB#�A*P�]q)p�h>�]\\	h�ў�ny��â�`4�^�ݡ�$���Dw[j���P��U�\'#*r�%��������������(R�����D,p��F���g���SG�j�!��Cm!>T�����/�t%2�n�?�@+��-�W	:*�\'��S�>կ�HY�-Ht��q���O/���E\'x����&L
y0.�I�C-���1T���A�&z��\"�pO�����u��\0�47��T�$`���X��>���*��]|/����y
�aI����R�`)�ѡ��\"&Ȥ`)��2�EN,�ND(I�R��TG@�]�L�4A��]8Q>�U�(�_$���E��A���C����%�h��l�}:MW_��}��gj�R�`$�?)��i��l\"ƀ����\0i�h=0zV��b%ރW\0�M�g(~j?��s�\0�Ȩ�	Y�
����p�(~3yz�C��)���\\[R
00�
a�^�f��Ѱ��+yi(u�,B{��������`�и�E ��ǅ�S=C����)<M񐩽�}3��������dG�N�Cvj4NX����o�#\'@��r\\]#���ѳ\02�9E!d\0c��6��z���R\0�A��A��R�Å4�?AZ� �p�8�Wv���EL���i���\0����̃��ײ@i�$��e
6�+��>>���,��a�%ȑ&�#��B�1�⤗P�(fp��������pԠA���\0���
������vf����!O-K�)>[He�)k��Al����hm�\0�T:����FE�[YQ��r�~�f3[�_,��V��o�ԴY�x���hF��(A�LIC�o��	����N)�P�|�b^$x%����(`⍧��\"_=�o�a��`#XN������e8�|V�xN�KJ��.3tI�Z�dY��P�;�Rہ7F�,z��@Oڃ%pW���H���$y��#�����FO��xd�庬��Q�/T<�?3�(�s
3����ꃉ�t�?��c��g����Xhb��&�1���X�E
[v�G����N����کhN�0̹\\����� 5v�q�,����qu��swB����\\��)�.��4|���д\"�R�t��F��:P�%l�
�#�<�@�A�
���.#�0��4-�s�8 �Xt�
����*��0H1!���ޑ���dC-,wk��	g�����!�/Du�~�z��+D脗iw������JDWa
+��d���\".�f��I�V
)��?�5��4���A
�
�@F��	)��<6lMO�dU���4mrJS�
���\'I���T�}2���F�|x)���!k�
��t�S7��5h�fIv@:�T��(��f�	��\"���s,�#�`���\'��YẲ%���:FU���p�\0�4��y}Ss����W�G2��y�!됗�U���q �ju�k5�Mg���A�kS���9���$ɴ��o�t���G�����M]�d���8�@Y�un�:����spm�㼟�9�]����*�I�fK�.�O2d����uz}�$i?�[���
��U�0r%7�ژ����̡���׷�#�2�:���x�n!p)B�����Ӧ<݄�?�_%�蜕�]G�<��b�
�MUe��}����&IϺ�VMb��o�v���H0d�A�Q�*b��tp3�

(����X�?�(ډ�9t�\0p�K�Q�	��w���SP���:�s��*��&�������T�Qv!i�6�e�(5����!\0��P��Փ#�
oaE-�=�D��|t�Ls#ݹpACR&M�RȂ,�L��4��(tu��B�F`�%���S{�Rdw� aX5�����8��ZL�����ȃh�;��Q7�D�ώ����D��Xt���Rt�X�O�8�7��,�$��e�\"a�T��r�S����c)�*���03��\'j�������M�#2�X�~��<�Vr�	���\"�1�oO�6C)k�\0`ji4�п��O4���e��s�9\0\0�iCCPICC profile\0\0x�}�=H�P�O[�R*� ␡�hAT�Q�P�
�Vh���Ф!Iqq\\�,V\\�uup�\'G\'E)��\"���q�=�����
Sͮq@�,#�L�ܪ|E�0�>����(��Y_��Iu�Y�}V��7��g�nX��ӛ��y�8�J�B|N<f���.��ƹ谟gF�Lz�8J,;X�`V2T�)☢j��Ϻ�p��Vj�uO��p^[Y�:�!$��%� ��2*��]#�D���A�/�K&W��B�������l��䄛N\0�/��1w�fݶ��m�y��+���6��O��m-vD����&��;���.�#h�����)���5wn�s�>\0�U�88F������ι��Ӛ�C�r�?\"?\0\0[iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:fc31fab5-fc39-43d1-aca7-cc9302404935\"
   xmpMM:InstanceID=\"xmp.iid:14be683b-a7cf-4a78-a3af-a12d14b8c642\"
   xmpMM:OriginalDocumentID=\"xmp.did:2caf43fb-a3ab-4166-891d-0e5825a4d0f4\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1602735061592841\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:b76f1f48-a65a-49a6-8926-ef117db66428\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:fd7fa414-bde3-45ea-b8d6-1e546f5dd32d\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?>�/h	\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�
�(�B\0\0 \0IDATx��Y�$Yv��s��%�\\j��}�f�\0I�� H2P�@��$��%=�H���D3��E���E�	�@���i��Z�՞�{D��{�9z�Ȭ�����{������EFz�{�~������<x��o\0̌�N~������w�_��~��\0�
`�\0�nbs�\0��	p2�b*��Q*�e-Yu�n8�`��pr\0X.��ш�Zt})�&V
�jf������]���9Q������yU�u;YO�8wF�z��(=��
� UUU�3gϷ��v4媭�Ӧ݀3[��!n���.�9<-���7H���K���N�h���>إD�^���gAf�PG�ؽ����Ճ���۩�[��v$D����!_RYХ[oΗ��s�_|�[�~V$.�y���b�f\0��H\'������١�A�:�4���\\7���\0fc�19�F�ˈ���?9��v�v���S����r�]��4M�@���R*��6�1r������?���Ͻ���~��,{�Ýa�Qh���?��;=��?;FU��q��8�zP�w}������;�D�7H��2��#8�%+	Kdf�b%�*�@�#7���߸r��7���?|�T�&�z��D8�Ƹ&J̅��,��dI<FWO)�D�
(\0�S!���������r����_�x�����h���JRq�*�ٻԧ4ob����<^���OG��|��n�d
��@�t���������@ml�b����?���sZ/7����^>��qs��M��� �Y��Q����3%#�2C�k�1���{��y�O������\'���6bE�T�~�\"sH]B|�GZ�ߩ�Ϋ��k��0�e+���7�|����7Z:�~ϒ7A��c���-ں�N� gI_�6W\"X
�Z�*���>%�T�;��0��J�D.�X�	�ǐDb#3h��Fơ7v2�-�{텋_���������s/}����bT�͇P)ٽ��U��-�
�=�F\'k��
�ܤ���;����J�����I�M��gFWoͯ�����_���ƣ��{��x�pQ�ι��u)�D4�i�3a��|�>0A��~�N�~�ۏJI����=�����v���Ԝh��;��!6���{7Tq�4���/n]�Uvj�*��fP�|�$\"89A@\0	�@C��P?_aff��=��;sp##\'&67w�U\0p\"��`0]6D�-�v���w����g�?}�}�b�B1����0��jG�b��G�(��9#�� {`�SQ8�����?bD�R\'\"8V$���H	�e����ɕޛƼ1��53��D�{f2&\'\"^�!���X$`���AN�03$03�ݝt�rrG\'8����Ln.�B1�J����G��f�z�Y��[���T!���K�X�9%
}Z�4��ՊAB5�B�j������>m�<���R�2�u���y��B�0��v���(�c��/^_(L�X�W^A=ϫJn~��r�څ������~-)�p�ܧ�g�IGQ��1z��o��+�BH�H�\"\"tF-wg&3#���xvw!��ŴX94�\0bC�(ЙYu��ѕKոnB}6q$�!-�3\\��į;(G?Ge��Γ8;��t���bv�ȆH@�s_�u�a�X�Y�QLO�����N6C�׆ƻEEʤ����8��x^�:��|���\\U������J��#�df9甒�źqwhqg+:(}w\'irΪ�V��Tͼ�CQru+���LI���|��V�����u���DD��^V?�C=>�q��6�L6�P�~o9� G����~�>\'f0�,�^�d�����nB�\\��6�\'e2��C	(�șIH�OD$� A*�b��	�U�(��Jd��	��	��;�M��`�;�
V
\"U�u�A��`�\060�����rw��`e(��3�a�:�c�mp0+��+UL��J,ٸ���_�����:&� 1���L�G�6⑱`V�TU��\0;<ܿq�r�|zZ��PG63
��$J�$`fr!R&X��8�/BA81�0�����:8�qd�@��C��.�8nu��i`�@��4pN��k41L�&�F��wnm]mZ�c��bx8�4�l���1F�����Q��0���7o\\�l=<�YUU)�4�q\0	�B�D>�L��n�>�39L���8A��ɰ�Y���.�Q}� ��(P�ÎzXg�ɢ�N\0�d���p�����f�WԐJIZ�#���� �hU?�}��\0�\0��h����/�_j�%�mS�~�T�L�U��!v�;l�S4\0g\0�!�y� 2�+p���n\0����
�F�d�
��L��1f&�!�#3�UUK����Z��U˃�w\"3W��u���Ʀ\\��+�$����RU��2?�5���Aȕ/��B`,H�����=�⾷�y��Z�u�,uO�f�����뛭��}R���瑮wr#a�x`svg�
����ۮ��4�cHo��č`b`xr�H�q�3�!D25W#w�
��������ݲ{�c�~x�	P�F���y��M����}5ݽ뎳e�U��P0�Bՠ���]i7�
~G��܏�Y�I=6aO���>���
�����P��J��	~����q��ԙ����l���*��W�7�_�RJ\"a�
�1���/��x\0�P�+9��܊dB.�w\0ou6���:�Q����Q{������\'ff0�P�!V�&d�.2t�2�����on�$0�Q(ו�L$�\0r�������r��<-]Q��<���\\�WR�Q��ɲ���%5��r���J<w��3sFq�lW8�c�h����|QB����f��@^�0�S!
+s���Hqu_IӁmO�����d s37#)�EDLR)BuJ��!���J��ѯ�=�q�j�%8AD@^R����4Q���*,��S��Uw\0���D13��^$�D$�
�0����c�~;$�8J�V-{��1ƪ�b�!�*�u1J`1���{�B�>t����5��!]u�(@���ک��p�b0vu8L�B)�7�$A	DrK}G�;�Wizt9��g��~�}ێRB����ʯ_yN�kw+�JGP&sK�{�\'c�\':�QUq�R\"2`���B]�f���l�+	��I�ц>%��K)�w�� ���\'y���G	,����ܣH	HG$9�ZM�d�_����ʛ�7�?R�ޅΓ���0�ܮ�\09\'������S�H�DnC
\"�uq8o�ؙ9�Br�}�������%)�	������~~�݋&-�`����4��2
O]Ua�JQ
u!��Bs.��ZUUC��W7�^�B���
e��q�r*ͥ��:���&m�G&�I�����Qb\"\"�%k�/��rADU`\"����z7\0,�,��=���`�����8�v����Yr�!=�O��`�i&i�)��t��1$2]��`D\"v��1��T@C0
�d������|Lb�h?SxPM�I:ܻ⣟Ύ��L;w���L>}�\0�V�h8���؈�0n�����l<��J�+!J�V������*��������L�}�9�xc���>j긿�;iGﻥ��9��f���3�$L$�-���E�Es�,�ϼy����_,��r�i�Ye:��7~إ��׾�K��-/�=[W�X,j�X�r������E���PrH�(�7��~7��(�\"uͭ3�>G�?�켇�#>�N$�4
?����T�:�1����Z���~)W�������U�u���Pbgwؕڗ��p���Q�����\"}�wߖvt0?�cU1��f�p>����u�>��C�B�0О�*��j���XqS7u����
\\(������Q_�D��	 \'��s}��Zh�;�6�E�55,^��D
A����|����s����s׫*9�������lm�-�~湽���|q���G�3j?������e�u�e������W>���7����z��yH�HJ$��	B.f�@M����@=�|i{��S�S��H�Y\'�|]�WH�~�6wtD����L��l���o��:-o����0q�Y�y���*H������f��ۦ^�M��������a�ӹs����ϟ;��qwg<j�z��� �����-rw-��x��n�	���r����\0_�\'�IS�vvv^z镏?����\'G���g>�|u:����~�{�=w�����[׮��֛�7n���͍�㺭�n�\"s!���	\\7��C(O?yF~���LO?�j�� z,G�_�E�ctx�^��@�Uujc��K��A��~r�{��l�f4����Dl\"\"L���t��Sk3�ٓg�,S����_,/<���֖.������k(�J�?��7w��r
؁�s@?��~ٿ|q��ԘM�]�.��X��Q��BdA���V�s:{j3I�%d6�/��ҵ�7N�>�TU��O^�PU�\\�ͦ�;�����n<�no7�6��0-n��g�[7�ܶ�7EX͛��q�ک�g4�@�v����IϬ͂O�ԚP�M�GU�/��,$5���*r��
��|���>���_��ϝ9��A\'�R��݅�r�K�ՊP�C�hF��.���ݛ�i77צ�k��{�^��-5L44ƹ�����l9?Ԕ7fӵ�,��u]%��^=}��[��mk�m�`�&\"f&\"�S��fš��t��B`
��Y͛��������~��3g��<nG�Μޙ/֚�C}j:��ּ_lo��8�>�H.0�>i,.uC�:-��H�t�ڇU����W��x~9?4��G���k��
b�s$
�����L���ٳu�P;wV���J��U[zo��*jEC���0j:j$\"�R���͏	�\'6�Kݬ4���f�߀�y0s/��[�[.V\"pv6���N�5!-;�n����O.\\|�b/S����JUI`A(F�
⺊M�@)w�n�+b:�U�{]v��Y;���W/�䖓[����/Ż���H�e���	�:�M�SU�Mc`�1��:M�Y4s
�k������,=���b1n�gF��9��������
���D0Xq�\\�3����`΢QLl`�gD63����dV�S�x-I�̺��a�I��m2��
UUS�;������*33�:��%ƺ�+���Us���^���%Ҏ�l\0��iQ�*pXͻ8#,檪(���\0u)��`���0���d!m)%k�R�fN��ܗ���\0���g2���;�Ns�ۦsL�7�����k/�����0	�)����0���.��l9gu[��9T���s^M�UB��	;Q��53�J)��ߘ��BA
�\\J)�R��dP7��H*��u�f���\\$ew\'�aT��R����x�eib�d
���?��J?fSԏ��׸������vx��v�vT�ֶw���ڷ����nQQ������ad����^L��5e�b��(��`�䜻��Id��t�PU]�D��܆�!pb�SV/V������2/nŁv��s.)k.f��z.����oV�0��L@ N�F�3��������Oxn�c9��r􈅋����%�d�����<�4�}�\\�Ն:��ELp+�aR3	��y��K`3T��)�-��6N4�E8m]�m;nG!�R��R�$T�1[���#a�n�VȡNVTs�9��wfF��V�.gu��EIK�YE�H&�X�%�:#�X�u��Ta����\'����zM�dC��L����;;��$�x���%�R��������U@0&8�9Ȝyxύ�̡fŇ=�u]I�����B�6��x2����ŭ\"$�>gu�V��Q!����ꀪ�v�5�:3#���>��ᔓ)��@�(M]Oڈ�r�
H��i�C���1It&���d������+�K�z���^X�����\'u5m�XQRE!��:̍�����pc&[���_ͬqwW��f2�
1���̲Y���ts���s�\'��8��_��X�Nf�Y��V
`��Ξ�cӶmUU]*�E\'ћX����on����ò�upp@�복B�u��UK���+��P�%[��F�?�:���};�
�����/=w���poQ_�/�B�\')u��I�>=�ln���O٧\0�.�}#�����ee�L��_o���J�R!Y�fVo�KP�������`׻@�H��`���
|�X\\�~����z<.\\���j۶����ƙ��P5�%g��n�Jq����T-��Yq+D�-�Y)�U�Yy�Z5N�L\\��dp�N���Eh|/q�WV�>�]~��6�k,G�G��@l�x�N��bU�e��;�1�K1��&Dsu���P�7r7��� �����R�.� ��a�����������\'��������̓��kD)�7�o�w�Ï/r}�Ԍ�g&id��^������2I�b���75��ɬ��BȎ�L��u ���:S,�2�<���Wj�%Y���O�z��i��t\0ʆ��ݝN���R-�Sh���n	�R������0���s8ș�y`\"Pι�� %�U{���ib�/=�ܷ����.�����}�w�ā�w���������^}��gE$��RJ�nkk+-S;?�L1U-n��G�͜���
$�2�+f�AP@��iH\"ǖ��\0�`�b|�6��6�:��/Y�~y&�
\0�(wB��%��w^�#��������i��hn9���)�I��6�lI�!^�H3\0�����`1���pt�:巺N�̏�*��.&2k\0(h��C\0AP�柸��[,?E���d�J5x�iSʴ��e��Og!�^QB�l?�թP@%�vQ��\0QL 9%�
�U\0��-�y�����-���z�Y\0邍�H�Y�@��·x�>D��>�7����{���˦@�o�,K���b�1�:]e�Cd�*A5 #�jT!�U�0��)����*)	h�&�lؒ��Ѻm��3��%6H�u1.N���S\0@�ݢ[�B�I@�U�-!\"A6����y�dy,��U[g;��(�	A�T	ꤷ��;���������P��ܿ|�C^a�b�>��#�UX���?\'y8FDR�)�S���L��0F\0%7<U�1��
F2�]QP���7&%e%DJ$ֺ��C�XUT��++S��9B��\'W�Qe6����m	�WbV�>EH����FIA�����*\"�T�p�<���ѩ\'�nK1��j�M�����`�+�r�^������2i��b��Е�V�狛\\�G�r`����o?�޲�[��3Xh�*����\0��D�*��\"\"$�(��DjY�Q�M]{c`f��bL����(
����s�]��q��\0�δ�!���D��\'��o��2�Y4�Q\"\0T��MԮ����d\0�R�u]&eQUP��`qj\"��-b!�^UR���1����Qt6��~��k	��3[/I��@Y�3h�8IJ
!���q�S�()�$��9�AiF��ukZ�u$S�!!-�w��A�U�º�葱�~ztT�%m��YwF~�y�V�&�4���k-3[SJ(�|�����\"+�$����S\0P�!),�)��@T��WU�q.Q�5ޫ���5����󃃃�l�BTնm1��D�����A\0�������-�T�/&�6z�Z�;-�ܰ��t�Db E�-3X37Z������\'wɢ�P{���&x��A��_:���⻾U�QB���U$�&�����)%P@ETLYp�,tT��9!�\0)�6!⒧�������\'�*���͛��|4Ykg�Y��WQ�y|IR>c\0�P2PAAE1��BM5�)+\0|Ph$:*L%Aۺ���ǪiQ�)���w�{_�G�D?�^�����2iM_}pܔ���<��s��aQ�ܮ�V��b�s�X�B,:&8$l��`td\01	h��H���o��U�s���A�\0���M��,��M�ׯ���ǳ��aִ���h>�۲�
�ټik�p8t��H�l�0�P���$OI��f���\'��h�)e%\\����ƀ�HƀA
����:�?X�n�Hh�N4`}�<,q�Ћ�U���uO�{��QJ������tJU ɀ?XA+`��\"\'�,���\'�����&�t)��M�DL)Ez��0�D]5EQEU��a�L�N)�m�X!�>���]\"2�?u��R�����+*	y�U�DDtI\0*����y1!De�8&�H� 7A����Ƕ������j��1w�
K\0����0�tz@(?��OP�N9�I�-E#Ȃ&@U�lj��\0���������`gg�`��4
	@TZ�����)�@�\0�\0�- (���w�M�Ne�C��G F�ws��̡Ut+��\'s�|(�A�ؠb���(		��-o���������`>�g�Y�iYmw���䉓\'{UYZg����;;�d����u.���^o<��e�VjW�Y���677MY�aQ1��抈���TU0\"J13B,0j�\0hР0�\"�E������\\3=���G�Q�����\\x�>f�I��
��t8!�RRETTERUJ������̳�[Cm����+kJW<}�Ԡ�/�s�U�0��|�ZR�q�[KD]�����]۶;{����{�Rj��
�D\0����,jIDH�r�뎬y��#�GeIg�u�@��A �e)�WP������څ��S0�N��.� H�s�!��h\0Y���D� %)��()���ۦ]׍66�9HR���}D,�\"�4kꃃ��dct�	B5�>Ɣ?C��M-eY��RRE�����|&TBTE\0R��}@B��\\��}qʏ��IwT\\�.4Dt��P\0{�xv��7\'��2=�v���X�ogپCTFB$��������T��=�	A�
���5��R�������N��9\0Mӄ�ө�y�ITTUQc�L�@��G�6M4U�l�����\0 ���A	002�A@L�۵�L?p�S��W7�H��Gd5���B�Ut`٠\"+jR���j����*��t�GDglUUUUg7����,`2�t]GD1���ݴ��b��J�z�s;*�(� �IS,��A!�(� DR����\"�BB4�v�(����,4���q��>�!�<�}D\"��<�$��Q��y�̱C�y�6M��M۶!� ���������s���y�(��2� ���>�\"�P	��z��5\"Ǎ]��Vո��i%H�H	R��\'@\0$!`\\L7�%#��Lթ~���8�����0$�$@S2���F���,�D�9�Jo�I��5eQ2aD�$�$�B�)N#\0d�tA�3��ӡC%���I�&	��J*H�*�m	(;�z�.j@�L�Ĺm�*f�)Co(��y�^�~��(|(����(Si��i1�\0@Q��\0F�L5!��J���r�\\EAg��\"���3���cb�T�5\0kmJ)��3����f������E��4�-f��\'熛����V�T�z�fzk�
$%e��4�.?�z���ˣ��_�>r�7�M|��{T �e��A�-Tj4Dh�	��A�[v��%$Q��k$���-�����N\0�x<����/f9����(\"I��[pR@a��;@I4
$���(��O�r}����E4f+\'P�<#H�@(9�￨�P���H���G[�?�\\*y�7���,)E&�H�+(~V��RJD\"�p�\0PU�h4�����z�O���ׯ_�|���`oo������l���GԌ\"&T�<�*m���\"L�������ι��GT FER$���Z�\0���,�?2����O����
\"���)�a;�6���vV$J��Ȱ%kL�5��v�|s8��z�k���6GO�}�3*���K�.YI]�)%�@���ex�0�
@�m�ŭ��xsw��u
����}�����80�.�}���&��x5P�\\<��?�b��Ld��NC���c�S	!�����}�s�O�e
�S`��#f���żY���Q�.��;c��m�&�#\0��fg�e�$1Ƥ�e9�L��~/������v�Yc�0<�����4$TT�o�3(FD\0���^�s�jR��(�	�6�����{��}|�̝���d��ϣw��<�z�PY����w��9s��~����\0t�(�$!H���)$��%E�VR>��m�\"v1�C��y��Qc�s�;\"bk�.���\"$�佈��Z7����<��z�s��kO���!������,�h�5HIQ��M��F*D�,���\"�ք0E��5r����?����J6 �}���������+��W�T�dmU��$��&z�l�u�1�����\0]ץ������\"�ar�{πAe)���P&�W�t>;88�
����d�C�������G5��n��uz�;��X�ϼ��\'�K3�	�����c|룏!W �ȆL4.Xc�o�:f���pnY�[:��1�{MA<N�SD���9�f��E�^��~d���x<���c���O��<��������~a��ׯ�+�Ӻ��F��L�3eߺ2��H���4�E�~=�T������h6���g^�B��z��HV�F��tK�p�_e�f�lE�G���w�PA�M�7��ڮ�y��ر�s�>�ofoYb(
ׯ���g}�k����Y��4����B�����ѱS�����)n4�^9�@ �k2mO���:c�\0E��3��*�������$렶�xG~!\0PL��.��:Ra�_�
����Cj�s2���gMۅ����^�Ò���L��85�\"N��茄ҩu\0�U����ο���S\'�oQcYXF�U�\"�*%dR`P��jD�1ń�V0lIL1Ƙ�j�ZhEQ4����l��U�d~pp0���1�a��$���_�F#S�� 
��UP=�7@�U4B�ف$��n�>��ׇ�No;m�\'cd7���२��
S��Y��/��(@f-�-�q]O7c����ݳ)�@>���1���;}<|0�bB�r�][���\\YQ�T g+g�S�B�$2�����#
��
��Qc! \0��Q����O�����������)�$�!Ek-��pE��t]�
�)����	�2�1&V&�3���a�����UQ(�777�z�٨�I��ӵk׬��:ɣrD�����R�
C����(%\0�i>�g�fkmY�UU��h6�c��RY�Y�ԒM�ʲ�l�ˣ���^x��zI\0��\'n�y���$H���Z�Q@@ATI@��ד�n��a>�)��A������w���To�<��SϾp��i ��;@\'r�eU6A���)]��$\0:�ly4m�#O���k����z�����Ѽ�:VBX��X��q�/B�`\0��
��|�52�a\"f NH@��>TU\"��?�c?z����pe�RL֘�gO����_�9s���76F\0J�)�b>ITI�B �l�D�Κ�,��-��ʢ,�aBȆvR8��LȄ�B�0l���ڮk�n4�P��_x�K��+���!JLx��������F�ZM1�$CD�4q��c4�HȈ�J�I��,�0�:����l�3ݻ���%�a��I˥HLl�C� 7o��:k�ojД�6�X��pr[(�B&{�?��֚{���:�1�������1)DA�lR��U�H�6l�����+_�r�\\*d^%�?��aY	 �ABR��?���CW����?�j��I�Θg���?�So���ǎ���,�k��Yk۶���!�4g	^^�����z[wqJ�t�A�OF\"\"�����T��O!�
,�&f�Q.IE�f$sy�	$�뢘5t\04!2A\0�Z1�E�6�{&�+�$3|����+gK2��hH\"�I!
(
������$-��+:��b~|b�zU?��w��
T�z��Y���Cɠ�����[o�*�{瑃a4�=�f�/�l`�\0�43�3������_��?�����>��k�}����y=�;%B�
P(��b��R�7Gy�$J�����Ib�4+2b&6�DȨ�8��ڇl���+B&�$]�~��N	3%BV�Z��\'D�cn<.kτDbT-F$����n��S��W���^x�g����0�7����l�F4>4ͼ	]tA`��V3	閍|�a��Q�J��U�5%���Y�����B;?�߻�ͯ���o^<w���5Bd-WU��!�y�˲\\�HW�0�Co��VO$\"`����}��O|����XH̲�1&M�Hhm�J��C#K��+\"��	 &�����\\�̖
d%������F�%o;4B������h�����N?�}��p�=�b��FҢ&��g��<��
�h�h4쬵����/��S�1r�������җ������躚3���
P\"�..HHBY�<�?��~=Fs�����l�1Da���S����!��u��u�Ā�l�e�+�*\0��,SU�B�5�R��@f\"RH���qh,;6\0��4���ӫ�}��;�5��n�66M�ɏ�/\'R�(�\"���9��>5�����GP�q1P�R�dEY��$�kI�5B���mT�<޽��7���;o�����lg4����6]�xkc����ۀֲ�ʲ�*!&\"Z#�(�$]:�Eq��u\"����w������^������j/
)	bb�ʖ�)��;;;	0�.�T���n
���\"P�`P��l�k�5���3�<���_Cd2�\0���U\".d��Ĳf��Ɗ�#�6-��,s�1�\\�+2E��P4E_\'iDg��;,LR�˴�_�h�߯�)�F�ǎ;q�ı���-Q�(� \'\0�թ�6������D2~��}�-x�i�ż+��Z0?RP^�>�ʬL�\0$�����X���hdFEe?=��J��t����~�o�޸T����5VL��m5PS�#���ZN�+�b�@R
���>��N/˲������u3��jc0̛�|:�q������oOnm�l�����ٳ)��nF�э7��IB�Lh���iCB��ΉD�IA��(zeUXM�TF�N^�~��~��_�/�a\"�E��\0�{��k���䙳99e~T���������i�?o�1�nkk��.]�B:u�T���n��6,��OD��,\'��H�Hy�aE�H��)JD���m����>�ҧ��Wʙ�q��t}g8�Cb��@I)e-ˢ(�g�[�(��������Qd\0��E��Fí$�4]��UU��H��Ř�.+{�x?\\���[����7Ǔ���<��ƶ���ABE�$�\00��g���j:GUz��$`���cL������~Y�)j�d�����������������ͽ�p��7w+�B�Q%��J@���1�d��,a�\0\0�w�X:6�0Ė����`>�_|�Ef6Αȸ���4�-\\�P�(��*�A�q9��)D���j[����l77��s1Ƭq��燢vAY��
b�-�1�aFhH�rlɧy}�{�nVo�z����m�BSMuI��ͭ���!���Q����1.�Y1�P1*\0�D.�E��
*YH�֝@^�s����Ξ��{�����xTY��騲��ŕ����^����h
�#�H�q[Q=Uz׮];uꔪ���D�c�{���~�~�8��W���SǶ�����_�J�\"j��7I$�T���� �:��ذ!�	BJuב1����z���w��3 ,��ĉ�Fc�l�jͯJ1\"�^�����63Z�y<���\'�|rkk�m�ut��c����ĵ��:Qf�6D�����7��o��O?�����[Ũ�n}ㅈJg�pAb0�8�9FQ�˨z�<��T���\0�VĒ��%�	�:/�;�T�)���ͪ��~e���ի���^�۽>����~�A�PY.��0[t#Т\0�����ѡ]f.Oi׮]��g?��!c��c�jP���Ͼ���|�Q�/�2tMݶ������@RB`u�\"p���{\\��\0���+bu^bfb6֥��1}��Ϝ8s��՛�ϟ�I룀nmm}�L)٥��YGVܿE/�ў\0\0 \0IDATB��J+�rwww6�mooonn�)��,�^�w��%�B�����,��JƱ�޼�^�l���}����Ȗ��#W\"�d�~�����Xm̈́*G�Xѡ���w����6�=S�c�o�E|��FE�;�����\\�x�9�[j��c�bL�Q�l�:4���YƎ\0	�\0\0B� �G�Kk��q�F>��)��7��җ��?�ٟ��퍛��Ǯ���gh��7�mS��h
�Ac��V�A�v�sn�ƥۧ�z��SO>{r� �m۶����Ѡ�i:�����=�N��<zH�_���0;B$T-(��R��z��o������))l��I����ܿz}cs���a,uݼ��Bɱa@$$�<��@@���z��O�@3mt5p�ڵ�
���l�( ��-�TU\0�����Í���8��o|{0�z 6Ɣ�`T�\\�0)��.A�մ~.��E��߷�?~�,���w�M�Ӫ����}�%��񨉑�Y�D�\0�g
�Q�KQ��z��!�z|��_;�5�W��H�4))�\\$���[���q-(i�D��O��5�ğ:�=������}����Փ���
b=O]�whu��̉Aq�w�ZSVn�+�ļ��R;)o�;<H��摣��h۶ι�\'��I�]QH������o}�ud�~��SgN�Mw����c5����p @�V��*J�\"�5(`�&E�+�WC��.\"�c�\'��۽~�*�A��Wo�*Z�^EVA�����C�뺭����2]�Z��=R�8�} ������DI���b�T�0��k����t�̳O>��h�$��ד �+JQ�<tkFE����G�W[{��3�\0�s��
#��֦�?������S_W}��u�X�%D%�V5�CB�DQ\" s4Z�\")�~\0��<��R�B���۶ʹ��+G��7�~饟�[_�����7�I�l�[ۛ����i�f��+�j<��V,���`�5��ZE�)�|���͍����������\\�picck:�?��SEU�(���m�QUUJ+��E>^��]H���PD����z����.v��[\'�`4��|�*���-�1�A#$DEk�a�y���+W������O��sE�����T�K�7�QF�=K��`<�D���~�*��kR�ec�1W	֘Ҡ�p��7����\\�r�2d]D	�� `��@��P��e\0�)2�`��*]�p�(�ӧϔ�\"���En�+���|!W�5�4�ڶ1_������L&��dkk+�3ـ>�T7aX�^�������\'_���Q��dv����+a�ر����/^��X�K�f^~c�^*��w�p�^���k�����_��?��o�\'M���?��Ƕ��6��|�׍1>��N�!Ve.�V�~���O/Ύ�~~�� ]��� �ڡ)�CЫ��.rJJ�IѰY��PL^�)��e��޵�}���ү�ˠ<S	�,��\0n���b���\"��9j[_U�?�ͬ��,�A�b�����S!M�w�ڹ7���������+��C]�\\��`G\0#�\0�
q>#`&�-{W�&#���O��;;7oܼN�̘R�NU���f	�\\��V���r��6�L��d��|�UuZw
�`6�����?�R�I��F���w��M`z�ŗ��!\"2*�\0%@F\"�A�o�
�K�vv����;�CH����(Av��{�^�=�^�bc$��FI���H�+GU�������˗�^y�޿��u�m�h9I�I\"h0Ȁ�@@���oK]%OB�%��*ˉ������w��� ŢW�\'�缵J0�Up~B�S�+wDs]M�Gk��\0�3m>��WO�yj��������W\'Ϝ��۹z����c]�+�r�2#�M
c�L��\"�����M����[�T˲6
Sd^jW���������&#�!�xd��7�V��j:T�,p�[})��q BYH@0Ȳ[��ф �p��J��|�;�|�O�Z\"�V�=���C��ݞ���du��o��cL�R:�(����XK)���߿z���k�_��� ł�F	�am�V���\"�\0�R� _��5ϳ���gH%UU?��mlgS�N�m�^�(�\\�����y�x��-|g⭺au������\'�.��������;����g>�����?�/��_�\'B����/<}��K��Y���y]/z�
hr\'X�Y�4�\0�~o:y�g~����;�)��߿~�������OV���_�p�叿��w��w��>=�U3a)V�t�C�a\0�Ae�O��C	5ϙ���jaC	 zn��s��K��~�	�?�S��Bp{�o�Av�ժ��Z�еS/mߑsj�_��[7/߸z~�wR�c�Z_7`�_�u�蹮�`�:����DV�Z���퍶m��q���%<��r�̅Ѫ��s+�ǧ�x�b�h�G�H{��o���������z���?�?�K��w�_���Ͻ�+�/�M;��f�/,��b���P�����\\TqU�_�⩳����w�-�!�Ec�.�SU�W��Ս���Y�����ޛ�H�%�af�=���ʬ���k�{R3;r8�+��V+��r�$%$���Q�\0Q�jAIb\\��j0�==3��gUו��_��s���#2�W(`�DVVV�����}��$~��#B?���Vķ��Bs��)p�J���Q�0W��k��q��j�w4�_�����Ū4i�A���Z��X�WUVg	����$�������}��_��`�({:e����]E�ͫJc�(�#���ڦɏ��(z\0R�5
�\0Q+�,˪�@�D��N&#KČR3Iį뺪*�|�����N���YUUY�!��V(�y^<{�|�ə����j��������������������U6��+�(IР\"R�
4\0DIT�6��(�����w�������K�Z�utz�Ϋ����Z��v��O���ݻy�1�B�^�p��_�.��_J����f2+���GP����r�����C���H����O#@�q�eE&޻�f?^�VT��U�(������������6������u��\\g�I�G蔎�8ր�&E\\����n����>)(�dج)�1I��v�D	ն��M&�Nl�iJi�%������}��3��D��#�aƘ�X,�$���յK�4I2b<{u��~�?.�����Tl7��A�b�R�lV�rs�r9� ��ZGJ;�������-���_�\'�ȘHEG��*wq��������5�1�Ze�i��e������*�c%WX\"����4[@�F
�p�Q�lI����]��ȦIV٢ryYp]�Yv���09�Ho�J(N��S��\'x��|�L\"G����|�/����bQ�jk!��f*�d�E1GuD�JKڐRJa�L�ʬN�C&�,G������n�8N\"-�5¯2Z�q�@V�\"���I�+Q�����Z��|�̌Zki���7Fz��ߺX,�������?�O~����_��?��?K��h���ō�26�6p���H�������;������q�$�A���}�kU]0;��rq��ŋ�8��8���JM<h�u�!�}8����5*�����f��@�:�w;��a4:�\\�%�v�������G��W9*�\\3G�B{W�6�ï�
��\0J��i��2���QA��[���O~��?��fq6�nlH�x��@�2H�c!&������F��p�*Gf����lY�6��Ȅ�D�%\"�����zY�lZk)`Q1��n��(��O�?99=::6�X��u�>��\'�(MSAiK,�O>~�k��OO�|���ϟ������q��w��/�bu��ݓ;�٫H��d�1����靻����u^d���������z���x|KG����_�8;�uT�J�tt�.W�_��&Y�ʘd���<B	���\"3����^�6y^��K�BY[ߺ5-�[�ch%N�_��Q�LC{ b�T&P���(6�TY�e����6�UǓ.�f@�^�9::/c�l�@s�̤��,x���\0�l!���jB��lO�`�1͞~~��GƮ�d�ĺ�H\"P@��H!���$՘�Уt��?���
��������u�\"!3;\"��?�lq�B�mb��6��Q�M���ls1�Ԏ}5s�{a�y!�*�TzS�|��^c�g�}&M&�e�&M��tzz��d2�󼪪���z�^\\�On�:::�l6?�����=�������������I��uq:Y�/��`v&6�Y��y~r�t���G�:Ig��Ogn�d?��O�ݻ\'�9��׈����Dw��D��<���m�ǁp�s���8���-�Ƨ_~�w�Bt�
e��EIڰ�τ��s࿶��Y��,��œ��v>2�\\T�6�+����;Q��ċ�S���C�dy��頃����Ak�����ryzz*�_�L��F����4M�;[�f��lFl��ҋ???���7�����=����X�\'\'����f�H\'���D���÷_�K����<�a(3s�̎��ѿ���/..NOO�,���q<h@7\"��A�ۨ�o(\'?�|l׍�zeG@�����-1����@Ȼ��k~�����*3\0�B
�����?z�������\'#�@NG
k��h�ݾ��w��t��W���r�����oW@Ea��\'?��N�Y�{���dT����%���h�Fw�(��	A;��Lι*w�FE#DP��X���%��+��N8��������
�؀fWV9�1�0�����mt� `\'��I�v������~�,9���v{tt�d����Ѩ�ff�F��2I#\0X/Wy�GQt|�t]ׯ�ۢ.���������H3jm��^o�}�kۼ\\n��*�\'I��z�mȠb@Z�|p��])ݤV�U���aW*��y6u]����d4$<�/��lR��*4�*c3���t|����(	���_力G��7R[����̄@��19���rY�i��\\�yEQ��6ڂ��]{)w���԰7B�ot�i�\\.š�p�h4�F\0 ��(B�u�ew��y��w����9M����m��bS\\������������dr�v͐���ҏ��FQ��������;�4�&>���gϞ�9H���s�2�c}m�X�4o�c-9���c���&��U*�R�(��n\\��XiD-*S���h�dZ�߿����[��mY��Y�ؘ�h��T����9���|.?xl6!�I�����Ѿn���W��*���?�s���ɓ\'Q�H���IEy��y-c��6F�у<xptt�$I�e��?Mn-W�O�x�~��+���ɤ&��O�ݻu|���������-)�|�\\N�Ν;�U�����۷oK�W�!$x#��=~pTramO���l6�N�����/�:�_��h��֡�h&g[�r�|��RMOK���z�%��?���g�W�l)�J����Œ^oI�W�}�FZ+\"k sYl///�k��	�ٟ(�*��.kx�����=���#ˍ���9�sn�\\J�?��4M\'�ɮy���2�(��q����79�W�2��ź�����Ȓ��x4���:tX?���˚]}�AO�ϩ��_���w�웎�֌D���`������_#��Vd���q�C׌�@���\0�2��v}y1#`�%iA+VHؒaPyp�-�iI�d�c�&�!���1\"P���[�NNN���)\"F���H�2I��qU=J��DZ������}�{��O�J���~P:��F���x�&ZwmTXD$CW�{ʠA�S;ʍ�D�ß�=�Þ;�@fv@B���`�ѯ~��Bg��9&��A��OB����1a&[Y���Jp�
�C��!�}#%ܵ����.s��͓En��]M��Q�e�eggg��f�XdYvrr2�N7�V�=�n��Ѻ5rVeq��I�l�h4�Xl��������|>�޷�<x���M�Y��6� ��������E�/�x�A��i��<M���@}pg�ӟġï�PIn�,�nǬ\0�\" �`�z��sŕ�AT�fo�I��n<�O��[8Wk��VLd<#���k��&P��ז�q�g��<��ڨ���C�B�y>�������v��s��d2�c��U�(�
9��Pћj���4�{{trtrrr�}�o���_�C��������*/�֓Q�)$��9��\"\'|vv&\0B�d
Aj�|�1��P�)��ˍ�~?���-�2���l��ѣ8�%2I�m�3e�J5H�5�.b^_η��b����r[�����N��<J��t��q�1��J����x\\��fo�����v�����Z�ԇ�:���T��Z�]�_����z]W�R��b��G2h�--\0@��Smb�X#�DX��U�ͣ�
pP�N�������~jr�B��Ǡ8���(��<��j�xpw���\\-�RW��JjP����G�R�.�㳳Y��g�ο�om�+zF����QT\0H,�cMp\0�Ǳ�dVJ�޾jﶜ9\"vV�w~���$�j�~��$�fWPufB�?\0�@������T.THN���)�\0r(ˆ�bS��H�I�Uv���_���,ڪ��Z!+`\"r�n�1���]�43�M(uҬ>�	��;Z\"�ȹsN�y�y\\�G�)�鑵�U[rL���������V��eU�$�e��DoK�L�V�ZWW[��+{u�JkD����p|r����l��<�{z|��Y���[�(5Y�$F@USU��D@6M\"4e���=}��Ⱥؘ:/�Y�ATd(�Y��4(��An$3D���$�UR�WU��l=z$U�k��o���`�8V-���W� ϋ�(���|��k�\"�$�U@P�\\318��i��\'�o���O���e��z�!�@��N\\�LȠ	�,:g�.+���b�v��i*c���]l��FY�����yOI!r�цF�R\"�yy1�\"\0��Ȱ@�D;�J�3\0�TdX0���$�NRK�Ҋ�X\'q� c�u�evȠ(@k�����W����^ïS��-c�o���%�ADȲ�Q�6+�Qu�1.U�:�I��Vy+N𛝶�9��|(�H��Jcm�gy�\0\0 \0IDATKWW����˧�GY�/ �(��/��<a>��
��v����I��ٳgm��}�ѩ.�:u�h4F17���pt4:::*c�x<βLk�\0��H;�V��
]-��큫B3d�6*��gϞ	��j��m�>:�j-���D*E�h4ʲT)$jjy�Al�o	�c/��`od����Wk�_8�uԟ��z��,�7�81q���/��+��Ux2�����tËv�2���D?���F����w�oTk\"p}I�F��Bč��ޝ�qˋ���/�E���a�>�~��I�1�g���,E�/I� �O6=t!�i���j��N����JU{(�{���
�<��h�W3Ss����y��0�v�(T�*�\"�X^�gu�=AC�?�a?�aI1����+W��(����U���~U�]�s?h:�G�(�~t�����*��eY�|�R���DC3��R/�\"�D�V�����*�P�GB����!~��X��Տz�TE�$�n��oe�F���.�g��]���Q��ɟ��E��H��:����r:�\"tȵO2�GD.���:��.{�1h�>�����Kc�Bo�7��M����*�l6J)�Qh���v��0I�e���5���j����5�_�<N�ﯮUJE!�->�d&�fc�TU��ʝ-�X�^=3\\)�e���s�+T�\0Bdg�8қ��d:bW*tC��x�W����G#n���o:/���p�����ͦm]U�1F~����
�F��h\'%I�\\}�T\\W�x)��@��q_\\\\x�������k56�N��,AP,>��,˜s����O?��M��Q�	�4�J�*��/��l6q���$�}*, �\0�֒d�h-$	|����4�s�B��q?��};���UK�VU�sNVݭV+y|��}���<-������IA&p�b�hh��-�<ϹI}Tg\"�Fi�)>>��g�3��5���4��ӵe��;k4�
ٖ�&�\\-�v����m�+��+tp�0�{W�g|�M��>�D�����yR���[�����������Ә΍ڳ��i���ۣ%���>~��_��d�����l
���^Y�cS#�ӊ\"������%��^?*k�\0\\�(�s
P#\0;\\3U��Yێ��]�*��ĽE�-�V�e�M�R���������m�wx�j�W;���\'����@�����
\0^�x��x��h�^�?Ԑ6*v?��
��y�Mvf�c)i}]��G�͑��KD�Eٲ������;l�f?��
H)\0`��*La���tć�=��=�s2>8����s��x��OD/^�~ЏB ���B��1\0qT��ۨ�~+��с>v0\"�����h��~T�c2����}�D�iU\0p�v� ��@LV�K��8q�Ӣ�4-I:�_4
���U�/�ө�#��G���K������W+�j�^
|qli��x��䚾Th(�{w5��ڢ�G�+�x����󹯝�O?��g�aoE��0��n��Kn�R��i*؎���\\�Ћ���Y�.��Q��mU���o��HZ��3�v�jfmP3YŅRQ�Cev]��D����]����í�o�����|M�����%\0�xܢ|ޒ���;-��Ll#t,�c�����2�F��o ���w����0�\'G~=<
3�b�����D�
ؓ�B-��M�>�ak���\"ll���-��C+7��F��y1S
�꺮EM��k῎�cɵ��O�.��O��E�@F#����J��*q��Nq���4�>����g�t�{�������輜�`_x��� ���t���[�b����<���s��:T��Ӷ�!�-������lk�l6�t4 :fBT?*�
jޓR�\0�C��U~���i�q7�4*�c����Z�%B7� �Ǐ������7�X�e�^���4O�<��Z�����J\\󣪢j&�Zا�Qr�	�t#�ө��6z����A��F?�C���D~EQ�$����΢�aU����O�
	ȁ�
Ib;*�2
���� EUW\"yg��\0I���ϭ��s�3�駈�Z�|���p	�X�܄(�-l<_\\\\�H��EQ����f��l��|�����F0��r)?��w<K��W��\\.A+`%�f��D��ι�vRX�B+��ܖ��ݿ����\0Z�i�Ե�A�4X&�L.I�U�پ֐.5:դ�^R�LhjB /��#;!�-�C=�	=��� sǛ~���d�b֒=�V��j�w������?�̻W!]��z-����
��q��@=��,Db����Qs4<�\'��\\­��|SZB��*���Y�\"n6��j�Z����v���k�:<>>���(�5���UHe�l���� W5m��6��ef�l]���b��B��(V�\0@�l�ܝvÐ��3[����J�j�Yx��>U��&��^
_�ys��	O���җ_~�ۿ�ۃ��C�Z{�
�Y(�������M
,�F�H|]!X�������+�)��B<��Onڟ��?����<\'?�+:��ǒ�	���O?�C
��{�����i��G�r��7�%@$w��X?�+�G�Mwf����e�8���#��w��.A�ONo?|x?��t,ϡ\'�J��h�\"P�5�j�^
�N#��N�$A�RM���%�E�
Icwx�q�9a�!��j�#�g��۹o��\\
1j� �,+\0W[a72+\0��eU�AW�%` N��#��s.˲8�E�`�M�����O q���iUU����/�|�o~c�*@+[�:���X&%�*�X�%��\"?9��� N��`m��G#��:��*C�EY/We��L]�
�ګ���WU�����E��Zd��13*&�9�*TQf�l6�Z�F�����R񓓓�xE����ZG�����r�\\��JcÎX!�F�&��]�R��dFk[i�l]��x�Ya4q�\0�(B &p�D ��i\0�\"[9��Ef��L?ywr��^ڜ��pJ����*�f����R숙c3}�

�������Wޅˆ,��FCI�oB#���gRa���0���<�#e�|?��ө,��*Y��Ç%�/�,K���X�����`me�Ȣ1���\0	���\0Q\"\"�{�Q#JC(�L��H��aHxQ�uA�<Ǣ	7��N���z<�II���*;�B;<|�|y
>C%\"c�N���o���16����Jű٬s�@HD�����W;�w��V���d��ZY����~�sWw��9�Q���k�]s��&��ǏKE<�/�;
�\\Q&i[+�����3�+��L��h���3-d��Y�0�O}r��/�o߾}||����Ņ��F��|�Z������i�j�E*P`?Du��He��CD�\"\"	R)�@F`����R��$\"R]��
�З���v����=`�C~C?؅~tP|f���τ��[)a}ֹ!+����\'G�1�J6���/..���7���0۩�ZV!z�籧���6x���^��sgW��f������䭷���������y�����z�Y�r�~�_�V
��i�f�U�`M���QC)��6�~+vl�qTc��v��ޏ��(��$�������T���;Hx�@;����Q/U������G8܏>y򤪪,�B�W�\0��ʲ�4ͮ:��@%��-��G;�H��~n=|�}?jg�q�m�_(9(V+����R��\0�Ço߾���f���f��\\�k�T�$2�(I��h=�ቋSW-�.���h�������6o��+;���n�kT2Q�O��\0��� A���~��A�S{���$\'�e�D���֢�������}I�0}g��,��M(�6��������Z;��a�L&\'\'\'���������r)�� ��X�1Z�,Ņ�I�����i����`���a�9��Ām�Z)DwᏢ3�mEfD B��<@y��N&��b|W�����i�ȕ\\�V�UZ7FᮺF�i;+
��K!�rY�#�\'7|Qr������($�UUM&J�w��.��2�Ю�\"iH��]|��ξ�9f��r�su�$!��(B�8�yE�$��%��-�r��Dn��>��	���������ҙ�����_K�=X�Z����EoHF���t�W����j?������Ň~���H�S/.��ƣ�ι����������eY�����>=�[w���ȊQ�F�H\\���w���t��x�V�O(>]��U�[����{jDY����;??\'*��,���֮�@O�
wJ� �S�2\\TE�*��;�!M�FGM��h�3\\�\"㫁1lEʵ]\\\\x���܉�A�3?�8�:���#t�˛�=�ʜ��p\0����o�
�r01��_��F�à�����f#t�k�6�8���!��$�v��ry>����O���C�+IF�1Lu�T׾���=y�Կ�\0�
TREJk
��t�?�s�,�>��ug:p�~�î�zV�_=�RT�$I��X���$I�,��fa]��0���ُI�˲,��2/A
�v
��#�����x���u][�Q33\0���!f!ت��\'�#�h幔s�C������S�n�}�8�����$�����g��$ϫ8�\"�o/�f3��.���:���
k����c�}�^�^bH��b��;�:l>��b���)�<I�f$/�$Ix������L��5��8��YAX3
��f�9;;{뭷<X6X�K��u�^myQ(����m�l���Mk�N0�L��<�)q�����e��N�
��}���P`�g�Q���-_^4��B|�1���!(�Fs�֡2`�(�[?4��\0\0�IDAT�P�3���$%�����߮��իW�q�29$C�&�?uj�O�e�t]�	�2�Bk�b�{�Tya�0�bF��:�� l�q�>�u�i��3 jf�Q�Fq{�ܪʹ�ݡ�������~�8��$YY�eY�8����$�~��k���������t��J1-�<�^�3*��8f��Q8�
��Y�WEa9N[l���SueKԀ�b�Ė�r�\'iF�a;Nh�ݞ�e���.^�k�oݺ�e�r���H@�o{b!�ݙ�	�>�_�q��s.�K�̋8Mؑ� �~Trm�)�G�F�4ܚL?�������[,q�8)��SWU�,YG�<�e]�k�z,Մظ
�7rfbEQl���+��(ʪ.���F�����1��ө�k�c�*h�P%���қ�F<���ONNn߾MD��zp���n�+���z��)�1�e������AQ�!f��55�2�\0Y#���A��\0����#�Y�HS<����;�{��;W.�U%3`G`T�VLDү�\0�8���N�&9������\05��#�xE��v.7:ξ�����B��$`���1����u�sN��:��sX5��w��i��gIi�\0��F�R*N��8��y�捀�MK>���$�u2�*�/�y����t�}g�����H	 �,ER�M|��&�c�յ&�Қ�.�R�ks����_y�:S
}ix��i�����������>\\�<�@��2\"y.�D����P>B\\
׫�d��������a�R9�@�˥,/9-���$!�<d�5tS35#	&ܞ(y[��nC��#@��1�\"׌���/C
=�J�t�N�Jze2@(\0og�h#G���!a��y<��Jv������ٳg��r:�6�%��5n��nk�����@��9_�ڲs֧LH�W?g�wx���h4���v����b�g�2�)�ԙ���c�����çE^d�X&���֣���iH�ж֛\\�2�dw��$~��l�(��+��A�3�`��L�+_2��!�vٞ!w�o�
U���XO�E�mTΪY�g�P���|���f�=\"\"h�ٖ󯮩�Q���[�~�s�Z
������{%/\0!��|>�;)���RI�GZE�G���\0���t[+�,[�D\0�BQlÆ�,,y�����u5��M�<tꋻ��c&�`��:�.|H���;a��$�N�|�~cF@J��#C�b\\2�=0;��r�b�M��:Q�!�vK��>�?z�H<�\'�_�����܄��M\\�d��}Ey���Ƭ����*o�2n/�����\"�]j�4M�j��RF��P]���Dl��P�n�\"j�$�kx+���w���4�F��C �������՝�e(��j߸r���ɨ�Sǯ_�ntD�È�S#o��\\��&�#j\"v��n�ݏ%��T�j�X,�/��D�*F�N�!��Ze���+�p��#h�Ɋ���h����X*��韊��\'��8����el��\\�b�_s>�jq�\0\0\0\0\0IEND�B`�","Male","ICT","0674523210");
INSERT INTO employee VALUES("KICTC-STA-0006-2020","OCTAVIAN ","S","WILLIUM","mboya6@gmail.com","�PNG

\0\0\0
�!&;V��lY|��X��R���O�Vc�;6��o�U�5������Vh�x>i����ӏ�ğ�нJ�|�5W�˔�C��O>E@��ɣ�&��ϟ�(���7͍~~.1s���(�@G>���Sk����\"�L�D�J ��Y
�\"rN�����{��&j[l�|t/B*CM���ߍs䐊�Ul�6�<ں9�<��ѷ�����`T[�Yh{XOm�S��\"��r<�ɅkH9ΐxxq܀�:�
~���V7\"OiG��̴��+9����+�5w�@���֋�σ;�S&�w>�I����e%2�1�0[��z?�g���0l��3���0���m�rB�\0zu��dc�� �B:N���B��<����z\0TH70`F�.5\\\01ܱ��8H��պ��c�A8�@[k{rE�Hx��T�����������n�|MK�@M����4�s�Sg�{���{�S#�+=&7ff�p���#��-33Z9T�o�*�I� �.����.�Ԓ5�ؒ�g�B`3�u�� �$���
g�ϥ*�j�j�T�hZϮ��wL/��Ơ ����{��K��QsT}�\\,s^��8���jO����3�QX6��
���̴q����%b�9� ��b;_c&���2`��@��
�
�����poK���0�GIB+��?#�+��#i������q�e�����[��)yJnMЄ�I�|Nq�����ד�uPQ�1]�$t�*�w�5j� �SH����1Gh�9d�m���F%�1)̷�w.�#�N���\"�E�N�;�E�����3�A�:T�T�nPE\"Iv\'0�/x�S�PfL\"�
)޸���H�3H%r����7�!�7=|e:�Z��.�R�=��S���0��\'ӥաƳ�A�0E��i�
�p�4���$A���<�;�����\0��w�{�Q�\0	�)��/��Z��T68͌zr$�M[�F\\)g�&�NFN2x\\I���IK�6�_�����|��.�p}.�O�}�X�lĳ{\0��uv�m2��j}�\'_gJNܹ+<�W�{�(1�|y�Ps��K�4�\\#�@g�H�r��\04�e�!n�/j�!�y�V��`{�B���P�N̿|�Q\"��!P:���g`��E�]���\0.��oQ+}��rv��8x����p���/3� �mD�&@Nmh����>HXN��&J�{��ݥ�\0m�1�߲�8��Cb@�V2&.���\"�	�з^�Pu�����^�����̈$\0�I�H�4.\0������PNr�
J�S3��\0`��.i�[م�R���5�*�2a�j�a$��kw�(�:� 	�&�	U3ll�tY��עi��힄lRmM!��8�jZ U^��j�����+���G]��`X��V��2��L��zAD��#��?4?r����͈\0̐X��ơ\0l]~�ۘQ~��k�n\\7\0��&��\\>p3{�Sh�	�0{����LH��8@���	ӛ(`zF�8{Y���Q�)O�<>9���~�R�]�*|�k
�r�er�ˤ��|�)�9̹������МgJ�E���̒�6�v�\">#�jQ�j0�������gXRSO��Kia�ZJ\\x��b]A�M�D
Bp�W�uǤ��U��蠙�[�0����І9`�\"��%��J/�]lVyKP9�ԍm>_L.R��)�(��ΡT��nnlG�R͈
����P��wy�b��#�;,�Ɖc�&0�և:%��r����(P��0$�E��
ՙ����{
��I��\0e�d �ʙ���DRuLXD@�c��U���d8�4�-$x\\z�<��HF�
O+��
�{&���W��i;	uuR�Dj uJ���8�������L
=�OG����\0sI���BY0n���L��xt��4:�V@�(���F/�%�?��R�^6���_����=��<^`ãL��DsS�ip���֘���ZG���e�I^�̖��ŠS*�-�O�o)î��@�e~SkN���
�D~��={��D2Q�z�2���bt���ҷI5�j�-G��nKP62�h[��~`L��<ZTQW�@�����x�� ?v#�Z^
�h5q5��K��{�=*�Zo-|a��t��6!�ZW�W&ͨ 
C�!���
���ea:��so���Ԛ���5��z�H/-�x/[�ȀS�K�1f����0@��n����.�AM��;�;ر�J�b�o�
ޙ�B��������(�Q�kGp���\"���+&�\"�ZPS{�q�zV����6z
�I+Z���5h�\0��e�zj�2
a�Pw��j�n�MJx7����O���C/��0\\�1���g�F�[��5S����P������L����A��\"�jf��|�ļ`��
��Ҡ����jl���U$��2J�!ԠE���:�������u^\\xо7��r�j#Z�Ȏ��jU���*�3&� /xԠ��v��=�-a8l~$�.��b�Q�&(>[�Z�dÒ���X�l�m��PdJ��8]��i�{�)\"��v�C��8���c��w�*�Ys\\�R�I��q����	&�.5^��Te����8�a@�򜰷�)LR�|9�5��n�U�j�\'2Ƶ��m҄�����/ #w�򁳨sa�F�W���S{x����X\\�tX��Zkxo��P��O07\0�`����y�jt�P��j]!�?��\'�Ԃ�T�v�����*��hb�\\ ��U�Ɖd�B��h�-0�nh@���]E��ܸ=~�%�K[��uM��\'y�kP;XO4ƍ��5�|E�2˔IUgD�6 R�j{�!���%L�֔;��JQ�2�)�u-��`��:݀��^��-`a��,8��o����=$+��4u7���mdچ>�C�<�WK�\"��~M���,��s8��R�p��K�7�i�\'+!�M���v)�� \0)1L�+�D��R�/�E�x�ԁ�����R\0�x{��6�*܃l�D��7\0���Z�%.��z�Ѧ�G`>9���P���r�i�<U��CWB���i�%�5��`��8LA�j���v���g���-u��HbE�Z�ܡ+�$9���.Z1A�Qg��㦙�n-�lm(P�9�s�
��};&bh}KM
$WR[W�����ĝ�{f�1��j�@Am����\'�b���!s(WG\"*�K���N;-�c�j�2Zo�ώ\\y�q˃�$�T��x���I�Q�G/ۡ�e�=\":
�N$эq�3N�����:և�bv�3Ҥ��\\�~�I�FD��uH�0��Q���uX����]%����{)%��4�2��=ڨ�$�*�6LFm�%Ot-r��^����*ٯ^_��L�����@�&�g��{;Zi�4�^Z��c0:ф�����Y_VmD���p�
��\\N۸�^}�U��D��j�Zu\\F�}	�_Jk+���>9ZG�j�aYA5����uJdU��A{εi(Tn�qb�<���J�js�3θu�O���sqy\\���BK���ڨr!~�
�hu�Ij��[9��f�Ȋ���I��g�o�:��x�u��YҞ(��{�r��Vf���I\\Hm����yD6�\07s�@6i�Hgj��J+*�,���ᭃw崡���{���rOV��������sk5x��I�̐���ԃ4)���F�hmhZ{N8O���h>Ҹ��:li��N������6J�i�	[
q��Z��]��wbʂ�zАQ��i?s[�8�	=��Pj�a!a3.+�\0���Iז@�C�Hۻ��s՘�R��uT�1_��>�-u�	q?�\"���E�nt<nqX�d7�~�V�\0�-q��&�.i��y4 ��k��K���N�s�\"�����6�P.�ǆ�ܐ�\".1�BFF�Д$�@C�@�e@N�n��-f.�6��\\
n��8����=<O�0SE�8-¿������L��C�	=��_ڧ
՘nLi���y�^�he�C�9t�jT用]ꧯ�����g|�Zb�v,������B�:m�����nV�c��Z��9	ޚZ�8����d�s����u߷^���J`��y���M�\"��!jĂR��mLZ����6T�lVӑ��*h*��ƻ��S*dv�F�ͧ+N�C�EG�N音>N;�A�o�QI�X!���/l^R����H	�}�$$xr~���M[Ρq�5�u��J�tӎg@�뼙��0T}�tv꼮9;�w�f5�V;��G/y,ܖ�2����[Ơdd�8\0�>In�y�ْ+2e���]g��ֹ|�e��X�	4g\0j����#ň������xq�>u0�ە�=#꫗�2ޘ��;�%P�Hg�V��Q�K�h�6�k�:�ME�xy��O��9E�H�c(���m�57
�K��:� ��gd�@�	�ko\"1p\":ڦ�-O��/�ߣ�@S��C{rFrh�0u:��5���4W��]�m񭡫��Q0��FAh�k�x�9DI]���Ћ��}u��j� U��C�HMg8�z�<�j����T�胶^�5
n���t�x�i[�=@_��\\
�Vh���Ф!Iqq\\�,V\\�uup�\'G\'E)��\"���q�=�����
Sͮq@�,#�L�ܪ|E�0�>����(��Y_��Iu�Y�}V��7��g�nX��ӛ��y�8�J�B|N<f���.��ƹ谟gF�Lz�8J,;X�`V2T�)☢j��Ϻ�p��Vj�uO��p^[Y�:�!$��%� ��2*��]#�D���A�/�K&W��B�������l��䄛N\0�/��1w�fݶ��m�y��+���6��O��m-vD����&��;���.�#h�����)���5wn�s�>\0�U�88F������ι��Ӛ�C�r�?\"?\0\0[iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:a539dd06-d4f6-40e5-94ba-fd142c59cd3a\"
   xmpMM:InstanceID=\"xmp.iid:910a28f3-2ba3-42a2-9584-442fb6c9c9e0\"
   xmpMM:OriginalDocumentID=\"xmp.did:a43cb579-86dd-4221-9f15-905f25cad56f\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1602734867713151\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:b6d09dde-e8f3-4db5-b08b-cac61c639d21\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:74d283b4-f205-4d43-a00a-a0db9f69fea7\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?>��\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�
/�K��\0\0 \0IDATx��ْ$Yr%vT�f�Kl�VUfuUu7f��A!GB��6��;�!92PH!0C�h��ꪮ���%_��ޫ��fn���Y��)���fj�=z�n����W>����/9&���:�����^�ӿz�W��_��1����Cy=�����!\0h�p(\0;(˕R���\0(�?�� �`��b�KU�Dd��\"BD�].=)_����3=Q�=���c��&v��>zxs���W����h����zї2ͯ�)��C��T�LM\06{&@h��b�j��\0����*ߣK�F���?��j�S3���U�� \"�=�Y\\������
���̃�S��cܧ!����5�>8}��6ږs�p����?P�6�fc=k��-��tj��dZ�\0����k�]uu�8�ra�Z#��c����b��2���Kf�\0�k3Q\"��9{�<��4Z��ǲ���^6z�K\"{S�� �5��ot*޶4���Ƌ�������R���\\�\'�\\Fk�rH���/ �[���WFо�X����ݏ~�8O����+�D	\0�&�Z\0�rTұ�/\0tjP�%�1��ҡ~{����������k#]�W�8\"\"�����m����7_P�wb*ay�n�C�K�E(�L�@ŝ;�.��!u�i�ץ�$\0T���)
(+��+M��\0�C4W�������w�?�Ve-S��?��y�h�&�c���D��+�@�4Z����PU��N�ܾ�N�25\'��A��ۜz��ij�H��J�c(\'\"V�i3�2$\0���^��d䗀����-�B��>�������	VO4�¤�����h�:��GSJ�w�\\\"��$�;�1�쀪�Y�\\���%��w��yK7u���Ə~yG{����~���4�e,�TM�0�Ԝ��(�E��A`�B\0x$��\0rJdD�6E������A�\'ү�E�c��a��oU���X���	���+V \04Ǭ�ӔEH�xfP��)9�\\@�\0��(Y\"+Dj~��̜��ެ��z<��~�������K���ϖ�Ҕ/�C\"A;�ﺚ��49�$UFv�,�t�;D\0�Z���H9IU$\0�[gv���>\0���\\\0Є:ÙO��KZH����Sx;Y�G��x��\0p܁7�B���R�kz�t5ʩ��
���.g�_K\0�2!���}�읾�������d������X�.4+�@L*v��r@�D�A��Sr
�k��=\04�*�Y�\0�?K�S���y�\0H{�	�Gs��h@N���������I �\0�k*\0�+�Q
M(/*���y��x�]H\0&O�=�I֭$ ���@�T�����D
�&La��!C|�Iv\'vb�o-��}�e�w:�.f
�tS�|\0 �B�\0*/5\"�*��?�WO\0����ų��\0�<\\$�\0(�>w�=\0�X\\�Q�n��K7T����R�{�2�<��@�F�RT1��	;bst���5% ��\0�k�N�-x�p�9\0���\0��R�v�Ѩ����
�X�@`B�$\0����ڊl��>��V�\04o) D
3˶	(�=,<D�O�\\9�<���\0ztS��<n�����<(|�Qn�{N�e�$-�D8D��5���ڝ��O��9��\0RU��
�^\0 W��c�\0��&5�#R�P�chO�	��0/�:�yY.�}�%�GBʜ�6�*g�爼��\0�>C�,��\0\\��@�ML]��\0Z&W�A���D�J,�+��Lki�2��JRPH΅E�:�Z�Ɗ� Y��>�؁�8��\0�\'&o9�jVde��C\0Y�jSY�.
m���o
��6x�*+c�\02���7��=��&���va�J&7��$>�v���p�J
*��EvV��/[�]O��qI(Gc��4
��jfޛ�Κ
b�gV�R@ӬȆ�qS99��\\�XY��KK\0]��s2�\0��e��̝�*W@��Q�i�v�D����$�,��h�%\0�Zt�{̝[\0p~��\0���|�6:��~Ypi@>�\0ґ�<D~��y8����P� ]����s�5��%^�L@�.,*\0����<,*`Q��r���l�]�Q�k�U`���n��Rl�U0U5�fO{v��=_m��<���`��ڶ�c�\0��M���9W5�\0���n���䘜J/\\�(�x4R�.e\0��#H�E��\0�rU�����I�\02��s��[d�t\0����\'������h ^�c�����/��^~k�D+�#b��#@=�`��,��M*;Rׯ�eU8���Y��@w�I<p���yS�E���.Ѽ
P��-��\'u������ѭ��b^��[��X,F���qҮx�ABT�-s�Ԕ���`�����鸩c|��Zp}���\"[�B�kЋ&�D�?���.6�����+MaV�d�sODA�Wo���<�������Ob}\0��R�5��Y\0T�.�Pd뾍���4r��v�`l�]��ⷄ�_�.�)TF��$e�K�$\0TUeh\"R���/\0p����\0���i@r�`d�NeV1����8�Ϗ��eS�쇕.F�v��(\'��u&�ʼ��L*4U��ݕۙ���8>q
%�%�����4yq\0hT��\0~��{��=�ΰ0x�*	�>�m��<���2Re���h�r���\0��l�F�Ǒ����2h�q?��Jej�E���͜L��_���n7�ӗJH��mc��p7;ժf�@����Yھ\0�����#A��w��$F\09�����۷\0|��G�\0̫P0�I�� \"���C\'�G�B����Xw^uL�^�z~�
�A]��X�\0�l�CՊ9xX5��mٓ��ն�I)�&\0{e0�\"*�(!X�����U3\0�5QȮ���?K
�������o
V��p��)�5{j^=ThS�IHc�&PS��L���Rjf&�zwofP��JDo$��|��YQ�+B@�!BZ\0A6�6\0<�<�ښ���ҽġ������%Qܸ�|�h�t\0���kN���^�.���D;�|����\0n�1J]̚��\"o6���}p}���T�ٜ�#fP!���xI2�{*�\0W;xJ��ǍK�k�,���0�i�v��ZU9?S�,E�ά`߽�\\�z�������\\ |A�AH&H�L�\0��;�J�r#�u�ի�M�^��+�1�UL�&�t\0�\\�)��_hך�C �9
\0r������{�����D��B�c�>x���;�s��H�cN�?��j���w8v%��)d�G
5~ ����]Q8�`�@h*�\\(���\0�}�sL[�`�S��P�=\0��ڞ���r#�#3w�q�}S��<n���mXT%!?�6�z�5\0�s��\0�=G߅�\0�n����@M89>|��}\0w����9U�e5Q�.z�͖Csh���]�$g�h�^Q�*&fdo���>�&��*T�8:�;Į���\'��4�U�\\���as��OB\\(�
�zaud�J�|x0OQ\0T��~
e�Kc#��������\'���+��l�9HHSɕM�+\0��М��uC���❻w��.�����\0D1;g��P̓�
��s�a�lT_m����ԟs!c���VUe��{)�e�@E��\\�f��%\0��jϷ�9���dBk��g�\0�m���SU#T��Ee�b�>��H{�������\"�Kk�Tvz�t�-\0��IrlD�l^�:>p�����AeB���Ů��<_̪���y(�G-EH
��̘�h�6� �;�&1���Q��]�o\0B�.� 0��I$:&��j��� [�8�@������0o�YSX�20��̷��,V��3��&��R������;i�؊��R�0	}�]~|�k��S|um�^��W��\\s�H���W\0
��+��A�,Y�-{Mm��@�\'|�mI�\\�����Ѷ�ne
]���\0R��ޭbm�-�1{#8��s��MB�%�.���t�\0�>�M*\0�IfS��\"���L]W�if�bƫ�]�����\0o	��{L�!?&�+�E/:�Y;�)�q�rS��<����+�«���X ��5B��\\P�/��Qv5\0,f��9X��.|���v%�\"�;Jӧ�]�i\"�q�A�ǜ��;�7�
����b?YWJ� o��%}/�|������4m	P�jR�SEP�M(*��3Zv��T1JN2 ���l��J΃l\0$]�V�b�OO��܄�*{s�4�7\"#�V��i��fʽMuB�e{L�&>::899:<\\�͛�8���F��U�c^1BХ��(2[=d���d����ȷ�t��y�z��O����eM���%ʕ�ާ�]s3�}!D��*b\03/A@�i�yS�ض<L#���tV�9r��/��P�R:UQ��;�5�M/w}Kvڪ�%i�$�)w\0H�٨�S;>\\.�@pL�E�VwL�K6ZhD���X�������<+�\\�e�Ibx��M�)�_����D��<J�=�ƥ�q����Fe�4M]�W&��CLH�@�N�h��c�.cG�.&{�q~���-�����2m#���!u\0��qa%j���E3�U�$A��BUv�\'���F\'ǹso�L#�:���n�����5���(�����Q�h
��sTӃT%�ҧV��gU�75\0��C�\0QT�E
�yst�\00�ս��dv��(G�T���)J��Ά�)��\"�w��馮�y����+�Y�	e�V�%�0�C��u���^.j\0�y�T����j&�j4+�5�ծ���3��@��9g�ae���M�u�4,�g���́�jd?k�>^[T�z�?o��t��;\"��O=k2Ԇ�8Kii�\\̎��[����˛ v}�xz��:T\0bT�d5K\"Ï�5i���
�)�}�j�7l��P;9��E�l����,��\0�k�>k�\0ԡv6����\\�y�0��nO�#�跷y��}���fE.U\0����\"0�����G\'�8��Ϧ���M}`�u��&��l^##�*�/�(��?�P�٤3�����G�u�:���.%E�ê��ڭ�\\\'Z��)%����T��������t�2�����(h��.@d�DU�T�L&2�<\0�b�g�_��\0�r�lz�`⋨�fIִ�ᨷ���&O4���Y��g�A-&�}��K��
lŸ��\"�<��fU�
�Hc]?��ԿN�ܵ�du]㕭�>u��9OȦ4B��6:-cx����X�6>V���L���������t��&7��
��!�)�6�\"�N
O�C�e�����aQ�����2!����a�Q�����٨tݠN��/5hĝQ�a��������#���Z\':>O�I0����� ��tUχ��Fa0��K\0M*YR�\\�7���Ci�;��2��젙>����_���j$�W�]��
�V[���[�6N7\04��\0fK��0��4�a�)F�p.\0puc\"Γs�����M���
���5!
�żv��\'OJ��Z�%	�^�%��z2�$9kJF2�\\zKaVW���\"�\\�&J��,��W����&\0��F�nmZF�S�z\0۾���:ɏ2�p�a\'t����b���b`qx��ۢ�Z���֚Z����o���;�)���Q�y��(�t�{��T�c�%S1�K��D���۞\\��^���^�ڒ����p��t�YE\0\"��q֙WA���u5S6�pv���f��z�]z7�l\"e�0��
=���%
h��9gVv��C�,&K��Dҥ���yk��X��+���L�&,HU��Rޖ�W���;g!(�
%mJ :��
H\'�{�\' E��\"�9�w(ㄺ��6�@t=�εU��}Bp\\��
Zh�N��J�*��BD��U�;��Z6Fs�nf5�W!�Y�5��RY�C���ۨihں:�@;��AH�v����4��$�nVZd�Y�?����Z��1����H4�|X�T<��_�r.�M�s��hT&<M�\"EP�:�Xa~ݎ����\'\01��\0�1Ř͗;�\0�aM����,����2s��Ԥy�dO\0��z_U�,@3-�J��J��ёi�±��!-r��@�\0(y��|�K�$���%�Q^�0~5�Y�2&	�u;[%��h�UѲ+�\0�/ 烩�� fuEl���U�v�
��q>T�@4�%s���)�����{�:���g8�|p�S*�_�1���:��~�Ǯ�������
�ٓ��1��:B�K��_���d������>)K�PC����G.�\'ƃQ-4\"5wzz����P�>�
�j�Z�uX�0@@y@�EQA3_�6\0��M���̮�f��I��I���=�%�p�S������/O�@�瘥�y��@קͶ�t-�\'�|rpp�^_\0����1�b������/��_����}r�<�����@���ǩm���*�2ڋ_��$GIY��)l�տ���œ��b�gK?��,�:[,@��6�iX���.�+��/aW7u��㦮��,\"��s���E�Mi��Aι�冂\"G�Ymg�@U5}߮/62��ã��37l��1ښ2_�C�~���ye3URJ���\0�?2��n�>P�2\']UU�E���H�\\�s.�r�SJ1Fsl]���>��]Ts�g����z�/}�,\0�x��<���b��\0`�ep3x����v9���j&\"�&�0h�T�i`\0��jca���{r+Ts\0���w����`Qo�֝%�z���{�G����
[��:QzM�~K�z��4.��
֓a�\0P7�qy|�|��;�x����`ȇ~���?��{o�PU��2N�V1F��8?��珫����F�:<�t���MXT\0ع�f
�z�ffj\0)�D
2����\'�U�W+\0}���w��_mڧ�O�ܺco������>��S\0�?|p�������������\0<|�������\0���%H��CE,\0�����{\01ƪ��wߥ� {������Ew
`��&i�n}6����{u]O7����^]���H�tz����Lv�(����sc��h��t�)l�ճ�&^���ǿ����i\0�ѿ�����g�?����&�E�R����珟?{�\"��\'=���Ç�ɟ��`��~����s��<\0������P7�;����R�V�p��X�ͦ�]���v`�i����z���/~ay�%G�˦i^�x���;�����W\0����?��?\0�6[�f3\0+3�0eo�tf
�9\0�6�,)h<�s�P�k8�~�#\0�|gy����?_��+4\0B����$P|i��iiP
?��Fx[�Xl��.�(]n2�d���N�2-!���L/��2���
����V��?��O~��O�\0I�ѓǿ��c\0�^<���?~��\0V秋����;�j\0�QQ\"	!x���ξ��n�w	@���qI��@�nכM���7���?�����Ol������\0��b�����\'���w��p��K�m��6�^��vΑ�eHT��ޤY�8���lȠ�^���ZV\0��yU�����u2]XE��Gp� h6���7�
�ȭ�`��$oͬH��r�E��$��}*r���&hHn�P+��9�岚�g�.���ba\\t�����O��O8��}��w��ݓC\0��������_��_�\0����O?���?�)�����b`jb�BU.�0_��Y
$�0�<7U�4�
F[9\\Ʈw�@��ڭk*\0\'�G\'e��r�X�����1�`\"����\0b�2����z�ø��~<`�˺�*4Dd�WU\")��&KgupO/���9�}�x��`�Fi�+]����7������y����(���98�\0zɒbilhɱ������۵�D,�e�9��f���s�\'�On߹`���o�����~�����g\0n߽�����Y
��NlfU��f7��uc�yǁ��D\"\0�M�\\�Vr�^�xr����*�������|���>F\0���R*UU5�P
B�:EO�[?���������g�_G9�Ň�D&\0�jV�|Y�gga���Yl�Q~�m�8Wk�n�h�?�믿.1\0��S
�-��J�\\�
S.K._��u]�FD�)�1F��,�ř� O�2u]�I��C�l�w����΂%���q�Q�8�8���\0\0 \0IDATK\"�Mj�q^��t�O=��щ�:��cdir�lt��G8���Xp��ŉI.���J�wu����3SV�^��d
\0ɺ>���h��H�󒷍9�`\'����n��U��4`M����1B-��@	����,i���c�;3G���.K0-`���Q�5���G#�mh\\J�H���SN�}ιl�Vx��.%��[���\"y��Wlx�� z���e���n4�zF�-�a�#�
xO���@���੡�p����=�lYj�u�kێ2~!�F��+�l�M]^��Y;��EQ��\0|Q��	��.�7\"E1����\0`q��<h>8��[����\0 kt=���F����H@2����PGW�1���-�!�؅nV\0X�\"0��]��]�!L����@UUD����u��Ƹ�Xf��MAF�-ʤF�1���\'&f�6�s�=E�u\0/�7l����$��=!\"�F�R\"�m님��K\0<�$Dc�͕��|F˲�\'���s�ZKc���tջo|�/gyd[���\'�\0�X}�Ïw\\\0��yHn�@i�B(3�U.��h.0�m�����9郿L�*�E��T:S��68=ߵ�%�����U;O獢��/tf���r��1<&����5<�CJIOj��������C�uC�=���u��]�}UUZG�C/��p2IϨ ��[o2�>�c�\0\"��J\0�Z$o�ب�m��is<6���.�%k�gJ�
e�`��O��	
�C�����w�`[�a�6䌨,�4@=��<o}�
o��h�rB�ah�@d���Md�Pqh>���
�;g�_�T�`��͹nT��@�U2�w��ϔ��)<���#DH�\0��e�t���V�ϼ�?�<�E Ĭ-!JT\0T�\0�0�ɻlH���/b��ą	���$k�.Ae2V}��\\�Rԕ����~��ڶ�*\0�YU8��e`.`�KIa��\0 񼞭��\0<>���>�,K�O۶ʰo6k�O��%�1�n�
\0�]���T�H|�3�Z�����#��d��d��\'?��ҧ�@>��������q�V1�t%#�&�_3f���,=m&h���L1�$�RY�����O���͛7�V��:¿x�N����k5$�����c�֛i��V�P�`�U�
�TD���+eY2�\"�?�뺬+�z.�u�Q9bF�ƹ��Z�ė5u��Y��
���Xl��P����۳��ˈ�ԅ��:�d.�U����D��B�IVD�]ABJ6&\0��C�K�Z��t�7#o��\'��i�)o 5�]��|`>�;�U)]״�-��b�b,�w�M@����\"i�닪��;��Ţ(
��]ש +������cB��\\�Tk�I����gw�:�Q����2cw����}zS̯\0��4Cb�tg������L��������xm����r�I��!r�S���<!%���Eʹ���q� i8e�^�A�Bb\0!����!FE
�t�.J\0Β!ш���\\�麮��iw{m�+_�pe��\\i��Ó6$EQ�e9�CzS_\\\\��v���G��F9<>�Z~����d�g/S�l�uД�~4���fC8f��
\0mH�w�����F�&v�q!��$�ޞ���
�h�\"�L�u~�;$/E�
��Qx�`}�,�B��n�)J��������>��{�w�������_8<8PuH�u�n�E��b�}�k��eYjyxx�cYQ��a6��f��n 	k�꜋̵�[E1�+q�*����d�錂({=X�(��
�!6\0ۜ1���/��]�F��`d�Oq\0s��w6��+(Q2�(2`��A�0_�\'Rw#2���ޭUUmw;=v)%�>|xrr�޽{��y��;}��7�ܾ��fJ�4���4�v������ÉC�{��Ԕ����~�X��QiZ1h������&��HND1W����\"B\"��1��b)�T\0[����:�+��_���u���r�֙��_(}*��G~<����E,q���O��lGe��**ʡ��sV��qc�ujr4�荵e��K,}�\0TU����g���z�����I��+�������Ƶ닪V~��l6\0nݺնF���r�^����K��R=��}�ݏ>�����\0NNN�~�m�����j6_�C�\0�߿�$�l�m�R���\\��d����Аcs�訞�8���Å��MU����i� \0�+ށWn�M�kjJ�:0�������_<����l*�0�Yx\0�aa��FݞD\0�!�TY�-���5�g�E�o����A}�/,J�S�#gt�nHC�����;��w��`�_����ژ�~й�97�UZ>����a.������׷���E\"��Z]l�z�[k�Y=��yy�+�H&�>gS7}��0��\0r�\\` �$�Qz~F�}Tyj�y�\0��\0�n����BA链����l\0��6��|Li
�a㒮��8��+�Y���8�(��8缯\0|�/����]l��͏A4o
r\0b���&q�ø�@��oR}��1�j�YE��Y���r���]����2��@��Ü�s(����D�����R.1:�7�N7�����,�|��������hn���q�Nڦ*��������պ�Q@J!���.H�(��ht\'�y��X��!��B\0�x\0H�����iW�Z;�`���Na�)����H����o���Qu��P�	ß�P󘓘ͧ��疑S���B�FS�܁O�������_�#�9s�w=$1[E�A\"I�h��s?jl�&7YS�J)���*����m2��o��.�E�����k]B�4?�ge�m=b��lS9�����>O)Mw�+�a0&6�\'�9�>~I��QI���e%��+���>Um�Q/�X�����g�gF�\"(���H2I���\'�ـ],`�`j�=\0Bp9��Y���V+�Tz��D��\'�4Y��-�YE�6��$�.D���\0��~�y�P�4���k4PW�-d}�����,�90Hm&�#?�0T����GU(�*ˊH��!�I����$G�,	9��
�[&V�M��i\0��y\'sW��~�������,��<��gnI�m�?!+�R���=�a�c/��M.�4�lզ�����gT\0�Gc��@80g��%��h
q���X�]�)O�}�,T�������lN\"9�p�8h�!�,	QiJ\0�X3\'\0,!t��\0��M���:\'q�A(�Ţ���5�4h^�!��n���TY�j0����\0��v֑q\01&��Z��SG֊w\0Ĕ\"��/	��\0�#&�+\0�·v����3\0,3�a�劇٧I��m�g��_�Fzv�
���\0 AR�NP2�\0\\;:�Q�7����Z�?�s��T(ߛ�E�鵞R�)Mc�V_\\qi�W4����3̍��IXW\"� F���l���s#�{J��98�BSNgg�|��m���b\0$�Q�+��\"�%r\0,a��QmZ���R���@��8���lQ����~�7�ϷY�):%�#\0M�;�-�����}�U���b5��2�ť+\0���lQ�%��͙�S����D�<���2�\'������\'�(���#�K3�ٶX�5�t��L���E�O��
�jd���� ��;L�K��Y$)�I���Ko����$�b�e���j��d��H1%\0!$-$�:f���E����PE���Ěi�Y�n<�����(\\]�~�ׂB?Q���5Y���ވf��q�P��\\.B�\'�E��B�(�eB�H�?�Z%C�h�6IW��\"��YA
�^�`���>�j$�~�����Q 	ɥ�E�gBv�b{6y\0=����� d��O<�� �%(�o^Q
B��@d�W���<�͞�\0h���d}̦� �L�3GĤ8TY���E�Q�}P�h\0�g�t�z���雦�j��k��q��ɚ��:�]5���-?��تǴ�<̉� 3�A$\0*&��m�E,��ar��>5��팚\'?瑯7*sL���x\0A�\0�Yi&���2�/F��$�<�eYf/\\Ν(4�3f�H�y\'����z-���U��B�D�����ص��^�~����1O���aztz6���f3�|QX����O?x�B�ą��\0�˞������Wڟ�w���U-\"(��C���C�	\0Sï]?k���s����\\�T��i~�-���O.�\0W:Wӕ��!<ʙU5*��u�I�\0�jT\\�u��FĦd]&�fڤB�՟�&�X���E��Q#;�:*pzz��R��?�sEQ��}��	}`�z#\\:�C��>��â�T¬[J\0R���zt�Z۶�NN0��Ĳ \"I����4��Z�p��є��de鯊�r�gv���5֪��q&e�I��kpU��}�����o}����o�@�yU�\0��o3\'���ł�L������3˞��u~�d�����\'0������v?�0�����Gp>�	�gߛ@\'qrN�y��t/#�H&1e�0�E\0�\'M�}?�imY��m�m���U�g���Z�C�W�P�UU�k6~/\0KF}���y�c�Q )�f���\0���k������@U����וe��ǏE1���&|k-��E���:\0ъZ��1�1��Ĝ�o��w��\0������?�o�ſ�������~��|V�2#���`M���0�������g}�������� AN@j�u��[߲k�X��(�Q3Y�A\0��_|��ja\0\0�MB�u�X9�����,�a�տ���V+\0G����$�!t�9O̐NHWHm���Nw�֋�f�:��2Ƕ�1x\0w�0�Jm@E����$�
���5PQWr�
0.B�����	!��z�*\'���l�o\0���w����W�����o��_��]{�R#r����c�4	Y?K��OyH?��>]Aǵ�+��\\
H���7@˶e�������#�\"��\"$ә�Ɔ��d��<3s�h���^�q�w%��{��[7n�3\0���.���� 1����-s��Q��!FWx5��1��P2���?:\\ͫl�B��7�tMO��j<�>�zw��3�au_�q�$�Q-E���n���C\0����7�����\"���?�����&�L ���Td�o`��++C��]��a�i�����\'�ˈ]����&��EϨk��00��,�!��fa\"=��ui�����,�7���N�b�r�WRj�6o��&�CW��<��T&�\0Xj�Wq�_�.��\\�D�=c?�AC=+���r9�bp�{3m>9�&��,��d��u�eO�9k\0κ�8^�)����b������3���x�K�}���
���ˏB�	|!h����Ø������P=��|����w��Eh4���ɨ_��-\"%\0�g�\'0DH�c\0�z���+;e�4�.��=]}��+�*C\0�:_p�i�l�s#c��ZTF=^��v����~�6�92\0\\�&�i��:	Of;�	��:cզ���9Nm����Ӵ��W��m`�l�&	�������$��@����{�\0���Gך��_�����?�W\0�����E~k��ӂ��D��D3*������B\"�J\'*d��P�X��$�A���}J��\"	��=c��������9�J��/to��j���)I�ٵ+%a�r��zn�
��\\T1$\'�z?1����PLW���+��Z}`�q�z_\0�����L��������>E3ҟ�[\0�7���/���ON��X�G��pP��p��L;�`�L�דE1�C@�0���e1|<k]�ɰdҒ4H2o����R]\\��9ƒ�R�:��pM��f]Tgg\0��\'Cx뷿��\\#���]e#��;_YD;���cs�sDR�0��2e�p���{W��z&���=�}�ͅ�[���~�tF��!�!Cй�m[\"Rx�9g5yB����\0�����&J���zfΩ�Wn��P8�ah�\0��Iw�����w��NO|��^�����Ð�\0��?�������?�����^���_.�ؔq�+���D��E����5�rS�Q�.��\\�^\"]f������Y�����j��\'G	rA&���ė�\\gk�n�6�c�\0\0 \0IDATh��Ld��\0�����; ��7������I�ч�Q,���s��0A͡��S%
���\0&�^�eҎ�咬fJI�W�=;1�*Ae�1%\0�.͞3��\0L�#����jn,���q.�6��S���Sl���Daj.���B��FRJ�D�}c���)��h�8�~�H�ȫ��C���bx}m��\0ʹ_]�VR�ϰጽ�1~���2k�����&H�Q68%�hq��8�G~��?��y��%r�A��c�Rʼ���fe�(QvȡQ9Ol�<T����h >�\0M�Ӏ���%��u�w���.�V\0��>�����\0xq�t�3��5Шm�I��&��[=m�,��1\\�����ǬN��)�D��A������Zc2Q���)Ő�5�u-�EAV�Ic�p�����zZ�M�����>���I�B�)
S��f���#ήq�@W)F�l3Č@�c��2o/�<F�.P����H��8gq����#H\0�ԓ���Цд;\0��d�.neyt�&���������;7�`#%\0pL1�-dr,Y�iA�d����0b�$9ř������ǦŘ�\'A2�<A��wM9/��E5P���g>
Kd����Y��zNG��l,\"Ƒ
b�f\'2��#�g4�!Ů�\04M�\0ڐ6�Fm�c)O\'��Ŏ���|�V�x�Z��G�r�X�q`��Q�d��a,�lp��>#��
����	//s�id�����k|,�jw���l���mb�t��Kg��4\0`#2�7\0�p��۪�X��[_y@yݼ����w\0�0��w�����h
��r݂�Iu�g�&p��u�#R��vK21G���Xk�Y��|Qe��\"/�k��ж=�c��S+2�I��:S��})	Ɵ1$&V3`Ȩ�U+���h
1�!\0��
��$�H�#Mҗ�81g�;%	��B�}b\0s�ʗ0ƍ��
&��4+�a_/�7��7\0Mz����D\0���]w ���]f�I�z��02���[{rO3cY�r�_~1��p�����ϕ$��\"b�>i��7�^��Y��ʾ�Ζ3R�w�B�G�_{�U\0���9�y|x��-�;�?��]\0?���w��pX-��.�3\0хO>z�\\\0V�=z\\%�����|qz���:�6���N��iK�#���a�
@U/�S#\0�Q#!<zV������8$��7\0�m�o:�.CN�-mUSU����_�ڭW_�8����߿���\0~��߼{��������f���O�����{�\0�/v���p�\"�S�s������q��l7\0UYYk�dM��6q��$)����3秮�
_�gei�u{\0}���l]Z�g�\0�����������P��٩_��A>kw6p�`u}����<Z\\+�C�\0h�f6�x����e�SJ:�wC��(+v��ViH�oB�$-l,��e�l6|$\"�묞Wmg����h�=&;�U?&E7U��bai!����W��]䆘�,-�JIZ�1ֆ!�@�Ө��.},]�k�w�<�����^W��B3D\0-8��(8Oei�\0XΥt\0L)��IQ��v��73\0��޸���^��6������}��Gg\'\0�vC��)W�{��صgWs��7���\0�i���,��r]������vµ7nl��Mb��^o$)�~����o�
�w���_�����8e�5
\'��a�J�b/�tGN%N�c.�FF�H�׊]l�6]g�!��bH�\"rΕ.��u�\0�oڡ�5�.i�����u�v]�!�U1Ȗ�j��];���]\07�����u\0����k��\0�vCǭ)��sT\0����\0
��j���+\0^{��c\0?����?�裏\0l6�&�֔*��q�f`�!�Bb�ɡ(�YTc����?����ϼ�XL?��vߠr����o}�\0�����˯��ٟ8۝���2)*g�\0k�},�%��/��>n�\0�S�����bۇ./I.֫n�\0`���f:�d����n��U�8KbĐ2�a�B�Q
%��|Y�Y�-��ڵ��!\0z|����0�(:�hG�${bXXt�8e��b��a&]����ZŞ���=��b��XՎ�Y2z�B̼�6�\0Db�T����(�E�h�R:�\\��]\0�XWt�A)P-��0tC�þ���{ŀB��^a�z\0��n�ž�k�}7\0�#\"�s~��ׯx�Wg�޽��\0�����g������=���p��/���m�h��s<�8�=�eY�>�qm}`�>�} �0t��!\0�������W\0\\�u|�h���{������3\0Ͷ�҉B�L��z��G/����=a���\"�6�\'�������������^8}��#\0�Pe\\{������b5P��x�6\0.���P/։�\0�mv�����)��|�@�ƴgC��!^�b��v׮���\0�<�-��	m�DVŃ�b݃��єF�.o(dٲ�97�Z�`��xT�j��R\0ԥ.cR�$�!��Y���0���!���r=��X�Ǜ�����e53���t�\"�!�a�~�p�9�m��)���!ۧ^
�\'�EE��\'�m7�\0��onlp�މ4f^8\0T.�a��_oݼ�g7n8x��}�]%�Yp��\0�׫��|V�z����\0tC k���v�4(��
���\0���^���	���}?�� eu��-�g\0��79U
����K��EUX.�ɠ�Qq�B��
��?>�+,�C�\0��3�muu�kِ)�������Y���j��0WE	������������?������n�p������z5�Ms��u\0��UU��@s��e���\0���Nfd\'>r��������������
g<<=��U�/���}��ۨU����;�����r	`�^W��)�۔b;�\'X\0������!(������\'�\0Λ�0Vu
�C�����C @�1$\'0˒�ؒ(�$e
�8�T5\0CM���]�ZUQ���E�C��^4r�h������o~���RH���r���!�kuzz
,����y��q�g~\0���V\0KG�A9�*�tx�HE��=u��l#�Um뾴�r�?��w=�}���[WU]�2$��77��@�t/�ւ���R�O�!�om[׍\\�y]5��� ��j��m���w��T��\\OF^)��O��O���X�
����e�/�4˦�Pf�^I>�������v��G9��]��:/�@aq����j%�ף����?�乵y�\'R�c+|����q\'c ���������n���~���3�^z�Y�Ɲk�4\06���ˇ�8�EH��zd��w5�W��K c�]9S�kd��Ms�{ P��a��w�������p�49��{���Z6���}�N��|�N�N��Z^��f�+0�ޭ�����?���&/���7��n��i�������d*����jxwzqD5]k��չN����m����6Cltg��1b��vǁ������!]�g���/�\'�S��.ϊ\"k��]_��O�⧨�� -��v2�M-
L����ۙ���{~\0�<�|ś�\0k;z��Mzuu�M�đ��eS�U$m#�d[7� *WK`��˫������$FU%r����O��/�z�����hT7�\\RMg���__]
20�/��,�g��E(��Gl��UJ۶OS�Rf���V�o�Y4
}_�#W;�$B�$�I4���^~�4�*�ժ�S*���������n��mO�����rS�>o[���B$�=-��H[��}F�g���_�������w��\0�\0\0 \0IDAT��o�6����y���7�/��/�4?��w�����~��
������t#>�,���k_�/�
 t�+��ƈ��u@�h�)+`��8?�/����O��O��~s�8Ϧ����o]���o��W�Ǔ����/�|��ꋫ�lu	�鹑V@���7��1�5e#��x4����n�)Shz�o��,��+�n���U�eHO0���d�jJ9~�_)���߷��x������I�j{ �۲h�@U�P6]�L�^��>��/��8I�����ݯ}��Tp�6P�~UV�>�͋�ǧ��
P�ȳQ��j���m+<��z���c����}jFמ:�^�C �e�uA�E�h4�]tM����eYf��)�3@+ׯ_�H�{�dlʾX./���A�u�4�&Ƴ9�R��:D�0�Lܧ�-k���a�%eE�^��6KGIrl~�>�o\\я�0�T���}_��aF���������h	Gq!����8I��9�����w=|����~������G��x�f��+���I
�գ~�����C��_H˽�E�@�4��Xd�G��l:[6X��N�f��d2]#Җ�xb@*�J8϶�e���feYzf�\"��GV��1b��r4�y)�������Ȫ�I\"`S�o���^~��O}�����>��v-}G��z�Ǳ�ϲ�Vr%A��^��$mS\'\'\'�7��m׶��}��vz�սC�>��SOM����0c\\�oVƕ[�J� \\n6iQ����B�V=V{C�u2�v|p��;U�ߺ��_��W�xC������������)K`����|~�M���n���nY�\\�/�1�@N�8��
��� $�$K7Zke�y�B<�r�J�c�J��R����]W<
(l+��i?6��\0�:�KAī��W�RN�O��e��Zn6�z�y�X�e��<T[;�+�z�M7��m�Z�����X]�	���hu%H�����\0/֗W�����}��s`�V\'��@�lg��l�z��$�M��($�~��߶;�r��m.6�w�u�{xHM��A!�O��>�sgf&����d.Z����?�w_���O�Z�����|�?���O��{��S�Z�����w��	8U��y_��k��qŀk<;��u��{��m{)�6f�()m:5D�4�m��!w�n���8��ɡi۪k�^F��鑌�MZTy5�4��9�hn��N�����b
|��~zv������	\'�6^�i-����W�� �[>����q8z�%��E����ލ�\0���?�VW2Yձ�C@����@�ɫ�2a�j֙���=���wG_�΁ܖy[V]
����p�,�M�wҽ��v�vx��*�zFQ\"�ӭ�ó�s�<�xQ����{����{�O�pdZA �|��Q���*[I������mTi��U���Y�Ŧ�X_ʾ�z�@i�svu�\\]N�E�m�M�1I]߶m��@��ugUmߗ}
تBg[�V25��Cf_�VX�>��Eˏ#]g����F.�7���j�n����lk�[T��좶��/�:\0l�Q�̃� �\0c7<i�>\05���m)���@R����ۺ��
<��[�H�U���3��Z6�(�D���#w6���e֥��`a��!���Sn����%���e���
�w���tG���6��|���/�������O�Ǘ�(0m*�{x���1F�Ѻ�Z�B�uO�۵RN�x�{k���T�ur�ם�lM]������u���ʲ�q�F��mҦ��8����>
M�6���mY���յ�I���j�c�SB�(�+�%���$��$�c�1��r_������^���mLk�e��u���)�	6u,Д۳*���酯Ezw�.���ǌ�pa\\�L+���f��p=��p�n�\\`/�ƴ�lq$��j�M�^����=/lr�Me̳l�g:����,_�HuB�s{Mg�v���~�{���N���ރ�\">��WVe��������{����<�E�������n�$��S9$%��E(��vW��9�����ڪ�Z\"q��j��	���i�+�Ѵ��裗����g����_�8�LN��RJ������ե��u���w���Ow��D�b�`�����0��^�x��������Zg^�Qt��GA�@�Z���t��\'	�V���㾔�y��x:�!Jĺ���h�M=�q��m�\0�x4�/O��^�A�Q4�ȁF�;���\'z�(��D�k|�xڤ\"W����Mq�P�g�:��<QW}���m<�8��)`�����b`�^gYV�C?UQ[`�n�y��᪩*��Vt4^�#�ڑ��5�o�!����W]e��m�,�b2�o�������f�����?���l��\0����_�����m����?�+�����L<5�t����rt�=
Dڥ�w
�#�y���S>\0G�iXٶ�\\W�W���������^�����\"HTW�x��@��&^(�$e��کZ��f�D*��l�\\w��-�4SS�>�pVn7ڊ�bkk�*O�-p��*��;!�(��&I����u�ZŞ��0�E�y��t��C����7>�lڇ��\0A�|��TU<����N��|ݍO��}ʹ���B�)h����$��j��5JKⳣz���*���um�n0�ۮ���w���/j{��mtp���w?�F|�6�.V� ���K�)�d��\\<� �N�OO���ooL�	�{x���K�؋�,�8Y��p/���Y�M������p4ʺܺ�Xy@�\"�Z�պ��5~�th��F��|NF�TlT[���R��U�BĴ���cV�~yU�J[���Bf������A./K9�7�R��}!��\"HD1�T�T�j��xG����Ů�@ۧ�d�etpt`< p���Oґ����x��A l�q���i��4���.�K�\\FA4�J���}�m�\0���8JS!N��H\"hY�`���g_z���c���ǯ\\~~<y����zP��|7�s�s�������4��WrѪ����rq�o�SCs���	:a�z5D��J:���Q����8R;dt�y���*��*��7^��e�˪�~�c��l�.��d6
����3��*+��-+`�n��t�>Hb/��hf\0.�(k��(>}� ˸̷�����;�֍D�ڢ��t�����vf�D��m7�z1�\0e�٦�����o?l�����{	x���|�/������\\�]�������ջ���?��_���k���ۉ〲m����a�dw$�J+�u�rXtmSՐ�v
�@��N�֪�j��u�*=�޼������g�b������R����j6�m�~�[o�e����B ���?g�Xn7�6��O~�5�uV�����ج��Xu�l�|��&ׯ��8��uU�F.�wDgs{��*D_����N�Ζ��j[�����a4Im	���y���\0x�Ƴ!��8_W���q��h4������e�L�Ӈ�R>�N#9my.�Dmg��\0�3��شX5E���H�F/\"��t�����6&g�-���k)-uT��\"�@Ve]��KQl��jj+���\"�6ۭtk�ͦ�ڮ����o���B-�Z�L[��A\\u�j�i%Ӱ�m��9��Ac4i�c)�=��U��~�����/�տ\0��j���7����q����W��^�����ʋXWM�\")Hd���nʾ��Z�^Ӳ�{g���^���z��A�M���\'^����\0=��;�����������&�:@Z�I<^��#�]����}�6P��[��|���_�\"G��N�}����h�Fq\0���vz�u��*����M�Yf��1���R<R�EY��8/�R��<�u]�4fwC;J�
��j��T��D����;��n��U$�sGJ��_�9�oRZ�p�ƍ\"X>~rM��>�)���ٷo޾��3�_����F��~(��_�~Sw�������Oƛ\"fa�%Gk�V �J�&��Ʊ
%=c��y�\0��Z�U�֝��p��������/���ӫM�7�����\\/�ɾ����|�^��3��ݻ�*;_��6K�\"x���;O�����7�O�W�\\��3 �Mz�CiH5���Φ)˾�M)�^����eck`f�5͚X��DOG�h��UW�r���Wu.^�۶��֦i��*�R�\"�:k�Х1|Ї�ߧ�<N�
�ǣ�s�~̒i�zN%2+�:�dy�uUu-\"2:�2 �ʲk�P�@���g� �v�]`4��r�L����Qo,���퀑	w��I^�ţ$TX$��x\\u-W���<��qi�h���������~���9�s����o��o\0��O�����w��W^�������|2�8~�w�|?�㻾��j�޺m�m��N�q�IG�ř�����j���m�������_{�������6�z��W�ǘ�u\0\0�IDAT����n��.�Ǘg�?~��o\0w�,��\'o�?:�U��=���w����2��s`�X��Ń<�c`愋d�M�e9*��\'�Q8��۸rȹ��y��{��ol�a>WQ�����B��</�\"p;�̋�SB�eY&�Dn�l�Jbz���V��xh#C�����L*�E��η\0�E
GH�@����=`��y�N<�(�5>\0�Pu]g<
�������S�����TV���4M�DM�B����e���S����l0{/���<<^]��S?��o�	������/l�8y��b��T�ŏ�\"`��x����IQ@PWQg��3�V�*Ж^S�WN+�]���������}�����\09�U^�x�h:G����3wn�r�������v����_~����;�}��ׅ�S��Mq�����qN�FI,{I�����b����K��������廞 ��O5
%��(L�(�*	r�ގ�H�X,��ǝ��P�,�J�<#W��bJ��g\\e�CU���q�R��y����*r7Х��MW_��|���Ԏ�MS6e%;�e�Fa��ڲ�
��]M\'@Cf�M�E�f��m����xuy�3`�MSWggiY3�\'6M#��y]մ����k�B��
�\\��Y:!�\\s�Y�\"��ȵ��*�֞��/]�h�s��
l֫O~�-��uӽ���q(�\0۪jl_9�M��ަ��mU�֓d�\"���bk}3RP4ٲW�V�)�Q@i���S1�7U�����m-9�}����\0ھ�]/hko���t-�������p�Л�*�RF^#��G��^���6�7�No�v}Xo�����/k�^��{q�ܖ0�NB�IemԦo��*;:<OG�U�*�0Z����u�t�<�507^��x�L��R����6W5�H�5��������{Dሮ����릾�02M�h����X{�:�D�Q�v��8wԍ�oNh�����ӵ\\୷�|�}x����\'?����-�*��T�xtE�������{���t\'
g��ۋ��P�!w-�8_����~�?ʽ��?�l�{�J�
X���Hb�j���W�m�����R<7?<���o�R9�V}�/?�ʍk���h�����8r��T��X��Jx�7�6����y��6��
Xۦk{�d�ޟo��)w6��`s��X_�K`U�uM_�Y��/N�ֶy$�d�#�`�t#
�Ng�q\"��E�is����)�o�&�n�Nr}c.�^���¶�*���ږ��d,w���8I��d|茁�y���Dj��Nf��H\"�lxJ_��=_m��I0�0֮�܃�C�S�9�����s�9N�(t/?�^D]���Ru@�wb�p:��}�h w�q�8�b奶�w���(��g˼F��?���������L
���6��T�����q�����M?�{�5t�i���jV�=�J����ˋ��V�ݼ*7�\0��V�싮ڟ-�@��+�F*��qC?��*Jc&nUe��c:\'�B-����B�9-m���ֶXں�syʻ&����my�V��kv�k �%�e[y��h`�U��������t�9�	��j���0}݉��`��һ7NQ����VR�~�՗/_n
�N����~akw�\0���D6v���!p;��J�ㆍع~�W^���]����Y�v�4e}*Ί�s�(\0N�O�˕Ț�VW۱��q�����}�J�DF�	ptp8��$��K+@�\'4��
�@(�U���v�&l{�?,���� ��Fk��M�
�mL�M�\0u��^&��L�8q�L��Q_�r�΍�]������4���Xz#p}e��\0�Q1\0�2�2�2�u�t� V��]�i�n2 0f��;�z|~u	xy��y��6/F�^zȣ���ɟ��ōk���ܿq�p����GgYZȧmj���`r��O�
h�Z�7~��{��I)e6�ˤ����l��Q�2�\"�-��
0������x����U�/T)%O�pJKa0��V$���s<
h�wj���_~x�x���5w���xTӵX,��w?�;P��맟
����
�ikt̀����:�(]����sr���xgD����F�<C�sHl-���8�\\I��?���(y������?~����]��P�^f��\\K���m���_^�@2�9�/1+���_���Ӡ�eUS�U�/����,��WF\"����\'¥�q��dP%?v���)j�$3�O���aL6��}L��^�(��Y.�sJ�|:�8������ąqU�S��f�N���\'�����Z�b��1s��u,����I����)���2��,�37���j�0��v��u����۶u�����[�=��Z/�ɪ�֯��V&�N4i6�r�k_�����V{�V���\\�a`�����o\0���+`=�k�S֍�+���u#s^�U�NY���|����/]\0V.:k�5K�\\���J��JXZ�J-��u���n��OW��{�[�n����~��|w\\c�Ѯ_I&�\"�еV�������OOcU��:�\"pIE�&4\"�ԛE�����UM��┧I�n��$�4
���+�~�\"�R��Uc�c��3�)��i�)��;��$��D�s�`��K\\Lv?cٽ�$Wό�\"!G�Q�
�O�I���l����Ay�d�=��2�ђ�e���H���e�I�#M��Y|��PJ2A$F3\'	dD�?����)*̘40�4ם��<[���<Q*�
��Z����J���pf�թ�hg��Y���P�2��\0\0\0\0IEND�B`�","Male","ELE","0765233421");
INSERT INTO employee VALUES("KICTC-STA-0007-2020","EVELINE","JOHN","MARO","mboya7@gmail.com","�PNG

\0\0\0
]GB�J�H0�|�/z���S��Zګ�ri���r���x��Y��ī�����~�,�s��a/m�y^Jj��V=�9���n��Y������A�ezz����-/&��:e�A��1\'h�b����4}|\'Oz
q�9@������ޤ��f4~��n<��ح�=��:��3�:k��<�i�������.�v�~#��P�T�̃�L\0��aaI�Oh�S�B�tj�>W}�x�>J5ϔ)iBGrtf\'cm������)��F!�s��ަ_���<�B!5bk���u���0 �;�r��H#$躔_ש��S	�^O�ezk�GhyLٓ�@�$�~*�2�T�s��9�}[��&���Cy���X�<����y�̲۹|@B�.tKLwD0i�ɤ�7��Yȃ��(���<Ȓ\"�ty�W<gsҀ�v���=S⚃,P9w/*�V��d ](�6+�ƭc�2.	�8�*̓& \"�T߂:4>I�1

�U)�jn���|�lʓ��
A�@ҳ$	���F@X&u*�
,S��9��<RZ��WE�����j�Z�i�e�Hj���B�\\|��p0}:���t��u_���j{$ab�e��%\'����i7�w�;�I�t�\'H�y�ץ�%7�����n͉����\\o��@K���@5���g��jnd��*��0�b�G�@܂W�JG�~\0�v��`�q�ץ��X�㸸�������n��L)X��\0��w�
&��j��!\"Ȝ#��1(<a�����oY$u
o�J�
�e84(�,)s���
i	U�F��1$��m5��F��S:�)�*�e�*	a�	�{�\0�>Z���n�2�r1B$bAᬒ��]
�@����`{�,Z*!�M�7�x!�y�un�R��|���>��a����:ݹlm��4��U�p�,\"2GX-�r\0�i������uw�w���
�b]T6��W�����ă�IXQ̔�N�!\\����*�E�����K��ho�2�UN���h��xh(x�@h�׏��`��Xxp��A�����]�:\0=��N�`����U�JW�	��<(po�ݎ:F�:��(���L���!/��zӮ���u=��.���IX�x�Ȩ�Yw)��S��~(�BkXr�*�DwTg�y �70�Ӥk�Xz�DQ�4���H�.X��\"z�I�̉�._��m��#w��STHd{݄P(�`L$!�
�b慤�>ؕ�sY ɐ�P0�s\0ex�	W�ʀF\\GPR��Z>o�-;<�Wd��2?�쟒F�%�Z�m�W���5���9�����ҀB����包�G\\���%���
�I�d\\�d;<T�
l� �(��9Ď9*�G[o)�L��ڸ	O{���R4�}ՍG��ʷ�Z\\�e��e�}3�
P��41V=Vpv��-�C���%4�T;]��]�ScC �2`���>��i�2����tq�q��>C�J.]t��1� �y�	�3\0�DbC�q����KǢR3+�� Ȟ,�C�}d�����@q�p��1��g:uz���u��`���G���K��ӿ���p?m_۫�0��ۓ�7(� ��I�0[
��\"�x�g�{O$�#���)׬� #2f�r�A
N.ԁ�Fs�fa�k�e@Ol����+z��(&��|�%
��@�t��
��%�}�����\0}�4��3�o��!˄g�\'�V,�ޏ�bV5`5��s(�Q�?*$Q�|;=(k�ub\\C���VP�G��
v����{.� ��7��\"<� ����	���������$1��+�E�/
~�Q{�<�X��U�KK�аT$E�lV�Ç�-��6;)��r�B���n��s����Q�6e�r�T��?�п_����U��l��a1�7@(�D�nn�\\]��v
�b��۟4J���\0Ǯ.K0�6��C|��6�K��d�0�%p
�1!�ȥC)H� ,�Fs���Ƣ}^$� 1� �Ɲ�\"j��Fu���;=sbՑ��o^�+?�f&~p�02��l�fot,��0V7!�aN{��I#
J�6X��ot��o>�e.�cm���Q[OG\'��?`C����m�Z#�R��<7�(�\0x��Cg�)0���FHn�H��T$�Ys�����[����\00g��!�����D��ܨ7��)a͒Aὗ��\\�l��m�-�Gb�St�>�(�L��mlBI�ĲW�äK�$�	�B\"fZ��h(ye�a_��Q�2���+`P�MA��ko
v��M�\\8��{|�I�YI0?<\'���rU�X�2����hm�n�8����}�v������Ч3^�:��Q��;=�\\3�I�7�zAw�֡��B��ʵ����
��&��� �����p���f�\':���^��_�x��+(
���\'��5	bwm�Q����%7Qw���R��IB=�U����Z� �6�X,et$�\\�l@* ��h��خ�^��!ެ�dG`��B.K�ks�����zjd��`$ͫ
	(\0�����xh�;�yb͓����9T����f�7umat��\"M�S;
��MШaU�,���R���Q�t���@��*
T�΄ť��FP�5@o���O
U��X\\�8udSCuX\0�VD�!�m��5�k��q��(���?U&�d��%�A�xz�g%x�����Y=t�;�A$��5�Q
P?����K�
�
&���04\"Kj�Ҋ�x��Q#��cD�<͋0+��Jp���O�&���)1�Ð?CI��Fq˩q)p�mIt��+����]j�u������4+Ӧ뉶�LH.y�
4�kw���8�	�2��	���:B���`p�W�Fs�8U3N��?ic�`
�&	В�]�&j7�mA��t����K��q���6
��@��Ό+�/7U�i�F�X���z��RBjҸb;G[߅�m��^SU��mUg����t�5CgTv����JJ�oފ��A��Fl#�]�.6h��,5�b%��$��}� 5S��5��0l%�ɿ���::{\'���@�ղ&Z��&,�ұV[[o�syz���mO��ut�*�\'�� 9�u@�A�;���4{Ֆ��s#�ݶ��
�32�z����Nu643DUՓ}|�����FJ�B����Y��g෕V�ه��
��w��[
@����wA�&���7��2�
h��%䱆W���Y��ب��N�w3��}f�*��фe�:�-�-�s�7�����\\����n��p�E�`
͡��\"bMWp�n	�$�s���@\"�UB����!�[�k�(���:����u[�k����^
�Vh���Ф!Iqq\\�,V\\�uup�\'G\'E)��\"���q�=�����
Sͮq@�,#�L�ܪ|E�0�>����(��Y_��Iu�Y�}V��7��g�nX��ӛ��y�8�J�B|N<f���.��ƹ谟gF�Lz�8J,;X�`V2T�)☢j��Ϻ�p��Vj�uO��p^[Y�:�!$��%� ��2*��]#�D���A�/�K&W��B�������l��䄛N\0�/��1w�fݶ��m�y��+���6��O��m-vD����&��;���.�#h�����)���5wn�s�>\0�U�88F������ι��Ӛ�C�r�?\"?\0\0[iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:8335a81f-a59c-49c2-8351-4356e91a8fa1\"
   xmpMM:InstanceID=\"xmp.iid:1092dcd3-664a-47c6-a861-3d9bbe7ef7fc\"
   xmpMM:OriginalDocumentID=\"xmp.did:4ce1ef59-b22b-4754-a203-87f4fd193175\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1602728640871275\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:86974cc6-ede6-46d0-888e-a6a58b65ca18\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:3895bc14-ac1a-446e-97c0-e254837fd8e8\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?>Vx��\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�
\0�M��\0\0 \0IDATx��y���Ux�{�-�|K�W�U�U�-uK�-�Ђ%$�MFo0�����1����q����D�03�<�!���5�$0� F����ZiI�V�����-�|�w�=��73�uIxl���j�YYY�����s��;������Vx�Vo�
+����+�8��
+����+�8��
+�����
+�8��
+�����
+�8��
+�����
+�8��+����
+�8��+����
+�8��+����
+����+�������\'�Vo8p5�鏇��kOUSJ}��f��t:�NC\'O�$\"�}Y�eYE�O�׮�?q��k��j�֭8���������k.\\�x��������Lо�C\"bf\00������D4�;�c{{{ww�������Wo銣�ɟ�?�ƃ+W/�;w����g�]������H����#�?k�����`��}�4���ٳg���O�<�m?tr�>�8�����bD�4����]]�M&��x<��b��}y\"DB
!4Mն-mmm��#>{��[�����;;;��+k��}���P��g��~�����_���x�R
)�Y>�c��R�\0`�d�/�\0	�\0\0Ѷ66�\\�����@\0(��1nnll�6��׼�5/���W��f���8���?�7�}�O|���;w��:1tE��!�nֆ��e�����F\0@\0PU��Q@�lgt8�E��6TU\0�ޣ���}�?}��+_q�}����{��3?pb�A�8�5����Gy��}���.<߶-�cW���&ST0K�̜sG�L�9��B�vP0S֜s!vUQVUc4��,��@��i���=��׾��x���|��d��[0�����\'�x�ܹs!��(�z�E�L&͚QR����QR�c�#�4\0S0\00@���	�v12�(L� 1&U1*
D���C\0��_��c����{����׾��W��ʎ|�����g~��~��}��h�뺶m���٬c�=sI!D���/�����QO<��ALP�@c�u]{vI���gW�ZQM�Q~���׽�u�����W���+��p����|����ͯ�l;~��~�w?���y﻾�N��t6���>1;_6!&35U3@D$3Q��`�_��9W � �`�TUm�!D\"v̪hfj%�\"2���^8��g��[?l����Vg��F|�=��?��|��<�Hc�4�i��w0�ue]olKj���ҥKkk���SJDT��sc�����i�\0`��\'53T3�|i&fF��E	!5M��)Ŕ\"3\0�C��x8��}[�p8T�~������[����[Vg��.|�W����~����K����S�v�ZY5mۆ��ŴpeUU{W��s̬�rƞ�sJ �4�UQ�������������i��l6���hT��l6!�8y۴kS�
����̳s�!@H���9��cGTz�=Q�����h@�	�
jb��
�I%�ԧ(�TU����iJ)��r.\0F�M3S3��fccc}}�,�w�����^����饆������/�}���}�\0��]�ID�I�L�$H�TUX���a4�=;t�y��9G舆�Ao����MiV��!��bc�S�CJ)EQ�J�j$�����9\" <ܿ���QWu�UMf�>���/��/���o��+;��������w����)��!E\0hg������tL`&�<�c,��ꢮ���ͪv`��<y&Mh��(�.uO�fCP@CKQ��.�cJ)��1��bJA$�����Ⱦ�5M��q6k����J<v������7����çV})����~�{���O\"�/���4JRMm;�UY����#���XVkM3h��i�MSk�;��in��N\'
���o�KI�RD\0P$@4$E0 3L�Q$��R
j�d	0��!L�~��ӮQ굍����}Y��o��̒�;;W�\\��޾����ַ����+��������_��_|��\'���N�-�ec
�t:�}� ���h�4�[�m�o�5uUTU�������I�dA%Ş�l����O!\0\"\0\"�e�B�ҳ�B�hгtا8�u���I;���D��t��ᘸmm:.��1�U����\0��,�������K��)����ӏ�ʯ�����ɓ�/]�|�ҥ���c
!t};����lonܶ�����l����p���#�%j���T�E�d��\0r�>�Рt\0�����@���G&�y�
O�RJ���j�#��q���e�D�sf&!�{WTECEDOT�p��5�^ߚ��%i�g�9�MO�\0�(�&�����sO}��������=�Go%���=���������8���*#b�;j�@pPN�<q����lo�+���LSJbփ����i�1;[�I
�{����<{�䉵�$S����.��Ե��zPKb��,��D���	�\0���	\0�����R_x�#\"\0&MQ%���3Ӣ�M�x�R1D����L�����:���!��l�3���w�ws��/����o��C}�LU5�@�쨮꺬Rh:j������������h�D��Lb�;	����`)�
�1ZB00@@DtH�19�3�	q<R�.(x��G{�,@USQ3�yZ�̼s1\0k�&����aHR�RS�ڬm�w�� ��O>��w��;>����e��/�������|RA�W�\\���*ʔ��̓���<nǷ7O�V����a���*(�,���L
�>��\'?��>��N��*�,��ɴ�:�c�MUloll����T�y�;�LٻTES�|P��t�,�Y�s����/��g?8B���LRlg�����$������w�9ST	R
��\0�}�]�r����m����_������ʎ���ܳ_���?Bl�voo�p:YԪ:�
ώ0���և�m;[��[uYĎ�qn�D$\'�^�Lq�D\0�|�8Бr�� �Q��Q� �-rR7�LK�.RN��%Y�U5����ۢ�Ѐ\0i{s]Ac�ӕ+�>�A)�}_�
�&���?�����3��|�/�+��8�g�}������1bQff*��uU�lo���X[kʊ�2%M�\0�\"j���`@��\'��\"&�+��ly�%ˇ����\",��,�P\"2�������)�	\0�
:����{R	כ��f���d܅)�!��{�\0uQ���}�����m+��(p����W��RJ��И\0�$��pnkc}w��ڰ&�B>�%Q���;/����\"<B\"XDI\0D�j�f�j�5�+���#�����-ޗ�,;!�\"9�/T�\0\0�\0	qS�����p��% q��u]��)���vw�Ŏ���.\\�0�LT��PR� �j,�7ֆ��vF�k��l�\"jIEM�\0١)!!B��]i��hDD�\'�0g��,)��\".�@\\�|.
}z8)<g�z���阉��!�	�<�B��@�%���}�q�2c�m�H�53_�&I��
�d�r�=o�3��k�G1$0@\'L���D5�DI!��\"f���-T)��e���2�����A�����f�q��\0�����h�vs}��9�p��ŋvV�i�������A��ŕ7s�|H�擛�m�\0������}�kJ)F	�`Dl�6���EzƮb�,:10���P���fps�UTcJ��.�>�����~.�c�K�3\"�f3\0@��⅙}�R�����;v�� \"Gì��#�$���f\"�x������0U��#h��G�1d�E���y<�f�M����)���b��BJ���yGæ6U
�D���QTɛ��,��&%	��ۮ���}��5�:1:�ʲ�����*��)��r�)��<��^<�1��R����p{�R�Z����h�(�Go��v�ڒ�D�Rr����O��IŲi Xj�W���GjYvYbBDb���O��.�|7���9�������S�V;�y�4��)�1����}cRS��$�EQTe34u]z�ͤ��Y2�\"���f�?���lf��8\0)9Q�c��������8���h4B�<!ŔDR���e6gq���Bu)1�|��:W�;t}?ig]h����;f�um߷%�wd�A��a=Oʫ.%�yKH���I����b&
�̜�8�}�B�t�a�3���BJI�糞����,ˋ��PT��&3յ/Kό���UU�8zS��sM�\\�t!s1{`�����r皈d�r^y�Oc����4�I?�?�y�I�U{U�lb��$��p$�T�қ!�N�ӼFTUE�
�C�\\�b�Q�<�ff�9�1Yʩ~\0(��:j�Ƕm��1�$F�\"E}�]� �\"ɳ�G+@M���0D1BTT�5�B�Ч^S�L;CcM)
����=��ӳ��ر���Vw�����.�htlm��ر����i�Aڮ�YH	�ݬ�L��ho����eU?���ylt��>]|��k�D�~������\'H׮]��
ªt��Ýcǆ���t*DUS�3&��Py��g?��Oq7�U��
?z\"�.�1��̈�pP\"h帩���6)R�{����?��&��G|������_kꂩ Ve�4���v��H�뺶mg!t\")���}��=��W�_~f�3_���C_��J?�Ŷ�����
?���yٝ����f��/|�ܹs�qX7k�fk}#\'1���e]V�����zY��*�+��W5�CQHjW���q�]��v?�чBL�G�G~�?���>���~����?{���G���W�����7���^y�]w�y�������$����676��[�v�0�>���LD���M&�d2��/7*?�=�NI�����ߟ���Y��{BRY+�U������Pb�&!7��@	\0�����kW��;{����������;��ew}�s�#
�W��{���w��c)�7}��򖷜{�1����}��O����c���XUC/����9E�ٻ�$ݶ{lgc����Pk�ҁk���wV���1Z���cQ���D5���#R�Hy��}w�,L[�~{s�ua����Nڲ���<}�����ŋI�(��=^������=����l6��iA�&�f*F���lPA4˭�̎�/^�X5������ke��loK�+Ǔ�+$��ݓG4�F�����\'T���>��ñ�Tn6�U�B�/���oS�ư��GM�x�����u��>Zq�&�/�	����7>�����7Ϟ,y簪���-=o7h��ܹg����Ut�]:�
 �v{�]�]�p�Z{�
?6�� Ŕb��
Gq6��.��(c����
�xmmm0XS��I�JJ]�/�`4$�Y;��}�@������EQ�v|���f]���|U z7�J035�$eQ���g4Iۛ�����g���ԩ�ڀ�M&������7>?��;;;��B�@�3gE\" ���k��;�ض�d65�A3�&�1��$�)��m�ê,K�# #����A]
�T�U�^���ۗ�xLd��\"c�_��������	�=��&D�<3�A-̦��}�I����5:�������[�v���L�4%P3Ͳ:b\"%FbvD�CBgJ�J�����RJW���7 ��˲^���F#D���,|�ΉA��\0u�TuSU��C��ڪ�};��)�Px2P CJ�	4��3���d�*�i���|Z*\0lmm!8B��1;G 1*\0)&d�L�	
���e�|N*@^�\0���0��+1p�^2W���M\'�s\\�e=m��:\\q�E��o	�yO���+�R��\0ٜa��٣��(��#
\"�\\,[�$O��IU��a0�<����32\"�&K\"\0VxGT:�g�\0�T\0�!xG��h8TD	3ue1(�H1$黸���F�L���<�����6f31���h�@	��3t�H(����&�����h����=����/��PU����L��l��♑=1�б�����W3I�T%�� @����r�����cD瘈<�eQ���*�$\"r�T!�\0fU�9D�{B#���D#f@Dc�a��&T2@3 0@@$��#��Fm\"j۶�����zL&�\'o?�R�|_���ۘXk2Ka�M��e@UB`D���l�`\\���*�l�$1%��@�AS\"�»AU����ffUl>�^���z���+���ڗ���ev*���/b�>�Xywu��(��`@DI1ƘG�y��i�e3SA%vyu=19������!xBf$0gƈm&�h5\\�E���W}Q�޷
�v:��j8�]�T�I�;K)QN�3�$I�sIE�&5d��(HƮ2P�\\���� n�����X�b��d2�N�@�v}H���) �B�
mno�:u*�u)�W=�\0�V}�����}�c���Q]V6�u\0��Ʀ2_� 1F`&��{�(K��Nt�}�o�C9V֔5QEAUAQ�� 2�ʠ��ش.�[Zm�`��|���n�~M?��-��
� R��@QT1H�c֐�Y�{�7�a��ǹq3*+�ĵ�G��gŊq�FD~��;{:{�~G�Fa�����=L�=X��MS�6����:��\"G�AB\0�eY���	)�-�ƻH|���2D��m)\05�`��_�֤yk�Ɋ���P9�-R���Hk���ܶ��[Y�)\"�g^����$��g�<�蓢k�4ew�} \",��\'�ĦiQ+4�E=�(_�:yS!|��p<����YI�\0���0�VD:���H�Z��mCT�ẏ¢�^�ҹ2���1��6��b�-ܼG���4���H��/��ť#�&� � DHך�6!z�<�-���}�K~x�W^�g���ؼ�p�0L9C6	�i2��<\"*RSJr�*�cd��j�FkS�c2B m��դ��333eY�u3�X�6[ؾ�ؼrmh)#J!*c��.���lS��45�M���ctε�%��,�B�c��AEH�PiT���I�g:��={�Y�����k�ٳ��j����\0�$]\0FbFb��)����6ٰ�\'�\"\0K�Ne�� ��RZ��y�����ic8�V�L�̑��!T�h��]mH�{�B�HwD����<\0�ei�MfS��*q�($A�����eY�	��.��y�\'F:Xt;�U�/�����ϊ��ڠq��@���hcc�vcLJ}Qe���Q+�󪪆u=�/-�6F�~o�ΝyYE��v�c�i\00j8�F���`8f�y��m�i�A��Y&@i�4��[�\\H��R�u�����;�E��֝N����x<^�$��?��|�ԙp��7Y��.tg��+O�.z�i�>
�E!ڞu�y��}�������c��O?��#G�<�|���p��$@[Đ҃��\'�d�FSNc�E�V���WV��ࡁt\0*\0��ݝG.�����m�ÑQ����p|�}��w��\0\"�\0�(`��!��ZX(���LfG� N$��a\"c�:q��B��\0QY��D��v�������7}�+��=�ѧ������]���
!�(��,˲Lke��Ͷ���QT7��ک]k1�1f!���� ����]�����=����4F�^��x��=<�v߫f\0f\0v�������\'�\06+��L�&��):���lj�(��(��G�P���^��\'�ʲDE�~��[��-�j�p}e���漳/���s,��No�I
�8e�\"��R�&���&T��#Gf\"���lAG�чcEX+���j�(VQ��5�C$h�k��ǀH\"�9�l:�P���1�CJ�m�\"�X\0Y#(=!��;�m}�12CD	�*����<����������p�.}_���D.l֌�Vg1z�-N-M)�c@��(,�\"�DTAiT�E�L�$��D ���cT� �jQ4\0�QAXE� ( \0\"\0V����VZ)MʠV�\0 &�f��%�q�GB12 RncRFD�w��%i\'�����.�����g1r��֙M%� S�B1J��d\"p���F\0dA�I�*0��CĤ��7�p�BR��4�E)Ԛ�=�4igF���6s���H\"7�u�9��-m�j��8\0E���On�����k�ښ�DP���<�\"�8���̬H!Df����H�DH����qK�D�<�\"�&m���f��<qM�\\	��e*s��F�\"�\0�{�}�Q8�qq�\0\0 \0IDAT^C! E�E���,3�y�Y�1�m��>����V�Noe<��F��Љ��0��J�D�DH���D�x�\"K�1���d���&�8��N�8z��6_�!7M��b��RʘLE�89=�X\08pd�(AR�A�\0u�B��m������Pt�;��o�o߾�o�� @��A�%ƈ�ED�ھD&�\0� D���5�0��0�	��f[4 �&#R�(�9�}Ua�����BŬ�Ň4�8F��\"C�i\"P@!��Y)C�dE���uo4�1�m����m���N3�y��u#�A�Uix�P�F�$\0���Y�Xp\\Մɕ�Q�ɑz�#H�lF\0�H�ȇ�F��sND&��:Dٵ1J���Dd�]N���L\0ڶ���9U��\\x�;���\0PE��n�b<�AA��E� 
��6)������s*P@�I0��0B$�1J�BAP@��MU$Tޅ(@H0� Kj�����- `��D���Pe���v3�Y��u�v��u����ʫ���O|�d�ͳ��aW�(�c�AD���\0Jm�H���]�qS[�Y�	�E�H+c2K�\"��UF&#�D�Q��v�+kg:3�j\0�ѵ�\'v>@����(����i�����E����[� �\"J�фZUMkl^�
Dg�(��,��j�Ս��%2�N������gʼКn�����ո�������ϿP�]��C;���0\"�,_ZY3Ɣ��Z%��(�}<Qg`���P��͋qۚ�8��Oc�$Yϼ�ٟz�Ѭ(�kA\000�\0���|c���Ga�<�]��Q3s�j��(;��`�~�ȑ�ں�he��u;���nQf�]ZZd�l\\�\"\"-�,��:??�}��^���\\��a�|p��S&��@@b���!�\0� 2� 1Xk]����w����1z�d������6_\0`H����f���9pt�	I	��iz��V�����\0 /lYv�,/�\\��mU�q�2�CF����u�
��6���#�y�E�eY۶�n��(�UVMJHE�Q80��7M�Xz\\ێF���aaa!����m�C�Q\0\0�`s�����>O&���Dmˢ(.=YOc��K.��KW�ƨH�6�$#<st*� (�D�L����
\'9\\�,��XI1�]�Cs�1z����.���ȃ�IXi�7i D����Zk�!��68��
Kct3j)U�CDH@��\"�>F�`���76!+��S:���S�FJ�L`�M�Vk�sMً�T������6yr&�9Z���x�!b`$\"�JE133s���Zع���7F��KTو� 1�3#*DF c��i��j=�땕�Q]�e��6�4�1�b���]c�x<n�1�\0@~��<\0\0��>I���H)
t�\0\"h���v{e�ӱ�&ZS	!�*),�\0��|�X�!z���ZYkrm��x�ma�	P����h<??������g�����۫�`�N9��D!	�j�8�1�8l���[�Z�Z��B}��&cnMQfeYZk8��\02���!!T@�(\0� U��7��6߹s�p4Z��{�����ה\0p˟WW��t��ɸn���|�o�\\_]�֎�y���6�N5�`2�̀���d2ylP1���� eX֦�d��JJ��j��6�M>ͅN��TeR���B EI�9�@\0N�Q;ENF�ñ��n�?41��@@u�����h���7�|��笭.w��R*�\'��$�����C�I	I)��1�j����6˲,��</���D�i����#�I�\0@�
1��\0�(E�)$@`樌��zff�ӛY�*c��/^Z���>�T3+�����ӯ��`��TU57�m}ii��=�p���m�pcDF!D��h2�&�Z��қz9�YEBI�G b�h��@�ƴ�Bf�@!LM\',䘑d��Hě����eYfYc��ZH9�n�����m�Ͽ���S;���᯿��/��Ƕi��B�|��$�$��hM��d�1�Zc�1\"b�1�hk&(ED�k��ic7���$G�Z���L�Q!&;��QX@8�Tu�g��9���ƵA���=����x˶�n�i��l�?���?�я�\0{^Y^j�z�g�����^�ε�\0s��%�J)�h�	U\"rRZ+�I)��,�<ϊ<�sk3m�2�*M�Z�T:5Z�&�6u\0&��DDJi!%�hI��
\"�R�ssU�:�6/�<߽gσ=*�;��[��fw�O	��)bA?�����I�e8���溍��y�dL^FĈ��4*��Q�d:S\'đ8\"G����qp�;Z�*�Ԯ��*��榛�na{E��m�ȁc��\'DTH
)cQ�4��#���fg��q뜀��;v_v��u�v�]��O|�//>��}�Ck�1z2�_��|�o�g�,/#��¼�ݵw�y��/�rd�A֛�Em�
Y@�|�m�B]�c����6!��)8���ڻ�w��+@����K;պ����jmitF��kC��\"G�~غajϞI�5��e\'\"9/��%��q���=�ٽ����%F��Ç�������w�i_�m�>���;����o|ù�Hmۺ�J�q�.��W\\�ܲ,��>��6��o���\0\0Zc�%T1�M��	AH��1x|.�B^����y�]>qG:�}��ѧ�\"���nҐ\'\"J!)��B2އ��D ���5�����y��G�����ε��������ys�g�9��JNڼ��8���K_�2\0������eYSŦq{��UJ=�ٗ�uǝ����ǹͅ96.�sA�����>�8�G���8�w��Ha���6Abz%	�\"��$\0���Y�oYpS�`�d5@�F��_{]ٟ����8��jr�̥�fY��c�>��_^���|�i�~۬W^o���>��
D��S3����h~k�I��B%�q0j�Nwn��_�E�T.�{�u�Q��]]]]YY��z��﮻�z���������/}�O�ސW]���i�~K�
�JG\"2JP����(�\0�Z�A@i�)
0�F��O
��4!(\"E���HHib�}\\|��WYY��f�(�f��>��s����B6Q��VDڶ�t:1��`��2�\\�����O��U��袋��Mg���o����:]{�\'H������Mۋ����[��U�C���׽^_\0�����:B
#%����X��Z�	G��^��/9�X$�41KV瞽��;x�{o�
���7����-�����zGUUEQlll ��V)���Ɉ(Iz�\0���@dR�|�Aڤ�3Z���P	 ��g{3���.{���֛��<>;�7�AgLUUk+��}�eE�ܱc{nchb[�o9`�H	j�D�	����Z�\0\0��R�QY�3���1HV��1�QE�<��+�s�5��|�Ģ3�_�b�UF�$��0G���Mwj�bii�,ˢ(�yeee08p`vv��r��={�;７����
���fZ)���dP�.M�(O^eY&�s\"2ƈ������rUU��v\0���{��_|���|�с��U^�4��>p����{���8n�uMZ����Zw:���\"�V1ƺm|ɋM<8�\0�q�<jK��\\>|�m[c
A \0��b0X�����+��v��]w��<��d ������o׫��t�g�zW�F�f�j��9��X���	��1
	wm�nfV�b�(���#+��r���?�tf�6���(���	$\"p�1�$\\&��&1�S���4���y�gY���\\�����ۿ��������sN���\'�4F�Xu�Ӎ�n��;�������ӝM2���x}}=媈\'Č�f�}��s�J�KP��Z��������D
>vʾn�Q)-�����s_�]/�F�>�������5�2�;E���nP��®�}�b�!�e���NQ�y^dF+4� Q\"C�$A�6F�����s�x�5/��NwP�g�m$=�(\0He��p�2�il�����T�(�\"�软�z4m߾}<�F�,�RA�������/��y�+_t�[�E/�\0~���	O]�~�7������~�D4�TU��1жDE����=��v�\"�3�<��<��$��T��D%����ɱ�I�U+�.:Ff�DD뜟���!iӟ��Ͱ��E_r��/}��������`~nn��m�����ʮ��I_��>z��́P��jm�JV�*P$�\0Y���4���g_uݕϻ�33�zȳ\\Y;�mf�N*�	�\"��E|���\0�Tm�bH�ƣ��v�smۦ�l�M;s}}=�/�
���3;;�����O�k_��{�9�^{핯�\0��=�5�S������;o��-���m<�(�I�{���!�����J�hrmm�fY�eY*\'%�ཟV�7-�A��HEIxM���#	D\0�0���f�/7�ky���tzd�k�{�+�<�w��{/�П����u%b�5hHDM���(4��\"m�!$���QDĳ4�oTu���/�����WdY���:7���<Z_޽��q�l��T���B#iD�0P<1�hZ�1p��H���<x&%\"�
\0Eaߺ�*�����o|��,//�v��˹->��-2]d��!
GOrKyf��>�\"\"�|��܂gY�nﲫ^��k_)\'\"T��4딮����Ĥ�|�]w��/��%ϸ��)��\"�i�]�vU�a�R!�4�\0�{\0�c>o�U$9�4``�����)�t:Y����/_XX��u��ի���ϒ��0>]������?u�W^�/z����z�o���J)�٢S���7O4XDô���^\'�n5�[�x@�[���	e�|��w6�M^t|�\'�A\0@AF@A@Р�!+�����u��[�����rSF&/2��GM��Xŕ~���¹�9�����D`�by}ca�k�f�j��;^�Ͼoa�9�
FD�$H�r��L���\0P`
Xk4ڦd��H��t�#*[?#�&d�� xN�9�\"���������?��?|�^xa�\0|�y�\'��%�����N��n��O�9>��Ç��ԧ?�1���QQUU��Xk=�*�L�1�H�z޲���TP>���#���;���Ǘ��z�o]��/4M˓�J#���
\"$uQ�6t��\0\0 \0IDAT����-SQS\"���a����T�6m��M��ݻw#���7����˃���ڲ�?ڎ������S蠟x�/����w���}�����������p�|��m��1�齛�Nd�3H����-���	S{��ŎY��s�e�IFu�������	�ם�[��\'�3����t�ص�\0�\0������j��t��p�����`��ݏ^��\\ޝy��~��YPyw�B�5��<Ԕ����t�D�i��Gf\0c�q�5�	�\'��	��4�x\"dQɤak��(\"��8��laee����ϲ�S���s{/���No�w�ɼ�O0��w�b{�������n��Gqy5���_>r��C=��C����UU�H��M�0`*FD��x<n����L1��Tl��Ss�������l�7���D��tVVV��j�F���T۶�T�g
)��9&Н�ܛ~��������G>|�=wn_��u��ե]��1��3k�l�mǙ�,�=���g���?հ���Ö��9�xP1�;o�
���4atee\0�a������ەu�ޜ�S[b��)�Q��M3�z6�LNDb`�6\0`�APj88���r�]��������\\p���<�?���hHz
���3Ӕ3!\0cʺ�¥L��=��׾��ֲtB��y�-��y����-,,��̼��/��g�_��o�M�ӿ�;��{��CZk�gm��t즔RZ)Ī�&�EQ���I����;�VlMmô:���V��\'��)�O��r�i��{���翨ן}����̊D0&�]�����ř~Y�����%Ϲ��w���g���
�����Q����Sܣc~�4�J�[k��=g�9��ǘ�$z+�Dc$(@X5u�^[t{3��Mӌ]��9W����q�7������Yϸ���{���i$ɭ�Z�g�P��R�����d۶i殺����T�\0�\'Nqk�d��:&�zj���ǧs�����\'��Vy����pc�����ko޵gϞ��:믮?�t~�/Zk���?�%|���1����7�p����G>r(�2��mۮ��k���Ζ���d?�fYx�R��1u�TLg��9\0�2 ?E\\u��1�[o��V)DT��}����+�ڂaf�-@AfD�( �� ��sжm^ز,E�!�f���>{�ʑ�������v,l{���3۶��X�%r���;B \"���ҷ��I���c�F�H���M�@�e����x�R�O�������7<9}r�%�{,��*�,��k׮�~uu�ȑ#w�qG�۝�����=����v��n�֯[\0p~�K���hGo�h}���~���~����xz�F����鳟Z�d��qAƖ��1��t�&�������(8�?)\"�*�u��*�r���u][�����Z`K���$�Ed 2޷E�p^ 2��z���C�������u�{��H���:]���-\0����\\�| ��զ��l��G
ȓ3�ٹ���	,i��!t�]c3�y~�@��n���5��ܻ���6���������3�46?zl�S�7/k��sdD��:�51�]���u���ˏ?��}�zL_}�s.���{���o��z�^�������0j���\0��	}�r��Rη)_N[���G����oc�yn�,H�L��=n��֚����L����� �CkZ���y�g���7%VT�q�=���������}��Q_p~�ԭ��㍍��R/�h4��D���bL{�8�8Q\\H�[[��V\'���x\0�~?ٶn��r�o��1�-�L�ք:����r�%�����$�tDI@g(�b��t���e\0��;o�����p��l�b<c�v���=�m~~nnv8<t�f�)�,�Tu;�iKʺ��d�IT��4=b�Zk�۔�F��~heeŹ\0��j��kb��5AM������������t���q>��G\"\0!�t}�xl�FSKkUU��`uu��t`�>��	5�2eY�m[����n���sM�Lϵ�P?ŬW*���S�y������[{��3���GDK*�YR�[.//�E\"�J�[�R@dL���������������m߾���g���v~[]׏=~��v���;w�����ݯx�eWD·á2��B�Mި�u��6�����>Ʀq�(T\0|Ԏ
mn7�	���0� \"#Ф�Ez�L$�I:��
���lUU�Ѩu��1J�	�`�zD�&S�N�\0��g�-\0Jk@�!4��,H�:Y\0I\0}�·Ȃ�Uzq�gdH_���G�!nڇ�9}L��o�5!Q��K���h4����N\'%m[�Z��O�#[�B:nM�e[Sࣱ
s�ֲH��ƚѸ����gfI%�R (�E[խ6Y�M]9����Wܗ�y����w�}`�\0��\0H�%J�U�AY��z�HqOg2�v��œ��L�O�δ�T��d��[V҉%Şx�
��/�&)� A�@\0Ľ�{��=�ǳx�q��x,���}��}���{��$�ܵl�q���
u��M�S������O�A�a��\\p�}׎��Z����z��/�o1MS�I,N&b��S�T榧�`�LgowO����p�0�i.\\8s���w]?�TKU�꘼�8�Q\0&\"HQ�_�(���h �uݲ�j��bdA!u����\0W!���u@��`\0�Q,WVVj�Z:��F�*b�c��o�4s*�U`0�tdxD������f>�9Q��Ȗnvd�9��\0��9�V��bB�@Q���2\\X�yŃn],z����cb�֡lW7���	�m����Q,}�)�K�D#��o~������������ٛ7�
�\"�n͝={F�	�!\0M����#�(���Q��R�̗R(�	<:��!�J�R>�w]7�JE�Q۶�|_����>6��4���I���A������OVF��Q䣆�,�:����,����5#���t1P{�l���D�c��]31��Tjp�0XU���-��H��}\\�-�������RDҩ����ܷw�o��o�ٹ���KǏ����-==�<����ӿ<iP�ҋ/]�vmvnfϞ=��VVV����������G�%�a�5e+\0�5;;{��I��u]GH\0�d���H�M3C�������:��P(�k����\\�R�D\"�L�
uH�@��>n�V�ne<-\0�<���pb����*�o��{�Y!j�0���!���͂��
\\-U?8v|��
\\��\"�H�Pd�Y�U*�t���9�D\"��j�ba!L!�4e`�9H\'lz>�_\\\\�
���H;+�),84no�,�+	�K��fh%��E��\0PI!��
v`�h�l�U2�Wվ*Anwn8���J��
�S�N4MD6�m��
��aɅO	E�`D�@�j�dr`p�m� H�-l���B��;2��gΜ���_�[�h,648�J�G��ٵ�s�?>�{7g��C�x��#?t���r>�����ݾ������ΡC���H463;�	�vf����95����<���
G�7gf��(�ccc�H�Z���q\0���)5����wuu.,�\"��#!)���<�Q;�U�� ��y8N�b�s��b���ͅ�	�Zcm�/�`:2�
����m�Vn5g�tk�����?01>����_�LO�w�/<7q�ґ#���oUH�ƛo�ܽ{e5W(���R�|��
cDc����j6��SP8�U ��+W\'���&\'\'4M�
E#�xoo��z]]ݽ�}���tB�1��B�sa������m�/RJ���D�a I7������M�e��	��M�޴�v�\'���v2J)Ѡy��?Ȟ)������D}��u3#�eRT�1�&(Ά��і7��T\"	��$6�V�q�	��z��F�3s�9���3�ݳg_2ٱm�6�X��\"�~��������\\*��������K_��w����>���7^�D�����K����ŋ/��k�7�Όi��sN��%B�t���\'�OMM�b�t:
��L����i�
�\"�P�3�8����N\\dT�;+����_m�����o5�|��E���������C����:u�ԃc�.�^�����#<<�}\'�����t||h_��=�n<ǘ��2
)�����z�3����U.\0��B����>BMZ��&.�i��ZF�-)�Ͷ���}��d�=���p�8��p��)�}�\"I�p�^�#$\"������b�B���m�N��l�\\�:�U�4�4ΰ��#�	�4�H�!}�����e��#��	�\'><u�ó_��_
�B>����x��G�K-�<��e2�*]����D6��7X�M����ॡ4��S��5(�S�E���I�|d�1G�
[�Zeeu	!T����J>�2�l�߻S�?���k/|�9S7�}�p4�tw-�,�ؽ˰�\\!���&Ɛ33MSy�R�w�}7�N���CO! �T�� ��u0�������RpC-|�D6�=�+
�| L��^e�0���~d�kl\\����h��#���=��b�Z-�J�i��G?��1�C�W_����,b�}�
!R����ׯ_/�K/O�kա�a�4~���:s��m�v�J3l3$�����P4R��1!c׭�� &����߸q��ɓ�<gyy9�H�B!U/��$�A��5��v�7�wU��y�u��69�(��P��oE�IC\'RU6}�^;�|ztjj�����o���?��x<�8�Fu��r� 0+�Z.Zv$	��)pTt]�T?}�t:�^]Z�vO&ӑNWj��gN3&f��{���Օx�S ��~�R�\'�,PT�h4�����EMӖ������\"�G녏�ˀZ�і�e��A��|�J����:�\0��7���$Y����d̴^�T�L�K�NJI�fbU&��q����^{��{{{�٬���;��cI(\"E�ᵵ���Y`c\0�c
�c3���*��Z!?�ۗ��8�λ}�k�bWo��{5��f���)�J̓�ÕJ�H�X,H4��[�B&[�L
�a:t(�?��CCC�\\.�L�u|��q����+�\"B�tsr���;2IM�
Œ�yR�3�wƫ�p$�N���fg�z��J�Zsy�����|:����²���D\"�Ԫm���	�ܞ�A��R��w\\��[��Z��\'�)���m#�L�,
�X��:���Xl�x�\0���	��R	jk��mی�>����I*�m8	AW�OZb���\0X�	��V�N��x��{מ����nj�����V�5�gB���\\��\\�6991���-�W�Mj��w��r��e˖x<~����~�k_���;������+����}�O&��b�2CꬪV\0�d2	�<)��xȲ��Tʥ+W\'	!�A
K����t�}OǩT*�r���K����l�4�7n���z.�z����\\.������]�vΟJ���ƺ���������--.�V�^��舊\'����jc���� �5c�JFU��`-��e�~�h}��iORsC�f���zT�(d~���u۽rW����#lUPTVLX�U*�R�T(���gN��.uvvP
�¶�T�D��e7���ҫ�l*�N�5��>��m��n�T`�|��hw�zT9��G�@��֣
�Sz4�mF���9���JT����G�&WJ��t]�u]Р�Z�R�K�B!����qϞ]\0��r9�q$y��w�޽��h�:clfzz```zzzii���wyyyuuuff�t�%���U
R���mNݫUQ)�?\\E�#
Tm�������B
��-���ʼ��S}~�_���6*~<�y=�8�%�T�}}}ׯ_�=\'�H�Q4��
INSERT INTO employee VALUES("KICTC-STA-0008-2020","SUBE","JOSEPH","MSHANA","mboya8@gmail.com","�PNG

\0\0\0
-0,�9ځ���wFFWeg��J�7ed���Kw�
A�;������O)�߱�LE�c(s�ȻHHz�Q��ǟ?���f2X�0w8���Ī�Wm�����+�z-��uBĽ+�2��H-E7�c\'?�u��)H���)���HN7ݛ����ת��f�����I�$W`�~�tjh�\\K��U���:[n��֚7����ū7w�>|��K��u�=��簑�:����sr�ɕ\'?=yÜ�V^e�Ֆ��ƚ���e�ݶ�������8���g�yӥ�n�����q��^~��מ��ƛ����OZ�ӟ>k鏬ٗ)��g�u��IpR�32f%�qW(hS�bO�XPꔳ8����SV%�$e������;w�����[(��*o�G�R�ߑ���������E֎�f���
/�>{o�l��|q�=�����LT|��y̹�9�&��ڙ��T�H�^�E���E�f����M,����Қk�w�M��8>k
�6� �Nk�������������8���v�}�$0��UBo��+�y�{�w�lfe��<��mU؜�{F.��Б蟝^��p��*dP��[Դ�԰T��&ڞ��d�eY��Y�y\0�wFB��w����~��fV+�As�Q�4�ף��t-���N6�mc�J�Cf}��s�?��q@sW�w�)5��
!��_ZR�O�Ā��O�{��mNZn+��-*?[=z���M�R
P״S`����Tn\'��Ҽ�k<X����ۺ���ڲĢ���l�0fV�3��g>�ͬ�u��h��e��[���k���$A6�:ܔI��75���skai5�~�\"���wG�;Cƒً�W��@�����:����r9�)ġ�[9�{�s�2�t�JU4���_���v���v�� �C�I��P��
����h_F�����!}��-� k:�������~pA�����܈��I\"��@S�e�k��vT�e�[�0�/ν@ח�yT�]U�)��<�}Q�u!�l�����n`ܥ;���������r�����Z{�x�Y��k�`S��X���]yP�t�__Fz;��$7pz��L�D�nX�r孊�o7\0ه��#E(���I�2T/v08)�`{�jo�B1���+�O��}�ktc�a��\'Ӏ��R�����:t�����jW:1���@��M��TA��)XJ�PŰ�8�JG%z���˴�^,���k�!�k\07��GU����_v�8ѧ�.�G�C�����
�ӄƎ�98u�Ƞ�\0۬=�Y�	����=��\0!(�xɨ�g\'H<k;�ZtQ�u��+�V�է���b���lر����Y�Bi��z-�Et���PΗP�bx�o>��k\'�� �,tŸ�K`o�\'ȋ�w ���x=oz�_�{�
����C픍]�+;�&�����qo��݆���(s���[�j/2�5AQP�Mi���g�ǸXU<��
l�\\�����=a
�6Ya�xe�[K��u3kľ�3��Ç�:�8�A�\"(�Kd�엘���o��UHї��צ���g�?��Y�Sw*�� �F��wX��jj�rz{�A�>^/����	�-*a@]kIN�FÇH)�\'�E8�m�Pt;|��:��@ʄb��h.�ܲ1��F#�K���	�3`��7q᛾�q�[]!��ҍ�{��i@�
�K࠯g�P��C��K���r@gi\0��/�l��h%~O�%q*�~��v�_5�$�*�cc]D�PL���pF�]ٚ������	\0�g�fhU�}�\\��07�����8iϱaN��\'�`W*���aw�-��ҥ�`F�W��Z<��8�~H

e^�a�� � R���\"A��!;�%�?�
�o�)é�
�D�r@)���ts\\�DH0O��\\W6���D޹P�73
l��\0���*(FzM=w�5JOm�|!!4�E��J��nA4���Ea���Ȥ� !����6��T�?�қ�5�\'Q��X�Å�-�K�p-��)��Mx�=W[�@�<�J(�\\7�z\06�o�L#\'���(���BAj��򈨷Vm�N����@(���G�M��wd(���\0���)/  G^����[��!$¯/V�����\'�*����[6���W���������\'�0GJ<rR����n,-��jL\"�6#��E�)\"6 B���*h�奨�`ޥ�$�T�#xg��aB����J�v!^``ati6L��Q
��Pc%m92(�AL����0�9�nZ�\'5Q��q.@��������=�\"��t����<P �E�Ϛ\\�[r
��\\+Նu��Mu����%�\"�J-ћit�r
�^Gg.xb6���JDY�����{�x�#��m�����`s~�~a�}b$h���(ل��ʶA�X����+
ҕo�m
��/�����e*�,�I��^�T�h�j�|�Q����\\
��x��s�5ӦV\"��
0�ך��ۢ�>�|��a	m��g}�:5��߄���h�d�)m���W����$u�U�5^���5�Q�S��#�B�HY�	�.�w(��\"�P�}��9
���ok�yJ��4,,5���Ƕ����.=IŸ�N�2/�	�B�ʗDzܾ-/�(W9���i�,�����5��j�Y�)\"�ߢm��=Ъ�>m��S9L��\0�����#c℃�im\\����>�9B����	^�X2թdiR�wїT�*$����%:M� #W
s�
�̟A�&�M�͊�Au��B����$���������E�M���xD^G7�(����MN��
��)���pK���5U�f���Y�G2�zE�F���B�r\0>��2
�]6.�µ������^���\'��z�A@�`�{�gS$)���\\r��=�N��������=��1;?�cd��Q#n��K0d�tFB�C�$�F����^J�Hfu`jt�ųP��y�cn�ҳ�\'h*=$V0��7LL@\"����\\{Bd6>��V�W�ف����ҋ���op&.�)�_���R�I#StZP��!�����)��t�Փ���>D�
ѩ0HG�U&�%�����X,�8��F��-^��\\�L�믨Z4U��\\G�Z�Y�t�A��u;4Np�#\0B�\0(m�!62
S��*aK/HMZ��x�}�?��,�E�F*�0s�
o@M;J_M��S�6t���F�Nό�����x�*%��)��J!M�� �u$�d�_��:����Q����#t1�u�|{�:Y���b@�c*���`�0\'Q:����5�
\0Hh���3%W�! �!�}=�]�T>5�`vj�9Y]Yf\\�L=D
6m�}�K���2��+f/}�~�DM�	��º#J�_�(ل�N��(7�6�7���q��o�d�?�Ֆx�Ag\'���iд̙�R���qum�������yH�����O�
I[E<���,�P����%����si�wK�&�/������C��oR���Z�U��\'L�&>I<Xr^e��ρ���PzWFY\'�&̚�R�Uf5>R�$����g�$โvˀ~Q�̰�!̚�\"a�Y�x�H![Qp�h�ArʠG��Y���f�	{��d����ۘzc� e%�ayn�D�P$j:���`&��=���Fd�Z�YH�+�#�Z�;g�]Hu��Z�
���L;�
a�i ]�hƃQ��t� ��]���ڈF\"=�Y����&��y2�*K8P���H:��F�I�����qt��v�X@F��:��Z���
�Vh���Ф!Iqq\\�,V\\�uup�\'G\'E)��\"���q�=�����
Sͮq@�,#�L�ܪ|E�0�>����(��Y_��Iu�Y�}V��7��g�nX��ӛ��y�8�J�B|N<f���.��ƹ谟gF�Lz�8J,;X�`V2T�)☢j��Ϻ�p��Vj�uO��p^[Y�:�!$��%� ��2*��]#�D���A�/�K&W��B�������l��䄛N\0�/��1w�fݶ��m�y��+���6��O��m-vD����&��;���.�#h�����)���5wn�s�>\0�U�88F������ι��Ӛ�C�r�?\"?\0\0+iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:1ed10b30-0b1a-4cfd-8e73-d4610105b512\"
   xmpMM:InstanceID=\"xmp.iid:cbc4ef6d-77ac-4f55-a5ba-e3227a8f85e2\"
   xmpMM:OriginalDocumentID=\"xmp.did:a3816f4c-cd8b-4a16-9feb-9bbd8b6c9970\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1602734564164505\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:59e653fd-0c86-4353-87ed-805aff6aa52a\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:a2701471-e278-428a-87fd-1fcc37c03d93\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:e755cc75-83e4-4742-8548-ba74dabfbdd3\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?>��JQ\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�
,T5]~\0\0 \0IDATx��i�mYU&��1�\\k��4�����޼�Ivd&�)$�%O��ħb�`QR
<-}���z�QVkeU(��a/��aH)(R�����>�L����v�֚s��~̵O�D��xQp��[_�8�Ͼw�����s�ߠ�n�z�x����G��=z���9ڣG��=z���9ڣG��=G{��9ڣG��=G{��9ڣG��=G{��9ڣ�h�=G{��9ڣ�h�=G{��9ڣ�h�=G{��ѣ�h�=G{��ѣ�h���=z��ѣ�h���=z��ѣ�h���=z���s�G���=z���s�G���=z���s�G���=z����s�G���=z����s�G���=�p�[�?��u��[-ƨ�O~v��O]vӗ�w����?ش˃��s��8{�������A]ף�`2�\0�������>rt�����-\0�f�����^�ѯ!��?~�[���w��݋�bw����>��r�jΉs\\�>����N�ll\\z���\'\0�on>�[����{�wo��c��\'�S����/\0�����.��ꞣ���-������x����?���|���~�]w��̙3��\0\"�\0q��+��څjcL)��������	O���ɓOy�S\0<�����:nV��-t�~�E�[�9��K�����������}
\0� %��v��;~iS�\0���S�.;�������\0l����ў��_�Y�q��^��W�Ї>T����\'���9\0\0����Ǩ\0B�9\'���9�m��uBV�l5�����0�#G��������:����{�woo磌�
!\0��珽����{������=G{��~��������7�i9_8~��d2iڥ�ֶ��H\0D���\0��{{{N�!G�$�cT���z~J]�mۚ3{�8��#��8�`ooo8N&��|c@	��%����m?��~�;������ƿ��?y�k^�����`08z�h&V�\\VUQ
�(�g�� (X2��eb�ؐ`��P�)a�,�ֆ:�ȗ��T�9�z��!��g���|�������=���(�w��_���y�o\0�.�����^Z�����`�DN��&�i&�1��x�f�2��X���8
��\0�h�l0b\0Fv�{���H����8�G�6.T	�B\0�&���g���>��\0L�������7��ր������{e�^��������|O8y�6u�9����(3�
���P���t�y:I],��?-�$Ιr�*��I���cǎ\0x��<Z��?o��G��hix��w�y���EQ�;;��flF0&0eF(� #2b��;l��Wq��[�O��3ya�D�ʦl*G�Ys��9���Ή8G��y��81q&B\"Dd#S��ާŜ�`1�c�m۶m���W������>�>S}٣����z���+.?qt{k9���\'���DԹ�d \"!#c�
�	BF0f�`eI\"ʜ�%���#f\"�줊�sLD\"�L�9�r�r�s�!�01e2�)t兂\0uFԺ�)ma!&������j0�5mД6���ۯ��9O��|�z;�����x�U�z��ӧG��h0�����ڶ@P��)�1�L&�����V擲IS��XY,�����[�LY��U=���UK3S��iEebQe1/&l̝�~Ȏ��?|UE�̇�\0�\\Yv-��a5V��i�o{�[�|�_�v���4��w���7�p���M���54�wlJ��NS602)�Hؼ�0|����&�7a+
qDʤ�	3�UU�sy^�����Ꜹ���R���;_8�^X�{̘�!5!��Ta03�c��1;�9\\�	K]�32h6�f ��gm�VU�L!������y����SI���ܠ>zb���i�c?r�����\'?u���\0.?~�Y.��-�Ò�A��D��?����!�݃XY8������]��,�\'��1̠j��Q4&#\"K�9����IE��L q1	u)[\02����4s�0�\0f���^U?���C�민��������o�ӷ���k��`smmP
��x�r���m1@B@�L��)��P�Df��q�a$��\0���\0�>{������z��N�ގ^P��v����\0����6���V\0�m�By�9O�˟6w��
���O�Yf�����\"0;far��\0�(��o����^R� !bVOB� %��@B�r-
�y7x�ʞ�&���uV�˜vv�;�f =w���ǎ��K_���c\'�$�����o���������}�����)%�:�6F\0�ɕE$s���d����w�L[��
\0��I�ŗ�/P�9��ιL͢(�<�W�
��)%KIV
� 0��Y]���H(�;t�U�y83��`;<bmUCz��I-��\\�7����rLʫ$)�A���2�ʅ���a��X.�m�s�bww7�֭B<̉<���C>�p~I�� �;�~@Ǭ�oT~d��y�C�ڱ��5�[]\0ƀ�)�`�K��)@!�&`�VE�1M�d����S8�\0�&���RY�eY�Pr6����8{������h\0S\"�C_���ѵk�a�-�j����R�@��������Y{8p޸�W7�F�;�4�$;�`&���Y���@)�D�@M�\\[2 �*���K(���\0�K��Tձd�dgo��ٳ}~��e/�^���LB��Ĳ�1���)�p�]eL�����H��I�!�Ư��y~��=Kք<O�
SZ}������o�jXO	1H\"g`���\'�iu9�
�fu[�Pa&f3���*JK����\'�E�{:��\0���n��(p�Ǚ?[�2���v�i~�����CO��d[�KB]y�!Sz�{��΍�7C2�<Pj�A��;��DF$$BbD��)AW�71��Ƈ7�X�Fj�sf&\"�1%������µWS�_\0lo�,y/\0�Ub3���<�f�ԕ�sާkc~�X0u���z|uf��W�!u�u��\"��
�2/#(d/����Y,�
�����>4��*��j3���rd�ٳ�D�\0�O��SJt�~�7G���zpp0�Nl����w�asnuW�LJ/��\0�A��kv��V3K\"E�Uʳ�RK����Y<\'���#��y���q�`0q`A�t(�!:\0\"��ڠ�B\0D��D5&��\0$bZ��%��hԲ^��
JI\0DC�j�UM�4� *3{#V�lHU�J��d�1y(w5՘R�����p0?u�TVs��
�y�4��v�ja�1
�	�]&��������1�b�R�Hx/+��,��?�h��Ln��*Q�3�fFd�a31wd7;�\"bF�i�C�\\2�d�\0QjZ5[��u1bP����L��n�|YjJ!��i�q�ѯ+��i�\'�Ҷ^�=}f4�\0����G�rn�j��*��QR#I�$\0Thc<�Oɋb\0��##��;_��W\"��E	��\"���W���Q�!��f	�R�@��r�,|Y8Z��S]���b�4�d@�`u�r�Ų^�@�(�Js�����T	{�\0���x���B��:���^\"���<�/V��ɻ�9������Z���B�+�FU��̍\0XN��:F�\0�K��Ϋ�wꎝՔ�a0���¥f_�E5{��\0�w�I�(�d)�-�4�
��ke����٫�����p���{��{�\"ۧ�Ej�.	�ҪA�:����a��C�
u\"�>ED�����+���/�\'������`�g�x��@��R���jl���;�1�2�y�&\0h���O�g�9�2W̦ͲIU
!�.��&�
�U%\"Ͳ>H���\0
G�ł�Z:��15#�h�O�B�r(�aU�\0t���\\��G���J�www\\q�q�%D2S�ٲ�d�v2�<)��y�}Q�ιB�1���e�ò,d<�˪��P���)�96�\"�ڔMF�X\0)LU�������$�9H	!Ĕҡ�y9L&��(�l:=\00����1�fY�:_�`H�14�\02�
Y�41��l�4l���\"�RSh��L�\0Bl���u
	�i[\0��@8��i��x-/O�{�x��j�엨��0��_��g>����.ZI��z�s� 5
������+�T5h
L\0C�nt\0@�d�r�1v����1�%�1�}c�{
����ӟ��=_��d4^O�y&]I���Cְ�M@����U���o��6\07?��;��68wٱ��r�`�ic�yR|��wmX��_��b�(�T����.�����[�D��
�
�N�m͆�A�%JF�!�f�X�F3�\\?Ƥ�����#)��1d%>x/	���v�(��l��8�I�\0�z���`00\0��!��B��n��)3�΀�a�,R�D��H�5M1Y�����t~�
\'e�-�z^W�!���L�9��[�S}����i2K@�]Q�CCHM�z��W]�_�^��������F����@���(�t�p%hL1��K��RIUs²�<l�J/bꚣ��ɲ��{�rRs6[��^�4�uڳ)%�^̽��\0A��/���;�K\0u�(,���f��0HUu2\\���Tލ�k��~K2�USҨ�F\0HJm�F���#iJ�U�\"\0P9iC���:���ݛk�����h{;z�������`_M�Y��f��-��l눺�ñ��+�\0�\'�b8�\0��|^/Ed����d-S�����5\"ԋCj�d\\@0\"Wl��&���X.�\"2�/�z-w�r�SW�A�I�H�*[n�L�[,�`�wܯ6;(�XV��b���%�����/z�;y��W\"��Ġ��j��N�V�r7]�&�W:�D*\"��{w��
�0ǉxQ�\0f�Z
�lX��w\0fX���p���\"j�\05^6���NՁ�0��-�KvҶa:�p��ʋX2ʋu�Ҋ�Y�]t���I���A5�ـh]>����i�+\0����ޞz;z��5\"M��$03R�UJ00ČT�8�:Ӽ�0�dJff`�n��1�Y2$�_�t������\0X̦^��냭
`<,�|�3_M��<q�Eo�.ޗ�	
��O~2��>���{��8v�U�e���o2�!mEQ\"KfQ�SU6#��!��NG)F��i?�Q�bM�<����Ψaccc��qC\0p����]&
�i߷�s��?g\0�����|��{�â,:�Y��?�GJ]�)��j������TTbH�M�@��	)Dm�\0q\0\\Q
Sд1ƴ7�/��K�\0�u=W��Ѩntgw��������h4��\0�ޏ�j>ݝ�fM#\0�׆vMS
y����,*�Qr�\"�&�����b���r֬i��j�-�<�O}*px��IOz���ox�kS��VR�,�	[�d1��A���жQ����%\0M�y��j��l�X��\0W3�+�+�mr�j>[2�x�sLYBg��/���8�r��rY��L�5\0�BDQ-&m�B�Q�yX�м�̐����|>g�M�^}��7?�Q���������?�S7�~��\'>�	K)��LeQ8�4v
\"b��v$���©����M�6!�ml�����H
o�oV\0Ԍ�b# �BMa\0\'�n5�RPk���/�*��S�q\0�9jWx_�^��d2R�ӧys�H���e[�u�&�n�(�D5͋��>H��5Y�<v5�jHD��u¥QS.���i^0	RJ�cp0���[o���k��xEq��񦛮��Z\0���_�.�ire����A\0qT30���rB�i�/��eW�a�U��;E�,�#b�B���x[���S�t���j �v��@�S��;.5@��r�f�1�Q�N___o����=��o�?x������8<������}7���k��
��Y&��eB�4��\\[6��D
�0�҉��kZ-�A^K��	1F��;\0��~�\\R]�<��ww�G��󼳳�UV�͈��,t:���Q��\")52ǀ��
SJ������H�9Ϲ��Br��{\'\"fvX�\\,y#�h<�ϖ���nA�֑�S��5Cn�JET@�����h���R������p��\0�;w���e�����ٟ��T|����[o�3?����;�ᦎ
jc������p�����I��}��^��Y�oe��W�����t�9���!H!\0T$lc<A���.�lc�\0b��Nc)4g��\0b�M��JGQE	\0c\\�L�$I\"�i�<N�q>m��X�\0�\\�[c��P[シT�>����=k�XcI��e��ʪ6pEI%�5����O��8���+6�M}|���><�L666�;�fiB]׶1����4,����_3\0�Ys6N��6\0�Ei�����DG\0:Y��Dȩ�$�hq}�,�J�\0�G\0T��$ޫʝɔ)	 Z�M�E�lm���tFoB`����Zp�y �r?���Q���Fq�x\'��6��?
�/<��s�]�]�VZ�oM�x�\"���h:-���BP��sk][���ù�=E��\\Ź(�ζ�!���{Ґ2Rl�nU�J��U���n�O&c����pecgk{Ghq	`wo���XoM^0�8g�����<�d�S�����B�4\\���p)	�����8������̡�o��?�\"��t~��;z{�B]�!�{��d\'��=�5�	!�����9�EU�`�1΅��O#A<������ �cB
�aY(���T�O�r\\L�&uegӦ�mSX3�������	�K9,��9�\0��H����9�f���㼵�9_׍RZ\'qY�����hym��ŋ˫�w��5�N��{���}�m_�߼G�׆�=\0�Ѩ��OG�8N(s/�B��t�V�\0,G`\0�u�z.���eC��
��	^�\\�vH�P�\0�I�9��F�����@�ў�����<H:�z\0>��=š �+!g}UQ���֦����*5�WU5��_��o���?	�?~�p����^���s��q\\5�</���Si��P�(��\0c-�,�;�����q��v��$��.˺�j\0�����R��	��3��\\
��g:��f�$O�u<`Z�����J�����,��FI@5�\'O�<u���n�����˯��7_�q���?��K>�~��,�~�?;*J�cUSo���H3�������0jͣ���`k��T�`\\p%D`��o��^E���>9Hp0���u��4y��S0�44ߡ>Y��5%# \0�\0��rEIp�ل��Ckw��z����&\0�%8�����7��n���~��?�<�����B2ţ�h��$pg��-�RJ�xW�uii\0Zk��H�6hRl��#9��).�䳍��e�Iڄ3\0\"H���{�$��K�y�0�9�	�D+~�C!p��kd>8�@��%8����:�NN�xZj��q����F�s���^x�ߺ�[�v��u�L�[[[m��˼��^wgk�����ȍ�`yƂ���_��������\0�I
�q��x;���*!�\0���dR0��0�ZJf8{���h9ѱZ����%f�k�����L�,����^�7���8����eٕ�W��Z�b��GQ���]\0q\"�*����^���\\��:�(��!�\0�\0o,��!#3>�
�5ԙ�VD�	���u��um\"U� I��WW� E�Oh[k�(������\0���ox�;�Wl������������!?��X/�{dj��Me��E�6\0��I[o��IYW\0�i��N
�$	�7�\\�TS�T��\\0�<�Np�[�\'��v��u(�֚#�HG��NAy�F�Q`O\0�IΤ��{P�J�y�=k��\"@��q.���O;��6\0�ʧ�>��qQ������\'�I�۝NF\0�>�(p�+6�W}��-����zgw���<��@��5>�\"�y�4�4N�gp>8Os<�>h�]K��\\	f�U��X�d8���o�98g�:����
 ��H�Y��qȶY����S����|��/��}����F��Jz�su��ĸ����W�cz����僝Wl�/�:��Y^�:*�\"�Q�5�bj�����ys�ꕦ�h1Y��[{����լ��U�5��a��3&$o�p�n,i9��omj%�P�4����8x�!	��`B�x��@I�Vy^q0��1Z3\0��Ƴ���ږ(�,0��S�<��R��3H)��TD�i��ӱ�tYU\0�9r��Y�E��$&卵�UR5&������ߟN�kW���/�}��<���?k^��������Y�����^e��AGU=0��umL4�G��XJ ��,�r.�1J)zf}}����x�&�����R
�V!?�4���y��w���E`�&x���B`m�<��a<�tR\0�e���TeS�P/�w>֒���{���h�ă4���Ź�<R�U闲6�R�)���K\0����^YY���]\\\\4u
���7�GJ�8�\0��~����*N:\"\0��;v���_x�1k\0i�����!H�Hq��Ŝ���,L��é�ٖM�!�em�0-����iOk�}h\0H�=�1p��Tq��`\0�\'Z���|$\0<cL0&%��\0.��������o��[kcS���J)�J�n\0�J�H�M�@U�����Ww��^��\0x���j_�ѯ����{{c�}�(Rs\'�e�d:�D���\\���p<��n�+uTUM�$!b\0���\'O�\0޶Mz�%B�`m�
	)%w�{gjxg�x�8\'D[x��\"��0+�3�u��!�}^T\0k���s�J�p���>��4��:�b�6�H4�\0x\0��0\\}�*����4/o��}̲�#c�Y����Y�	\\!���Ç���������3���p���0\0�t�OՋ��ÿ���w��K\0�=w_��:��/�{��wy\0M�E�眔@\'�;��v���9�,l\\��@�����4]ZY�� ����q�u˲���O&y9;{��+�`w{����x��v�ipXe]�x\0y]W�i|�%\'N��B\03�O6���Qj��x��6�>.�p�c�5\0�RR�HKى#\0�[�uck�u]W�)��Ս�I4�����\08|�XY5��~\'��$��LFZ뺮˲���l����tіW)l���u]3ƌ1\0��U�X�H�=\0+����?�
��{	�yZr\0��(V����V\0�
c�<�Y)I��.��J���3��p<2S+�\\$E���$�`�N�\\H�TJ�8K�wU�I���8Q��3��x�����8�S�@!g�f�r���VȂbhw�h��1X��y�\"��@v_�E���C�;�w�>��BKδ�c���RR��m�f��k-x�TRI:�T�6vo8��w\'I7����go�|�����h�����B�����ѦiM�Hɕ�Pj���pν�U^�fY���
N��hoo�����
��_��]�0������M��c�f��w����<��?�/\\�\0`c�J��:R����\"�\0����L&u]���પ0��qLS>}p���\"ϴ��V�G:Rʺ�-�DEI�8�qdj;;;Q�z����>{+����}��Ϟ:�������y��	�d�\\J�u֨��罳�8G��!]`^�ѹ�2�@x�?�C[/@0�$O��#@K��	| ɉH��L�,���(�yY�2���ĉ��~;����Z]������n��J;�L]�M(9��2�i+��b
bSy/���Q��\"�U�VJeI@)i��|��d2��C�����#�X�ۣ�2�K�я��?v���cz<~f<X\\�i:��ϲ$�NǓ!\0��,�z���`4M#���3>
�Cc�y��1�~���4����~�w=zt2%5I����x��Ѧ���>��~�ښ�,#;�k��mB��1�u]J��yE۳ژ\0�(��i����zo�.�joo��߾������/|����������Z�i꺤l�*�h�W�����<㠝�������9��\0:�N��M��\0)�!����8M����t�x<�\"�ұ�\'��pr���4�yL�.� 9)Z�F��β4n�u9Yo�4��yr`Ƙ�*1�~�3����%B(!$��rF���ȩ,x�sD���!���,�$)�2�QU�����_�����\0{�IY�M�4yu��
_�e��8M��|/Mz\0���uQKMmhC�u#-�#�<�����\0Z������z�6�NR\0n�q�o�o;X�Hq����h4�QcBɪ���lƤ��k�c,Mc\0���ڵ���`a���uv��\0v���ܧ�׏�:u��[P����?���o�_�~�٧~x@)�e�TE�WU	����u�	�O����غ�?tP�F)�uĘ�K3�L�i�N����%{/�8[�(�����:>y���p��?����?൯]Qo��mJk\0[�;��o0����&�����t�M�x�;~�����p������� �Ln	�#���lt�gmLf��BЄ$��K
�_�F	Lh�o��%Yb0!����4˶ww��|+���+/*!�����p��N�y>_{׫)��GQ���������\0�뺮k�xE�zD�������M�D<�EQp��4��DkMk�$�R�R���}����Z
_�Lw����|�m�	J��f:?xhH��.7{AYW�~:^ɲ~��m�RYkw�/�I��������˗//,,H)�\\� �c�b{{{uu���d2�YOw�T]�Z�,��8&�_)���/�L�x^�b�u{=�=��>���ᰮ�ޠ�u������K�.��|���ʲ���7�6��O�so��6��=
)�����LU��O��h4��=z��浪*���8�\'O��\'G���^o�?���&p�٢(677��8q��Q��!�!IZ*�����<�Ve I\")�1��˅����ڍW�Ƙ�,�(���\0����{�^j����w?�_�F��Gx��/om]2�i��K�JK�7ME��ʍ1����9�B*1��PR����8\0h�i*u�c���RI�������<��������{\0|�ϟ?������
�����skkkY�Yc���L�R��(RB~�gyy�M����lono-,�(!����ڡ/?�����&�_,ȇcW7q$R��6��_9!����0w��47S>ceS�H�I���I>��:!z��\0��x���|׷��O=�����;^
o��v����/��/Rq���K++����~
�m��%�;����{�ݿ�7�Zނ�t���3� ���ց��~�j��1����?�-0��c��
�{��dٕ��\0n��;�O����啵�յ5\0���z葲�n��l�&\0�]�F�H���,�$YXX�MM��
I�L��>�PsOTE�eUm�JZcbv���y]��WRJ�ۍW&�PJ�� �w6w��?��O�>���x9u*�ُ����=��}qq��v����5\0e��X�0Ƥl��N��+i��j�|��2&B`�3j��:\\5M-��=ռX콧f�8�/_�z�mwlll|��x�;�}h��/�$���\\Q�5c�_���y���(&�-����?�C?�����~�
�i�����C���\0VWWϼΈ�����h��y㚅��`yIp>-p�V��<x�8�By�	.<�j2���Rp`,p���bsΙ���T�z�<\\���EQ��n��$������ݛ��<�JEJ)��RGzZ�E�#�4���.�w�
�Cp΂�4u]q�B�I+%C��A?ϧ�6��\\��$��Ɯ<}r}}}���}mS���^^\\^���4S*z�k^�����y�#8�r�8��	���A&��	>�g�3p���3N\'a`�IQ��l����M7���_?y򉧞^=����z䑺n����z��ZG!�i��2J��i�8��ߟN���N�3��BH�[�hƵR��.+ḵ��E��O�r����O^�|��;w��W���N��9w�8�Z���ɫ��Zv�LH��e�q�9ʹd�qf��ʲlj%e�u�x����kp��c�;�9W28O�����h2�����4+˒1V��liiq<��looo������o��J$Q �f��#���5�\0(�9\\0N�AC\0\0 \0IDAT���m59�	�Ե�2���Z+Վ�lT�X\0JIIm�,p���r�Զ1\0\\�ԙD�����g��̸̲��9��Z^Z�F׶6���(���cDL��q/=oaN����$��;;;.<�&I�ۣ�(.�8�ݾv�٧>����b2^?��Eڻ���di������4M3��E�r2��Yǹ\0���mooG2�ʺ0ɋ d�}�ܹ��\0�c������ɅNDI��v��>q�ۊQ`�k�����AG���@�ǿ����c?�c$��/~qiy0M9���\0� Ӕʹ�vӬlJ\0���tqa���Q��
<��k[gq2)r�Z<�\'�4R�?X �_^�<�Hb
5�9TJ�$K9�E�䬔bi#�3���YJ���x��h��Ts=7\0�����ޒ�gD�t�HYo�q��,�^���_�B7�z���{뚢�r�
�Y`�6���i�>��9k\"���Lٱ#GG��+W�H�)~Z]]�B�;������
��?�;>����S���(򱄷���TBppĉ���5\\�#G���3O#��,�Q��K����|�����իO=��ڡ#Q��(�tD��z̔!_,�xh)�++/�:�׏������������;�|�Gn���\'��PG�ДU�9��`ཱི�4e5k�e�;ɸv�֜s�$��O6ô&���yF[n`��${��rb�}n��C��2�b���m�9�s�ܼB��H!��#�m
{@�[p5G.cB(!D1-:��*Yk�����(*���;.����(���EQc����$����k��Y�\'��9��;��X�������ӧ777���t�رc��������xD+�����>��?^�&\0:�6u�%Qp���e]cLQTBJ�h�3b�w��Ao0�p���W��=�}_i�խ-\0��Y:�:�:������3��f���w�%Ir�L��R\0_
���m|��Y*ǽι�OlB�iC+��(�c`!����ù�v�i��X30.�0�q��y^׍�^k���E���e���xY
�jr��K*m�+�mh����C{�@����@��\\���s�<͐��\0G<3ư��ô4/^�&��5_f�^����meyyygg�(?Tb���1)�CGx�]����ӛ��iUQ���ڑw�V������K�������(M�H�浯p�[��v�v�[��\'\0\\��B��mwN����8s���\'򲞎�Lqj-}������y�;����>�����̙3J�/=�0�|Z6��tG)Yd��qw:��i�V3ｫ]��L�S��3��i,3���6Y�%J����=�֚1BB�H�`�4�4
5k!�w����9� ����jUU{8�f�8J�r�JI-��sf�m�q)-�,�[늢(ˢ�+�1,//I)��mL�^��#\0a���ArR4���כ\"*�\\�1kx���QWU���=�u<�����������DG	r<�2��i�u,U��Ec��\'l���/^�ƄdB&�N�4Mq�9�����,�.����t����_w�.:��u���s+��-���}��9�v�P\'y�������kW�֪��v{���XƥTI��H7�J�W�qk��AJ%�B`q�X�Lc�(N���^��Q�4V)͹�֑�[��	�x\'Y��:B ґ�*��D�:��\'����~�{B p����ܤ�M�@��t9��0𪪔KK�e�S��s��v:�l2��3e]{���9�O�XJ�x8��s���(�m�������EG���ʲ����������=��\'���C����;\0�W��$z����<��칧�}���S7d�~��Ӱd����?t��~ss@]7���P�n���zЯ��巑�x~v��qi�a��EM�0�+!�d2=v�85�lo�;�h�y��u(��hk���
E]_���#k�W�y���\0���?����8��\'O�\'���,�.�//V���#��K�MӌG���h�Y\0�_��~�����ijV)%���6-��1�Oӌʞy�Si��Z���(?�Ɗ���ҹ㣈nN:y��]�`x#�P�ϝ_��pގ`L��]����@P����N�
_ȹ�!�\0�3cL,5Q�CMe��������J)�铽��̓���O����1�AN�W_�\0S�Y�T��$I;��Q����5�L�v�Ϝ9�8X\0������gW�;�ޣ_x������#��̅��`u��f8�Sۦ2\08���1�8��O��o����TQĤ�E��.	���iQD�*�0��Q�.,,L�cѾ��Nھ��(2�um��ΣO����af��3���$I_�G�O���3��9N4A�d�Z�,�B���AB�-Ex-��<�_U�����s�yB+ʲ���n��R*MY*龾i�Z��+����⯵~�6E>���3�����;ۻ������{�;�6MY-/-&q��;�M��G�\\��5���uw�8~�NN�\\Hu�-���ח���C��vC@>�p0o�VJ�y�8g_�+}���=���y�,�`��\0eY�i&��Z��c�ZW����g$C򭲋#�c���������}�:Ҩ��02EyІf�/��/�@�\0��BK��u���֡�ᜍ�t��o�|�C�MET^������ҝ��9�˟���μic����`@p�?�ܠ�����_x�}\0����}�۾�єͻ��β�\0lm�D*>q����#D��\\#�r�s�!B�d�����C�?{����>l�nUUY�.xQI�ܑ�8�����#Q����BGQ��vwww���e��Ѵ����I�9���(�����M�TUE�/��u]�:ӊJI�,��\\��$I�=+8 *{��{��+�&�1�6�d�$�Q��AĞ1�}���	�̸s/������@vgӖg�=��r:�z�WV��B{�ʕ�hyi�K�>N���Ν����g�yF)E3K��J���b|JȯF���3gB~�䇅�!-���esG�uE�L�\"ѫW����\'n��P�9�8�kR���t�I���%�L���w��Q���v�0��\"�<�N�s��K7�덑_
y�D���F���[��<̚��S�<f�ޠ�J��A!���L�u���s��A�Q�y�m[ˋ��7)N�:I&�������5A?O ^|�4�J����?�t����ZV��Wo�ъS�XU��%sgt�G�J�GQ4ˮ����d���$��8��~����X/�Z�
\"=�Aю��<l8�^��N�Rz�#q6G��1A��ыa�����T����³�%r<�v�fR]����]�v��f��,Ǳ�]9����/]��Ӵq,�>��x��ubWY�,Q������u<��(}�/ê�V5e����1<���?0JJ��
�q]ׁ/���\0h:::�9@�Mj��7��#fZ�IS[18>���>ߊ��@DD��G���b[\"1B�\\_Eii7��e�`_�E;O�����嘽#IP�\"���dj[�읒Ʉ��K$a4,�v��3��Ƿ�1x�S}�0�I�9�^��������Z�K�Q��\"r����su]����XW��4Mӎ�ʊnQ_2]6�:�i���X�����ѧ�O��y����.�(��y/�bJ�f��1�e�\"������\0��.sJQ�{\"b���&�	�]�,G�[@�`h�����2��}�qUUQ}[��Gǚ/��/� ��k�n�5߿Ǵ���������*�X�
(��@3���Z�(2�4�����̀��9�LMCDu��}����DY��S�\"E�,KE�:p�����bqq�,*g�Ƀ���˔s�E��-\"���1r����M��n�J��|���tk�R��vUU����X��IȠ\'�/l�c���s~�X��Kh�(��?�KD?��sմ�޽�갾(��M)�C��
W����ꡮ�d�!p7�>&r��|QbL��8S֩.���ԩͬWn�cY�#\\�fa���������#
I��k�E�r��,����ʲD��[,�b�&�x*!���yL�(�i\0���O�\'�H�6���q~bL6�f�!Ř�f�D`�澌��K�N-eX�W�h^�{L�u�ϋf:��o�h�����˶m�!yHD1%U���c��o.vC�n�D���[��0$����m7���`I�\'U�\"jcZ��i����s[O�:R�4Q�`\'�T�e��3{=���|L2�0s����O����sq�G���k�Ci��jeY��FS��^T����Y@
�T��
)���SB�]׉�ͦD�(�I�wEQ�mCD}߁���S��4�n�s.�WU7~����¨L��������|\'�IT���z�?�	�0���$Dt<
��������D���f�.<x�4ꈣ��5oܽZ,o�A�y�PUZ�ٔ����	��b�,����%�����ttQA�����G������Q���?�izO����g��EG	�y��l(�<O���� ��}@
�9������i����X+��Z�2���F51Z&n�ˏM�14�dF�3-�B�^��1��u1��U��f�Im�����1&0����7M���r���0��k�6��\'�t5ܸPǴ8+�]~�nǳ�����ԣ�1N��d?�4���Q���A�����S��˲��?�4��7M���z:(���Qo�O����)�MQ�@Qu��q�),�_{�6B8�o�\"?�$�����7�W�J��6�����N�5��X�y���A�ɇ��8����	X�f��l6��zr��f�T!A�&L!t�Ah�1
i����nZ6�e��(ōfltY��9�\'�.s�Јp$�&�e>�N�^Z�~ɇr_!s:����St[D�)����8��Շ��@��H.��(6JL)�s���ma���B�PT������777o�7�ُm��˫�Dt��P��/
�twȺ��ƗE[߫�dbώ�E!N�wKn^-���.}�}C�����י���`�M��Ƅ�g��f�6
U]�Ņ��7�l!!��(�i
\'�����k !�8Ⓚ�@���۶x��˦)^�um��\'ӻl�i��#��ή�%Db4z�C�\"�(�Pu�}]�}��(
�)�� $
�V���j��U#�b��F����j��\0����L��SiJ�R}2�E���2Щ��)eY[����hP
���躍ұ��*c��\0\0IDAT�|~t�VWMq+f��R���l
��M�����8b�?���f���>P�v�M	$�\'�d{F�\"��^VYZ�?Y{R�����{�<�6��8v���kq�+a��s�5J�ۏδ�f�?vc����u�2z6Eq��vv�[J~��> \\���� ����p�Wt�ږ�l\'�y�F��3{#)m%s�(�B�ٟ����)����s㊨��Ï�~����i����*c��1aG5J
ߵ�n�UU�D�:]xm%��CymzGYT�߾(4�\'\"|.d:7�*2�¨�Rب��\0��e9<����\\��̳X\0\0\0\0IEND�B`�","Male","ICT","0756442345");
INSERT INTO employee VALUES("KICTC-STA-0009-2020","OMARY","KATUNZI","JOSEPHAT","mboya9@gmail.com","�PNG

\0\0\0
]GB�J�H0�|�/z���S��Zګ�ri���r���x��Y��ī�����~�,�s��a/m�y^Jj��V=�9���n��Y������A�ezz����-/&��:e�A��1\'h�b����4}|\'Oz
q�9@������ޤ��f4~��n<��ح�=��:��3�:k��<�i�������.�v�~#��P�T�̃�L\0��aaI�Oh�S�B�tj�>W}�x�>J5ϔ)iBGrtf\'cm������)��F!�s��ަ_���<�B!5bk���u���0 �;�r��H#$躔_ש��S	�^O�ezk�GhyLٓ�@�$�~*�2�T�s��9�}[��&���Cy���X�<����y�̲۹|@B�.tKLwD0i�ɤ�7��Yȃ��(���<Ȓ\"�ty�W<gsҀ�v���=S⚃,P9w/*�V��d ](�6+�ƭc�2.	�8�*̓& \"�T߂:4>I�1

�U)�jn���|�lʓ��
A�@ҳ$	���F@X&u*�
,S��9��<RZ��WE�����j�Z�i�e�Hj���B�\\|��p0}:���t��u_���j{$ab�e��%\'����i7�w�;�I�t�\'H�y�ץ�%7�����n͉����\\o��@K���@5���g��jnd��*��0�b�G�@܂W�JG�~\0�v��`�q�ץ��X�㸸�������n��L)X��\0��w�
&��j��!\"Ȝ#��1(<a�����oY$u
o�J�
�e84(�,)s���
i	U�F��1$��m5��F��S:�)�*�e�*	a�	�{�\0�>Z���n�2�r1B$bAᬒ��]
�@����`{�,Z*!�M�7�x!�y�un�R��|���>��a����:ݹlm��4��U�p�,\"2GX-�r\0�i������uw�w���
�b]T6��W�����ă�IXQ̔�N�!\\����*�E�����K��ho�2�UN���h��xh(x�@h�׏��`��Xxp��A�����]�:\0=��N�`����U�JW�	��<(po�ݎ:F�:��(���L���!/��zӮ���u=��.���IX�x�Ȩ�Yw)��S��~(�BkXr�*�DwTg�y �70�Ӥk�Xz�DQ�4���H�.X��\"z�I�̉�._��m��#w��STHd{݄P(�`L$!�
�b慤�>ؕ�sY ɐ�P0�s\0ex�	W�ʀF\\GPR��Z>o�-;<�Wd��2?�쟒F�%�Z�m�W���5���9�����ҀB����包�G\\���%���
�I�d\\�d;<T�
l� �(��9Ď9*�G[o)�L��ڸ	O{���R4�}ՍG��ʷ�Z\\�e��e�}3�
P��41V=Vpv��-�C���%4�T;]��]�ScC �2`���>��i�2����tq�q��>C�J.]t��1� �y�	�3\0�DbC�q����KǢR3+�� Ȟ,�C�}d�����@q�p��1��g:uz���u��`���G���K��ӿ���p?m_۫�0��ۓ�7(� ��I�0[
��\"�x�g�{O$�#���)׬� #2f�r�A
N.ԁ�Fs�fa�k�e@Ol����+z��(&��|�%
��@�t��
��%�}�����\0}�4��3�o��!˄g�\'�V,�ޏ�bV5`5��s(�Q�?*$Q�|;=(k�ub\\C���VP�G��
v����{.� ��7��\"<� ����	���������$1��+�E�/
~�Q{�<�X��U�KK�аT$E�lV�Ç�-��6;)��r�B���n��s����Q�6e�r�T��?�п_����U��l��a1�7@(�D�nn�\\]��v
�b��۟4J���\0Ǯ.K0�6��C|��6�K��d�0�%p
�1!�ȥC)H� ,�Fs���Ƣ}^$� 1� �Ɲ�\"j��Fu���;=sbՑ��o^�+?�f&~p�02��l�fot,��0V7!�aN{��I#
J�6X��ot��o>�e.�cm���Q[OG\'��?`C����m�Z#�R��<7�(�\0x��Cg�)0���FHn�H��T$�Ys�����[����\00g��!�����D��ܨ7��)a͒Aὗ��\\�l��m�-�Gb�St�>�(�L��mlBI�ĲW�äK�$�	�B\"fZ��h(ye�a_��Q�2���+`P�MA��ko
v��M�\\8��{|�I�YI0?<\'���rU�X�2����hm�n�8����}�v������Ч3^�:��Q��;=�\\3�I�7�zAw�֡��B��ʵ����
��&��� �����p���f�\':���^��_�x��+(
���\'��5	bwm�Q����%7Qw���R��IB=�U����Z� �6�X,et$�\\�l@* ��h��خ�^��!ެ�dG`��B.K�ks�����zjd��`$ͫ
	(\0�����xh�;�yb͓����9T����f�7umat��\"M�S;
��MШaU�,���R���Q�t���@��*
T�΄ť��FP�5@o���O
U��X\\�8udSCuX\0�VD�!�m��5�k��q��(���?U&�d��%�A�xz�g%x�����Y=t�;�A$��5�Q
P?����K�
�
&���04\"Kj�Ҋ�x��Q#��cD�<͋0+��Jp���O�&���)1�Ð?CI��Fq˩q)p�mIt��+����]j�u������4+Ӧ뉶�LH.y�
4�kw���8�	�2��	���:B���`p�W�Fs�8U3N��?ic�`
�&	В�]�&j7�mA��t����K��q���6
��@��Ό+�/7U�i�F�X���z��RBjҸb;G[߅�m��^SU��mUg����t�5CgTv����JJ�oފ��A��Fl#�]�.6h��,5�b%��$��}� 5S��5��0l%�ɿ���::{\'���@�ղ&Z��&,�ұV[[o�syz���mO��ut�*�\'�� 9�u@�A�;���4{Ֆ��s#�ݶ��
�32�z����Nu643DUՓ}|�����FJ�B����Y��g෕V�ه��
��w��[
@����wA�&���7��2�
h��%䱆W���Y��ب��N�w3��}f�*��фe�:�-�-�s�7�����\\����n��p�E�`
͡��\"bMWp�n	�$�s���@\"�UB����!�[�k�(���:����u[�k����^
�Vh���Ф!Iqq\\�,V\\�uup�\'G\'E)��\"���q�=�����
Sͮq@�,#�L�ܪ|E�0�>����(��Y_��Iu�Y�}V��7��g�nX��ӛ��y�8�J�B|N<f���.��ƹ谟gF�Lz�8J,;X�`V2T�)☢j��Ϻ�p��Vj�uO��p^[Y�:�!$��%� ��2*��]#�D���A�/�K&W��B�������l��䄛N\0�/��1w�fݶ��m�y��+���6��O��m-vD����&��;���.�#h�����)���5wn�s�>\0�U�88F������ι��Ӛ�C�r�?\"?\0\0[iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:8335a81f-a59c-49c2-8351-4356e91a8fa1\"
   xmpMM:InstanceID=\"xmp.iid:1092dcd3-664a-47c6-a861-3d9bbe7ef7fc\"
   xmpMM:OriginalDocumentID=\"xmp.did:4ce1ef59-b22b-4754-a203-87f4fd193175\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1602728640871275\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:86974cc6-ede6-46d0-888e-a6a58b65ca18\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:3895bc14-ac1a-446e-97c0-e254837fd8e8\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?>Vx��\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�
\0�M��\0\0 \0IDATx��y���Ux�{�-�|K�W�U�U�-uK�-�Ђ%$�MFo0�����1����q����D�03�<�!���5�$0� F����ZiI�V�����-�|�w�=��73�uIxl���j�YYY�����s��;������Vx�Vo�
+����+�8��
+����+�8��
+�����
+�8��
+�����
+�8��
+�����
+�8��+����
+�8��+����
+�8��+����
+����+�������\'�Vo8p5�鏇��kOUSJ}��f��t:�NC\'O�$\"�}Y�eYE�O�׮�?q��k��j�֭8���������k.\\�x��������Lо�C\"bf\00������D4�;�c{{{ww�������Wo銣�ɟ�?�ƃ+W/�;w����g�]������H����#�?k�����`��}�4���ٳg���O�<�m?tr�>�8�����bD�4����]]�M&��x<��b��}y\"DB
!4Mն-mmm��#>{��[�����;;;��+k��}���P��g��~�����_���x�R
)�Y>�c��R�\0`�d�/�\0	�\0\0Ѷ66�\\�����@\0(��1nnll�6��׼�5/���W��f���8���?�7�}�O|���;w��:1tE��!�nֆ��e�����F\0@\0PU��Q@�lgt8�E��6TU\0�ޣ���}�?}��+_q�}����{��3?pb�A�8�5����Gy��}���.<߶-�cW���&ST0K�̜sG�L�9��B�vP0S֜s!vUQVUc4��,��@��i���=��׾��x���|��d��[0�����\'�x�ܹs!��(�z�E�L&͚QR����QR�c�#�4\0S0\00@���	�v12�(L� 1&U1*
D���C\0��_��c����{����׾��W��ʎ|�����g~��~��}��h�뺶m���٬c�=sI!D���/�����QO<��ALP�@c�u]{vI���gW�ZQM�Q~���׽�u�����W���+��p����|����ͯ�l;~��~�w?���y﻾�N��t6���>1;_6!&35U3@D$3Q��`�_��9W � �`�TUm�!D\"v̪hfj%�\"2���^8��g��[?l����Vg��F|�=��?��|��<�Hc�4�i��w0�ue]olKj���ҥKkk���SJDT��sc�����i�\0`��\'53T3�|i&fF��E	!5M��)Ŕ\"3\0�C��x8��}[�p8T�~������[����[Vg��.|�W����~����K����S�v�ZY5mۆ��ŴpeUU{W��s̬�rƞ�sJ �4�UQ�������������i��l6���hT��l6!�8y۴kS�
����̳s�!@H���9��cGTz�=Q�����h@�	�
jb��
�I%�ԧ(�TU����iJ)��r.\0F�M3S3��fccc}}�,�w�����^����饆������/�}���}�\0��]�ID�I�L�$H�TUX���a4�=;t�y��9G舆�Ao����MiV��!��bc�S�CJ)EQ�J�j$�����9\" <ܿ���QWu�UMf�>���/��/���o��+;��������w����)��!E\0hg������tL`&�<�c,��ꢮ���ͪv`��<y&Mh��(�.uO�fCP@CKQ��.�cJ)��1��bJA$�����Ⱦ�5M��q6k����J<v������7����çV})����~�{���O\"�/���4JRMm;�UY����#���XVkM3h��i�MSk�;��in��N\'
���o�KI�RD\0P$@4$E0 3L�Q$��R
j�d	0��!L�~��ӮQ굍����}Y��o��̒�;;W�\\��޾����ַ����+��������_��_|��\'���N�-�ec
�t:�}� ���h�4�[�m�o�5uUTU�������I�dA%Ş�l����O!\0\"\0\"�e�B�ҳ�B�hгtا8�u���I;���D��t��ᘸmm:.��1�U����\0��,�������K��)����ӏ�ʯ�����ɓ�/]�|�ҥ���c
!t};����lonܶ�����l����p���#�%j���T�E�d��\0r�>�Рt\0�����@���G&�y�
O�RJ���j�#��q���e�D�sf&!�{WTECEDOT�p��5�^ߚ��%i�g�9�MO�\0�(�&�����sO}��������=�Go%���=���������8���*#b�;j�@pPN�<q����lo�+���LSJbփ����i�1;[�I
�{����<{�䉵�$S����.��Ե��zPKb��,��D���	�\0���	\0�����R_x�#\"\0&MQ%���3Ӣ�M�x�R1D����L�����:���!��l�3���w�ws��/����o��C}�LU5�@�쨮꺬Rh:j������������h�D��Lb�;	����`)�
�1ZB00@@DtH�19�3�	q<R�.(x��G{�,@USQ3�yZ�̼s1\0k�&����aHR�RS�ڬm�w�� ��O>��w��;>����e��/�������|RA�W�\\���*ʔ��̓���<nǷ7O�V����a���*(�,���L
�>��\'?��>��N��*�,��ɴ�:�c�MUloll����T�y�;�LٻTES�|P��t�,�Y�s����/��g?8B���LRlg�����$������w�9ST	R
��\0�}�]�r����m����_������ʎ���ܳ_���?Bl�voo�p:YԪ:�
ώ0���և�m;[��[uYĎ�qn�D$\'�^�Lq�D\0�|�8Бr�� �Q��Q� �-rR7�LK�.RN��%Y�U5����ۢ�Ѐ\0i{s]Ac�ӕ+�>�A)�}_�
�&���?�����3��|�/�+��8�g�}������1bQff*��uU�lo���X[kʊ�2%M�\0�\"j���`@��\'��\"&�+��ly�%ˇ����\",��,�P\"2�������)�	\0�
:����{R	כ��f���d܅)�!��{�\0uQ���}�����m+��(p����W��RJ��И\0�$��pnkc}w��ڰ&�B>�%Q���;/����\"<B\"XDI\0D�j�f�j�5�+���#�����-ޗ�,;!�\"9�/T�\0\0�\0	qS�����p��% q��u]��)���vw�Ŏ���.\\�0�LT��PR� �j,�7ֆ��vF�k��l�\"jIEM�\0١)!!B��]i��hDD�\'�0g��,)��\".�@\\�|.
}z8)<g�z���阉��!�	�<�B��@�%���}�q�2c�m�H�53_�&I��
�d�r�=o�3��k�G1$0@\'L���D5�DI!��\"f���-T)��e���2�����A�����f�q��\0�����h�vs}��9�p��ŋvV�i�������A��ŕ7s�|H�擛�m�\0������}�kJ)F	�`Dl�6���EzƮb�,:10���P���fps�UTcJ��.�>�����~.�c�K�3\"�f3\0@��⅙}�R�����;v�� \"Gì��#�$���f\"�x������0U��#h��G�1d�E���y<�f�M����)���b��BJ���yGæ6U
�D���QTɛ��,��&%	��ۮ���}��5�:1:�ʲ�����*��)��r�)��<��^<�1��R����p{�R�Z����h�(�Go��v�ڒ�D�Rr����O��IŲi Xj�W���GjYvYbBDb���O��.�|7���9�������S�V;�y�4��)�1����}cRS��$�EQTe34u]z�ͤ��Y2�\"���f�?���lf��8\0)9Q�c��������8���h4B�<!ŔDR���e6gq���Bu)1�|��:W�;t}?ig]h����;f�um߷%�wd�A��a=Oʫ.%�yKH���I����b&
�̜�8�}�B�t�a�3���BJI�糞����,ˋ��PT��&3յ/Kό���UU�8zS��sM�\\�t!s1{`�����r皈d�r^y�Oc����4�I?�?�y�I�U{U�lb��$��p$�T�қ!�N�ӼFTUE�
�C�\\�b�Q�<�ff�9�1Yʩ~\0(��:j�Ƕm��1�$F�\"E}�]� �\"ɳ�G+@M���0D1BTT�5�B�Ч^S�L;CcM)
����=��ӳ��ر���Vw�����.�htlm��ر����i�Aڮ�YH	�ݬ�L��ho����eU?���ylt��>]|��k�D�~������\'H׮]��
ªt��Ýcǆ���t*DUS�3&��Py��g?��Oq7�U��
?z\"�.�1��̈�pP\"h帩���6)R�{����?��&��G|������_kꂩ Ve�4���v��H�뺶mg!t\")���}��=��W�_~f�3_���C_��J?�Ŷ�����
?���yٝ����f��/|�ܹs�qX7k�fk}#\'1���e]V�����zY��*�+��W5�CQHjW���q�]��v?�чBL�G�G~�?���>���~����?{���G���W�����7���^y�]w�y�������$����676��[�v�0�>���LD���M&�d2��/7*?�=�NI�����ߟ���Y��{BRY+�U������Pb�&!7��@	\0�����kW��;{����������;��ew}�s�#
�W��{���w��c)�7}��򖷜{�1����}��O����c���XUC/����9E�ٻ�$ݶ{lgc����Pk�ҁk���wV���1Z���cQ���D5���#R�Hy��}w�,L[�~{s�ua����Nڲ���<}�����ŋI�(��=^������=����l6��iA�&�f*F���lPA4˭�̎�/^�X5������ke��loK�+Ǔ�+$��ݓG4�F�����\'T���>��ñ�Tn6�U�B�/���oS�ư��GM�x�����u��>Zq�&�/�	����7>�����7Ϟ,y簪���-=o7h��ܹg����Ut�]:�
 �v{�]�]�p�Z{�
?6�� Ŕb��
Gq6��.��(c����
�xmmm0XS��I�JJ]�/�`4$�Y;��}�@������EQ�v|���f]���|U z7�J035�$eQ���g4Iۛ�����g���ԩ�ڀ�M&������7>?��;;;��B�@�3gE\" ���k��;�ض�d65�A3�&�1��$�)��m�ê,K�# #����A]
�T�U�^���ۗ�xLd��\"c�_��������	�=��&D�<3�A-̦��}�I����5:�������[�v���L�4%P3Ͳ:b\"%FbvD�CBgJ�J�����RJW���7 ��˲^���F#D���,|�ΉA��\0u�TuSU��C��ڪ�};��)�Px2P CJ�	4��3���d�*�i���|Z*\0lmm!8B��1;G 1*\0)&d�L�	
���e�|N*@^�\0���0��+1p�^2W���M\'�s\\�e=m��:\\q�E��o	�yO���+�R��\0ٜa��٣��(��#
\"�\\,[�$O��IU��a0�<����32\"�&K\"\0VxGT:�g�\0�T\0�!xG��h8TD	3ue1(�H1$黸���F�L���<�����6f31���h�@	��3t�H(����&�����h����=����/��PU����L��l��♑=1�б�����W3I�T%�� @����r�����cD瘈<�eQ���*�$\"r�T!�\0fU�9D�{B#���D#f@Dc�a��&T2@3 0@@$��#��Fm\"j۶�����zL&�\'o?�R�|_���ۘXk2Ka�M��e@UB`D���l�`\\���*�l�$1%��@�AS\"�»AU����ffUl>�^���z���+���ڗ���ev*���/b�>�Xywu��(��`@DI1ƘG�y��i�e3SA%vyu=19������!xBf$0gƈm&�h5\\�E���W}Q�޷
�v:��j8�]�T�I�;K)QN�3�$I�sIE�&5d��(HƮ2P�\\���� n�����X�b��d2�N�@�v}H���) �B�
mno�:u*�u)�W=�\0�V}�����}�c���Q]V6�u\0��Ʀ2_� 1F`&��{�(K��Nt�}�o�C9V֔5QEAUAQ�� 2�ʠ��ش.�[Zm�`��|���n�~M?��-��
� R��@QT1H�c֐�Y�{�7�a��ǹq3*+�ĵ�G��gŊq�FD~��;{:{�~G�Fa�����=L�=X��MS�6����:��\"G�AB\0�eY���	)�-�ƻH|���2D��m)\05�`��_�֤yk�Ɋ���P9�-R���Hk���ܶ��[Y�)\"�g^����$��g�<�蓢k�4ew�} \",��\'�ĦiQ+4�E=�(_�:yS!|��p<����YI�\0���0�VD:���H�Z��mCT�ẏ¢�^�ҹ2���1��6��b�-ܼG���4���H��/��ť#�&� � DHך�6!z�<�-���}�K~x�W^�g���ؼ�p�0L9C6	�i2��<\"*RSJr�*�cd��j�FkS�c2B m��դ��333eY�u3�X�6[ؾ�ؼrmh)#J!*c��.���lS��45�M���ctε�%��,�B�c��AEH�PiT���I�g:��={�Y�����k�ٳ��j����\0�$]\0FbFb��)����6ٰ�\'�\"\0K�Ne�� ��RZ��y�����ic8�V�L�̑��!T�h��]mH�{�B�HwD����<\0�ei�MfS��*q�($A�����eY�	��.��y�\'F:Xt;�U�/�����ϊ��ڠq��@���hcc�vcLJ}Qe���Q+�󪪆u=�/-�6F�~o�ΝyYE��v�c�i\00j8�F���`8f�y��m�i�A��Y&@i�4��[�\\H��R�u�����;�E��֝N����x<^�$��?��|�ԙp��7Y��.tg��+O�.z�i�>
�E!ڞu�y��}�������c��O?��#G�<�|���p��$@[Đ҃��\'�d�FSNc�E�V���WV��ࡁt\0*\0��ݝG.�����m�ÑQ����p|�}��w��\0\"�\0�(`��!��ZX(���LfG� N$��a\"c�:q��B��\0QY��D��v�������7}�+��=�ѧ������]���
!�(��,˲Lke��Ͷ���QT7��ک]k1�1f!���� ����]�����=����4F�^��x��=<�v߫f\0f\0v�������\'�\06+��L�&��):���lj�(��(��G�P���^��\'�ʲDE�~��[��-�j�p}e���漳/���s,��No�I
�8e�\"��R�&���&T��#Gf\"���lAG�чcEX+���j�(VQ��5�C$h�k��ǀH\"�9�l:�P���1�CJ�m�\"�X\0Y#(=!��;�m}�12CD	�*����<����������p�.}_���D.l֌�Vg1z�-N-M)�c@��(,�\"�DTAiT�E�L�$��D ���cT� �jQ4\0�QAXE� ( \0\"\0V����VZ)MʠV�\0 &�f��%�q�GB12 RncRFD�w��%i\'�����.�����g1r��֙M%� S�B1J��d\"p���F\0dA�I�*0��CĤ��7�p�BR��4�E)Ԛ�=�4igF���6s���H\"7�u�9��-m�j��8\0E���On�����k�ښ�DP���<�\"�8���̬H!Df����H�DH����qK�D�<�\"�&m���f��<qM�\\	��e*s��F�\"�\0�{�}�Q8�qq�\0\0 \0IDAT^C! E�E���,3�y�Y�1�m��>����V�Noe<��F��Љ��0��J�D�DH���D�x�\"K�1���d���&�8��N�8z��6_�!7M��b��RʘLE�89=�X\08pd�(AR�A�\0u�B��m������Pt�;��o�o߾�o�� @��A�%ƈ�ED�ھD&�\0� D���5�0��0�	��f[4 �&#R�(�9�}Ua�����BŬ�Ň4�8F��\"C�i\"P@!��Y)C�dE���uo4�1�m����m���N3�y��u#�A�Uix�P�F�$\0���Y�Xp\\Մɕ�Q�ɑz�#H�lF\0�H�ȇ�F��sND&��:Dٵ1J���Dd�]N���L\0ڶ���9U��\\x�;���\0PE��n�b<�AA��E� 
��6)������s*P@�I0��0B$�1J�BAP@��MU$Tޅ(@H0� Kj�����- `��D���Pe���v3�Y��u�v��u����ʫ���O|�d�ͳ��aW�(�c�AD���\0Jm�H���]�qS[�Y�	�E�H+c2K�\"��UF&#�D�Q��v�+kg:3�j\0�ѵ�\'v>@����(����i�����E����[� �\"J�фZUMkl^�
Dg�(��,��j�Ս��%2�N������gʼКn�����ո�������ϿP�]��C;���0\"�,_ZY3Ɣ��Z%��(�}<Qg`���P��͋qۚ�8��Oc�$Yϼ�ٟz�Ѭ(�kA\000�\0���|c���Ga�<�]��Q3s�j��(;��`�~�ȑ�ں�he��u;���nQf�]ZZd�l\\�\"\"-�,��:??�}��^���\\��a�|p��S&��@@b���!�\0� 2� 1Xk]����w����1z�d������6_\0`H����f���9pt�	I	��iz��V�����\0 /lYv�,/�\\��mU�q�2�CF����u�
��6���#�y�E�eY۶�n��(�UVMJHE�Q80��7M�Xz\\ێF���aaa!����m�C�Q\0\0�`s�����>O&���Dmˢ(.=YOc��K.��KW�ƨH�6�$#<st*� (�D�L����
\'9\\�,��XI1�]�Cs�1z����.���ȃ�IXi�7i D����Zk�!��68��
Kct3j)U�CDH@��\"�>F�`���76!+��S:���S�FJ�L`�M�Vk�sMً�T������6yr&�9Z���x�!b`$\"�JE133s���Zع���7F��KTو� 1�3#*DF c��i��j=�땕�Q]�e��6�4�1�b���]c�x<n�1�\0@~��<\0\0��>I���H)
t�\0\"h���v{e�ӱ�&ZS	!�*),�\0��|�X�!z���ZYkrm��x�ma�	P����h<??������g�����۫�`�N9��D!	�j�8�1�8l���[�Z�Z��B}��&cnMQfeYZk8��\02���!!T@�(\0� U��7��6߹s�p4Z��{�����ה\0p˟WW��t��ɸn���|�o�\\_]�֎�y���6�N5�`2�̀���d2ylP1���� eX֦�d��JJ��j��6�M>ͅN��TeR���B EI�9�@\0N�Q;ENF�ñ��n�?41��@@u�����h���7�|��笭.w��R*�\'��$�����C�I	I)��1�j����6˲,��</���D�i����#�I�\0@�
1��\0�(E�)$@`樌��zff�ӛY�*c��/^Z���>�T3+�����ӯ��`��TU57�m}ii��=�p���m�pcDF!D��h2�&�Z��қz9�YEBI�G b�h��@�ƴ�Bf�@!LM\',䘑d��Hě����eYfYc��ZH9�n�����m�Ͽ���S;���᯿��/��Ƕi��B�|��$�$��hM��d�1�Zc�1\"b�1�hk&(ED�k��ic7���$G�Z���L�Q!&;��QX@8�Tu�g��9���ƵA���=����x˶�n�i��l�?���?�я�\0{^Y^j�z�g�����^�ε�\0s��%�J)�h�	U\"rRZ+�I)��,�<ϊ<�sk3m�2�*M�Z�T:5Z�&�6u\0&��DDJi!%�hI��
\"�R�ssU�:�6/�<߽gσ=*�;��[��fw�O	��)bA?�����I�e8���溍��y�dL^FĈ��4*��Q�d:S\'đ8\"G����qp�;Z�*�Ԯ��*��榛�na{E��m�ȁc��\'DTH
)cQ�4��#���fg��q뜀��;v_v��u�v�]��O|�//>��}�Ck�1z2�_��|�o�g�,/#��¼�ݵw�y��/�rd�A֛�Em�
Y@�|�m�B]�c����6!��)8���ڻ�w��+@����K;պ����jmitF��kC��\"G�~غajϞI�5��e\'\"9/��%��q���=�ٽ����%F��Ç�������w�i_�m�>���;����o|ù�Hmۺ�J�q�.��W\\�ܲ,��>��6��o���\0\0Zc�%T1�M��	AH��1x|.�B^����y�]>qG:�}��ѧ�\"���nҐ\'\"J!)��B2އ��D ���5�����y��G�����ε��������ys�g�9��JNڼ��8���K_�2\0������eYSŦq{��UJ=�ٗ�uǝ����ǹͅ96.�sA�����>�8�G���8�w��Ha���6Abz%	�\"��$\0���Y�oYpS�`�d5@�F��_{]ٟ����8��jr�̥�fY��c�>��_^���|�i�~۬W^o���>��
D��S3����h~k�I��B%�q0j�Nwn��_�E�T.�{�u�Q��]]]]YY��z��﮻�z���������/}�O�ސW]���i�~K�
�JG\"2JP����(�\0�Z�A@i�)
0�F��O
��4!(\"E���HHib�}\\|��WYY��f�(�f��>��s����B6Q��VDڶ�t:1��`��2�\\�����O��U��袋��Mg���o����:]{�\'H������Mۋ����[��U�C���׽^_\0�����:B
#%����X��Z�	G��^��/9�X$�41KV瞽��;x�{o�
���7����-�����zGUUEQlll ��V)���Ɉ(Iz�\0���@dR�|�Aڤ�3Z���P	 ��g{3���.{���֛��<>;�7�AgLUUk+��}�eE�ܱc{nchb[�o9`�H	j�D�	����Z�\0\0��R�QY�3���1HV��1�QE�<��+�s�5��|�Ģ3�_�b�UF�$��0G���Mwj�bii�,ˢ(�yeee08p`vv��r��={�;７����
���fZ)���dP�.M�(O^eY&�s\"2ƈ������rUU��v\0���{��_|���|�с��U^�4��>p����{���8n�uMZ����Zw:���\"�V1ƺm|ɋM<8�\0�q�<jK��\\>|�m[c
A \0��b0X�����+��v��]w��<��d ������o׫��t�g�zW�F�f�j��9��X���	��1
	wm�nfV�b�(���#+��r���?�tf�6���(���	$\"p�1�$\\&��&1�S���4���y�gY���\\�����ۿ��������sN���\'�4F�Xu�Ӎ�n��;�������ӝM2���x}}=媈\'Č�f�}��s�J�KP��Z��������D
>vʾn�Q)-�����s_�]/�F�>�������5�2�;E���nP��®�}�b�!�e���NQ�y^dF+4� Q\"C�$A�6F�����s�x�5/��NwP�g�m$=�(\0He��p�2�il�����T�(�\"�软�z4m߾}<�F�,�RA�������/��y�+_t�[�E/�\0~���	O]�~�7������~�D4�TU��1жDE����=��v�\"�3�<��<��$��T��D%����ɱ�I�U+�.:Ff�DD뜟���!iӟ��Ͱ��E_r��/}��������`~nn��m�����ʮ��I_��>z��́P��jm�JV�*P$�\0Y���4���g_uݕϻ�33�zȳ\\Y;�mf�N*�	�\"��E|���\0�Tm�bH�ƣ��v�smۦ�l�M;s}}=�/�
���3;;�����O�k_��{�9�^{핯�\0��=�5�S������;o��-���m<�(�I�{���!�����J�hrmm�fY�eY*\'%�ཟV�7-�A��HEIxM���#	D\0�0���f�/7�ky���tzd�k�{�+�<�w��{/�П����u%b�5hHDM���(4��\"m�!$���QDĳ4�oTu���/�����WdY���:7���<Z_޽��q�l��T���B#iD�0P<1�hZ�1p��H���<x&%\"�
\0Eaߺ�*�����o|��,//�v��˹->��-2]d��!
GOrKyf��>�\"\"�|��܂gY�nﲫ^��k_)\'\"T��4딮����Ĥ�|�]w��/��%ϸ��)��\"�i�]�vU�a�R!�4�\0�{\0�c>o�U$9�4``�����)�t:Y����/_XX��u��ի���ϒ��0>]������?u�W^�/z����z�o���J)�٢S���7O4XDô���^\'�n5�[�x@�[���	e�|��w6�M^t|�\'�A\0@AF@A@Р�!+�����u��[�����rSF&/2��GM��Xŕ~���¹�9�����D`�by}ca�k�f�j��;^�Ͼoa�9�
FD�$H�r��L���\0P`
Xk4ڦd��H��t�#*[?#�&d�� xN�9�\"���������?��?|�^xa�\0|�y�\'��%�����N��n��O�9>��Ç��ԧ?�1���QQUU��Xk=�*�L�1�H�z޲���TP>���#���;���Ǘ��z�o]��/4M˓�J#���
\"$uQ�6t��\0\0 \0IDAT����-SQS\"���a����T�6m��M��ݻw#���7����˃���ڲ�?ڎ������S蠟x�/����w���}�����������p�|��m��1�齛�Nd�3H����-���	S{��ŎY��s�e�IFu�������	�ם�[��\'�3����t�ص�\0�\0������j��t��p�����`��ݏ^��\\ޝy��~��YPyw�B�5��<Ԕ����t�D�i��Gf\0c�q�5�	�\'��	��4�x\"dQɤak��(\"��8��laee����ϲ�S���s{/���No�w�ɼ�O0��w�b{�������n��Gqy5���_>r��C=��C����UU�H��M�0`*FD��x<n����L1��Tl��Ss�������l�7���D��tVVV��j�F���T۶�T�g
)��9&Н�ܛ~��������G>|�=wn_��u��ե]��1��3k�l�mǙ�,�=���g���?հ���Ö��9�xP1�;o�
���4atee\0�a������ەu�ޜ�S[b��)�Q��M3�z6�LNDb`�6\0`�APj88���r�]��������\\p���<�?���hHz
���3Ӕ3!\0cʺ�¥L��=��׾��ֲtB��y�-��y����-,,��̼��/��g�_��o�M�ӿ�;��{��CZk�gm��t즔RZ)Ī�&�EQ���I����;�VlMmô:���V��\'��)�O��r�i��{���翨ן}����̊D0&�]�����ř~Y�����%Ϲ��w���g���
�����Q����Sܣc~�4�J�[k��=g�9��ǘ�$z+�Dc$(@X5u�^[t{3��Mӌ]��9W����q�7������Yϸ���{���i$ɭ�Z�g�P��R�����d۶i殺����T�\0�\'Nqk�d��:&�zj���ǧs�����\'��Vy����pc�����ko޵gϞ��:믮?�t~�/Zk���?�%|���1����7�p����G>r(�2��mۮ��k���Ζ���d?�fYx�R��1u�TLg��9\0�2 ?E\\u��1�[o��V)DT��}����+�ڂaf�-@AfD�( �� ��sжm^ز,E�!�f���>{�ʑ�������v,l{���3۶��X�%r���;B \"���ҷ��I���c�F�H���M�@�e����x�R�O�������7<9}r�%�{,��*�,��k׮�~uu�ȑ#w�qG�۝�����=����v��n�֯[\0p~�K���hGo�h}���~���~����xz�F����鳟Z�d��qAƖ��1��t�&�������(8�?)\"�*�u��*�r���u][�����Z`K���$�Ed 2޷E�p^ 2��z���C�������u�{��H���:]���-\0����\\�| ��զ��l��G
ȓ3�ٹ���	,i��!t�]c3�y~�@��n���5��ܻ���6���������3�46?zl�S�7/k��sdD��:�51�]���u���ˏ?��}�zL_}�s.���{���o��z�^�������0j���\0��	}�r��Rη)_N[���G����oc�yn�,H�L��=n��֚����L����� �CkZ���y�g���7%VT�q�=���������}��Q_p~�ԭ��㍍��R/�h4��D���bL{�8�8Q\\H�[[��V\'���x\0�~?ٶn��r�o��1�-�L�ք:����r�%�����$�tDI@g(�b��t���e\0��;o�����p��l�b<c�v���=�m~~nnv8<t�f�)�,�Tu;�iKʺ��d�IT��4=b�Zk�۔�F��~heeŹ\0��j��kb��5AM������������t���q>��G\"\0!�t}�xl�FSKkUU��`uu��t`�>��	5�2eY�m[����n���sM�Lϵ�P?ŬW*���S�y������[{��3���GDK*�YR�[.//�E\"�J�[�R@dL���������������m߾���g���v~[]׏=~��v���;w�����ݯx�eWD·á2��B�Mި�u��6�����>Ʀq�(T\0|Ԏ
mn7�	���0� \"#Ф�Ez�L$�I:��
���lUU�Ѩu��1J�	�`�zD�&S�N�\0��g�-\0Jk@�!4��,H�:Y\0I\0}�·Ȃ�Uzq�gdH_���G�!nڇ�9}L��o�5!Q��K���h4����N\'%m[�Z��O�#[�B:nM�e[Sࣱ
s�ֲH��ƚѸ����gfI%�R (�E[խ6Y�M]9����Wܗ�y����w�}`�\0��\0H�%J�U�AY��z�HqOg2�v��œ��L�O�δ�T��d��[V҉%Şx�
��/�&)� A�@\0Ľ�{��=�ǳx�q��x,���}��}���{��$�ܵl�q���
u��M�S������O�A�a��\\p�}׎��Z����z��/�o1MS�I,N&b��S�T榧�`�LgowO����p�0�i.\\8s���w]?�TKU�꘼�8�Q\0&\"HQ�_�(���h �uݲ�j��bdA!u����\0W!���u@��`\0�Q,WVVj�Z:��F�*b�c��o�4s*�U`0�tdxD������f>�9Q��Ȗnvd�9��\0��9�V��bB�@Q���2\\X�yŃn],z����cb�֡lW7���	�m����Q,}�)�K�D#��o~������������ٛ7�
�\"�n͝={F�	�!\0M����#�(���Q��R�̗R(�	<:��!�J�R>�w]7�JE�Q۶�|_����>6��4���I���A������OVF��Q䣆�,�:����,����5#���t1P{�l���D�c��]31��Tjp�0XU���-��H��}\\�-�������RDҩ����ܷw�o��o�ٹ���KǏ����-==�<����ӿ<iP�ҋ/]�vmvnfϞ=��VVV����������G�%�a�5e+\0�5;;{��I��u]GH\0�d���H�M3C�������:��P(�k����\\�R�D\"�L�
uH�@��>n�V�ne<-\0�<���pb����*�o��{�Y!j�0���!���͂��
\\-U?8v|��
\\��\"�H�Pd�Y�U*�t���9�D\"��j�ba!L!�4e`�9H\'lz>�_\\\\�
���H;+�),84no�,�+	�K��fh%��E��\0PI!��
v`�h�l�U2�Wվ*Anwn8���J��
�S�N4MD6�m��
��aɅO	E�`D�@�j�dr`p�m� H�-l���B��;2��gΜ���_�[�h,648�J�G��ٵ�s�?>�{7g��C�x��#?t���r>�����ݾ������ΡC���H463;�	�vf����95����<���
G�7gf��(�ccc�H�Z���q\0���)5����wuu.,�\"��#!)���<�Q;�U�� ��y8N�b�s��b���ͅ�	�Zcm�/�`:2�
����m�Vn5g�tk�����?01>����_�LO�w�/<7q�ґ#���oUH�ƛo�ܽ{e5W(���R�|��
cDc����j6��SP8�U ��+W\'���&\'\'4M�
E#�xoo��z]]ݽ�}���tB�1��B�sa������m�/RJ���D�a I7������M�e��	��M�޴�v�\'���v2J)Ѡy��?Ȟ)������D}��u3#�eRT�1�&(Ά��і7��T\"	��$6�V�q�	��z��F�3s�9���3�ݳg_2ٱm�6�X��\"�~��������\\*��������K_��w����>���7^�D�����K����ŋ/��k�7�Όi��sN��%B�t���\'�OMM�b�t:
��L����i�
�\"�P�3�8����N\\dT�;+����_m�����o5�|��E���������C����:u�ԃc�.�^�����#<<�}\'�����t||h_��=�n<ǘ��2
)�����z�3����U.\0��B����>BMZ��&.�i��ZF�-)�Ͷ���}��d�=���p�8��p��)�}�\"I�p�^�#$\"������b�B���m�N��l�\\�:�U�4�4ΰ��#�	�4�H�!}�����e��#��	�\'><u�ó_��_
�B>����x��G�K-�<��e2�*]����D6��7X�M����ॡ4��S��5(�S�E���I�|d�1G�
[�Zeeu	!T����J>�2�l�߻S�?���k/|�9S7�}�p4�tw-�,�ؽ˰�\\!���&Ɛ33MSy�R�w�}7�N���CO! �T�� ��u0�������RpC-|�D6�=�+
�| L��^e�0���~d�kl\\����h��#���=��b�Z-�J�i��G?��1�C�W_����,b�}�
!R����ׯ_/�K/O�kա�a�4~���:s��m�v�J3l3$�����P4R��1!c׭�� &����߸q��ɓ�<gyy9�H�B!U/��$�A��5��v�7�wU��y�u��69�(��P��oE�IC\'RU6}�^;�|ztjj�����o���?��x<�8�Fu��r� 0+�Z.Zv$	��)pTt]�T?}�t:�^]Z�vO&ӑNWj��gN3&f��{���Օx�S ��~�R�\'�,PT�h4�����EMӖ������\"�G녏�ˀZ�і�e��A��|�J����:�\0��7���$Y����d̴^�T�L�K�NJI�fbU&��q����^{��{{{�٬���;��cI(\"E�ᵵ���Y`c\0�c
�c3���*��Z!?�ۗ��8�λ}�k�bWo��{5��f���)�J̓�ÕJ�H�X,H4��[�B&[�L
�a:t(�?��CCC�\\.�L�u|��q����+�\"B�tsr���;2IM�
Œ�yR�3�wƫ�p$�N���fg�z��J�Zsy�����|:����²���D\"�Ԫm���	�ܞ�A��R��w\\��[��Z��\'�)���m#�L�,
�X��:���Xl�x�\0���	��R	jk��mی�>����I*�m8	AW�OZb���\0X�	��V�N��x��{מ����nj�����V�5�gB���\\��\\�6991���-�W�Mj��w��r��e˖x<~����~�k_���;������+����}�O&��b�2CꬪV\0�d2	�<)��xȲ��Tʥ+W\'	!�A
K����t�}OǩT*�r���K����l�4�7n���z.�z����\\.������]�vΟJ���ƺ���������--.�V�^��舊\'����jc���� �5c�JFU��`-��e�~�h}��iORsC�f���zT�(d~���u۽rW����#lUPTVLX�U*�R�T(���gN��.uvvP
�¶�T�D��e7���ҫ�l*�N�5��>��m��n�T`�|��hw�zT9��G�@��֣
�Sz4�mF���9���JT����G�&WJ��t]�u]Р�Z�R�K�B!����qϞ]\0��r9�q$y��w�޽��h�:clfzz```zzzii���wyyyuuuff�t�%���U
R���mNݫUQ)�?\\E�#
Tm�������B
��-���ʼ��S}~�_���6*~<�y=�8�%�T�}}}ׯ_�=\'�H�Q4��
INSERT INTO employee VALUES("KICTC-STA-0074-2020","JOHN","HAMIS","URASA","joh@GMAIL.COM","�PNG

\0\0\0
(��Udn0ǟ�Yd��l��D�2�X���`����������^��j��h-�:���?���=��}���_?��O��?�ȼT�Y~�����߯��	~~L~�9��_o�?�1���_N��BE#��r~�h�:Q�?o�_\'�?����������_��	�}{;�f�罿�];�;�uJη���K�@��e��q`,��=��#! ��/�
����x�/I)����f���߾�����˕����~}�������{��{���fm�����߷��Ɓ����c��������|y�z7)?q���N#e��RM\'����~�b�7w~�s�^����[YK��+���(�8�ܤ�����X�w��]n\'��\'qdN�,����\'���D��S��G�WV2eN�9��(
�Q?�:54�X5�f�܆�VZm�Z�M�7{�[o�w�O/^ݼyw>|�<
�h��>|�1\'��y���s��ʪ�V[}�kn�g�m���=��ɧp�ӏ�q�M�R���m�_���G�����^�ƛd-������?k�w��)������)��Ĕ32�k\"�]���r=՚�R��ő�
ˌҔ���12Xo��������)o���U������?�����C��{��&kGl�c	_�Ԇ
j,��n3����Vn��ݧ���y��D0@�Z�����ֳ%�a���A�qF^�6e7�+��SR���/���,wYم��x^?�{�c���6�/H]�M}�M|���O.��@z:��X�|>��c��^�9,�^e�yv2�zT���
��R�5#^���:�LH����>�1
S5�N�]	�v���p��	*=sk�!Sr\0�Kf��`�M?DL�p�Sy�p;�+���(��yr��s^��ݝ����J)�\0�u�K�d{��U�����c�E��C�_�O��:*eN�i��8��Y:ƫɔJ��Q\\V�D��|n)�Kuu�3@��\0����{�����/�:	���ђ���YRN�Oh26�R��s�)�^�j\'�vq�O��Rk�L��voY�~� oKΐ�+�ꦠ\0�M����ET!�3f\'X��79!������g95�mm�T*����?��/
��j9�B��T��v΂�W(�/�r�6�l��X�Ȏ\'��c��nC&����ׄ�(H�4�M���Z\\h&A������#�I�-�Z:��\0}Vt�t:Zq	p�% w�g e���H�tO\\1���3ʌ&�j�	(�9��pT�sz|�3U4�#������,Ow4��J|���
�E���>�\"��wm>P\0mH�1R��UOy�Ùx��B/Zj��Zar�;�����r��i��r�\"��ki�Lqx�4e��]mx������NO�FG\\.����]t�pu��KTmr$�gUh{	����K0��>�5@+
}rl�A���=<�	C���Q�*��1Ր
�!
����@i�U�Ai\0J}�	^��t?@(��鯤.�ks�x֠e�M��L�!eL�Z;%���Nc�\0-VN#T�]��
R�QE�߿����!\"�Z.�(�Ɲ��,��Nw�8@�y%�ˣ<�ǣ�.����A��%�
G\0<��ZU9���+X��X$���=4@�0���TA��(�\\�&p�7�N����vK�3���x�k�z@P[�b�5<swT!&�GFMG�*�M��S�r��Nw�c���C�1�wQ�;�V�T��1����j���!�r�!
����ꤩ��P��Qb`qG��)����T)��NB^�d�T��H�d��ET���0:��<�*��&��[=�?dPFH�s���ꈝ��mv��������G�)���=��r��#��F����<r�fm������J=`�ϣ��44���
XF2I���f��
݆�lo��S#G+���4U���ԃ��r����u�a�7A>b�l�f��B�ß�����M�P8�6c`q�� �yqY�<�~�HJx���7����t.n��/�c�
���\0�f��hE,�j��d�X��!����IރS��!T;
s�pgG��;�}Gֆg�g쪉V0���T��O�>�}�d
�Ż6nmej`Q5�z�@hJd, �k�)��	:�ù@���7�f��DN�f�SA��vg�QCPqC�S��0�4C��U2�(��dao�V�j�I0p	3�^G�\"ms�T�!���t`�#�Q{X:��)G��#��k#�`���bJ5����zL�5��8@L�)�*\04��5���`@*���YZ��~Љ
��wC>��׳����iCۙ�5��X�;���<z1�2&��lb��z�0+J���t4i��n��>X�F��/U��O`�s�D�_�
�`xGTEd���,\'IۜX�-���8����QH>��
�q�5�
Y�P�hT�q����1��=���
X�������5���3��6C>tuKZ�(�4�	��]�Ӱmr���
cm�8* ��8��ѱhD ��8&k-D
Gd��&4��l�����N-�t2p~Mm>�J���<��c�!i�p*��8����%�]u\\�͵2��a�;�s^�/�餎�8�JM׬⭐�C��f{i�%�U��?��DR/E�T\0�����`��N4�\'�#̏�R�a!���[Sl.����[@�hfNM^��B��D�)?\'�`W�>�Al@��)���d�,�vBLj)����
�Oq�)���GQ�k5ky���	<!|q����б��Q�T�T�V��pG9�l&��Q�-�8��nYڞ�Ҭ�ղ�2tx���튴v�2C��5�3`h�/<c|QK.��ס&Y-8�\'��7
��\0��
 ��WÄ�q�\0���1�WS5�@w�_�i���Gy�Ӗ�ݸ���An�p���D\'L�`��M2����1���H(��!�V��tQ��K�o����
\'�tPGg��!�9-��e����cC���\'H$ȑC�����i�o^S{�H�m,?G\"�oF��P�\\a	��do����4/#m�������z�H�JF�Q�`g���d��R,�zr(TB��4�V0`����.��i~Gd��v�&\0�\\t���w��4��_�&ĩN0��O+H�a�՝$
o��P(�8��!�$�`E��!�1*��[@8T��-!�	\\�=D����`H����hr.�5I@�V�I�H����ΔP$:�e@��F�B�D������E˶�..�a叒A@�O�GԒ\0�D�g�5ؙю�m�H���i?�z�W��/���iw��PO{���T�CK��G;I?u	2�\\�(�1�5hj٦�?0`��Wd�4�G\0��,
�5#~��\"�����VUAYv�0l��D\"�-���|
��:��Y4��>�}�\"3�n�׵q\\�mn�!��%-2��Q�}F�c��Zv�#s����Ajh=	)O\\�|�NA�B�\0B�<x�H���V�5�%o֕LޚZ(G������2p<��hr��w��<�$&��Z���u��4��T]����#u�Ҽ=Q����%\"d�6�%�N����H!�\0J(停Z������a����qibZ�P\\1fT�a�.m����6o5�!ŕ�>�4�Q��h��[^-P
��H�q��&!N���>�l���|��r��p�d�Ղ5��~�)(��YM˿�8�@)@�^
խ^\0<k�z�A�%��@R1��~��!�\0 ׁ��������O/D�Md^�8�=��n����*\'yp��h�Y�#���6�.��{_�>?O�4&�f�cH���o��X��#�^�YKG���È�t�(F�[ڳE���ZC=M�#BQ�\0;��h��RZ��Q�*�\0=-b���摗Y
�Vmy�ʣi�
ך�RS�lN�K�0���ȞF�\'���Z5�!ߥ}�\"9,����B�ie.����2�h�7�i�����ڼ�]vMG�!:�v9�yz���9c������5���)wmr�Wk.�%E� ���ܾ\\�����_b������{H�\'��I]�?
�ѿg%Ȣ&>�!����J&fڸ��kE�m�ƾD�ˮ�i�S�
E����_�ؕv�z�	#i1@
��$ �)x.F>�fT�v�\"��#�x�SH9jC���\02T
!e���f�aM3G�.��cvjO�ik#��U��3��tc����S+�5`�V� �M�����Ĉ���&�[��&��m����K�#Fs��m��q�ؙ�cj��g2b��[k��E��Ľ��Z!A-a}�-������v��\"A/�^�\0��/�*Z�Y�!.�����4߶��5��T\"�w�Ђ�\0�V�s� �0�O!FIkK�V0x
ڶ��C�\'�a��`�����)���j�=R�&4H�d.��4\'b 4y��+�MYI�H�Eڒ�4I7��J���#�
EV|��m]���\0]5���M�����s.=�!��8JF~��a����T���(е����e�\'z����g�>XU롷h+�u4_���%0�C}�g��p\"h>�Bqj����jhb-鑵�MOs�a�J���#��
��[�>G�\\��A��V���܂ݾ]��~�����vf���	+=�Q��yy���Q~Ot�X��4=\\A�k��om��(-j��\0ːVMOġF�<�]�:��J5���2�R��$mh�E��@O-�i�ٖ�d�MS����
�v@\"
�� ��\0���������*87�n��T�V}��e���S�_�Y��\0\0�iCCPICC profile\0\0x�}�=H�P�O[�R*� ␡�hAT�Q�P�
�Vh���Ф!Iqq\\�,V\\�uup�\'G\'E)��\"���q�=�����
Sͮq@�,#�L�ܪ|E�0�>����(��Y_��Iu�Y�}V��7��g�nX��ӛ��y�8�J�B|N<f���.��ƹ谟gF�Lz�8J,;X�`V2T�)☢j��Ϻ�p��Vj�uO��p^[Y�:�!$��%� ��2*��]#�D���A�/�K&W��B�������l��䄛N\0�/��1w�fݶ��m�y��+���6��O��m-vD����&��;���.�#h�����)���5wn�s�>\0�U�88F������ι��Ӛ�C�r�?\"?\0\0[iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:499fdefa-6c0b-4283-9a42-34d2b6a84cbc\"
   xmpMM:InstanceID=\"xmp.iid:07c4d15d-804a-413d-8470-06bdfb5d0482\"
   xmpMM:OriginalDocumentID=\"xmp.did:6a671363-639f-44ae-ac2f-e75917f1dea4\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1602735094808916\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:e251d116-ae0e-4a26-bba5-e5a7048bb038\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:44310647-f9e3-45bd-a6a1-fdc23003a266\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?>�� �\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�
\"bO�0\0\0 \0IDATx��I�dIr&�������c�����Z�����!�XF�C�!B� �p$�w
E�D!�#������3��4 �^���k��=3��bf�<�s��j4�U�9�$%$2�=�#��T?��S}���
����s|���������q}\\c������q}\\c���>�1z}\\c���>�1z}\\c���>�1z}\\��>�1z}\\_��~Q�(��?7�J\0`/_fdW�?����NO�YW��n�3��<=���û��F�h����~�]��\0@
���ʷy�&�Ϧ���w
��_���*c�LŔ`\0�	�``%F�.����
�
LA��lJ�\0�@����_�a�y���@A��}�![��t�+@0h	�J�@f������d��\0L�j��:Kl��=\0�=�(�T��s\0H\\&N��Y�F���}�-���1H�suh2Ib��\0�AK�&-W\\Tp���j����mD����k�~U ��=�ʹ��6�L2�]�$LI�\0#�`#7ey��vgTK�%a����TU�0n�E�,�{\08��.���wTy@D�xG�1Ev��U�g�>�kH\0W��^7�|�*Q\0M2�L�U2@F�+�^	�`�3�=�HF�]c��>�X�s �P6��f��|�㊬D�5��u�\0��X嘅�Q4��2\0ɛV�}Zi�s��\0��L����,�s�&3���a@��E �,ԕ��&�\04�7\\sԸ�@�H��\0�HU&�ȏ��J�4F�)�Ȧ���	�	j����3��*��( ��n�+gMi�����(��È��@��@�V=F���&�-\0��uz�WOקO7�ϵ�\0୛;k\\~m~({\0�M�b�q$`\0(Ͱ�ܑ�`;��qn��i6�b���������&3�$n����J�����R&�T-���k�~��tW)�v��w�S�
��vŇBP�	\0�#��βdPY_�Fl�x�g֝�p�|�	�S�7͸�W\0pkѾv<?�{N� �\0��r��䔫;�\0�\'�!�>�#�X�[�z�v�u�s\0#-\"ڌj�z\'���P#db3�=I��1c���Ld*,�f�y����Pj��}wd�L��w�́ǩv��k�RP�5z\0�n|��t��\'��1�O\0�������Z4�Y`\0��@�ŭh4��\"��z͙5��a�z\0�I�;7E+%��U~������&�2��q�
��҂(�q.�v�T��(blD���1�:�H9\0���q�|\0� \05�Pa=�88]������=�ͣ��!�Zb�0؁�F4��x�9�J�9�j��j\0���e3\0�f�L���|tX0,�t��\003���T�9v�
q8��Y/��c\0����Of|z�F�w޺����@2FM�`�P��Jcr6fa�!
\\M�~����8��v���HK�2����e݄��}<�����>_������~絓�o��&U�h��ۭF�:�]��YGv�4\"*����F�Q5H\03�0;fPɼl\"3q���3Ϛbv�e\0���3�-��������g���������;\0��on/�۝,V�n�\0�@���^��I�7b%V��a(��J�ǎǋC7U#�%�գϞ}�x ���3\0o�v��o�>��u�@������ 
�/�D�L>���a��㘹�����ؠ��
��������Ó���;\'
��,����ŴS�)���Q\0 *Q��jSp.DXA�,�ڤ��r<11\\y�D�/6,զ/̠@S�gf� �J�[����Z�w������=8{�	��\'�Z�a��/��0_�/6C�~���Vŕ��^��u��[���hb��<�8sQr%��t2U�b\0i$�ചI\\Ğ�W~�}���^ܪ������n�ۋ�X�/V�eZ�5\0�jȪJjfV2x�1���\\�l�8q�X޳��� ��q4&�<,LDS(�qQ+��f6]f4]�-PU�����MaO���L���r@����o�QW���O?0�������qx@�ǣ�z4I�.ĝQ0!�����(�/D��e�Q*\'��	FP+�I��
��zɮ�,`�a�4h��Ǚ�����������\0���7_��o}����|�7C�6aԒ��0:Y�JL�lh��i�%\"�D0YQ�Ħ\\Q\0D�0@L�d?5+?�*R��r��v���|�fR�)\'r�H\0��ݶ�y���wO���\0>���~zH����e\03�G>�LyN��K2��Mo�31�]c ݅Q%+v�)d*8�er:!��>�Y����@�׮{���?����9L\0޽�x뎿]��*�1\'\0��S㘝%��QU5���6S\"�L!�d�(�\09��6�J�e\"�	^$2��U%��\'��*��K���\0c6�2��������C�޸}@�=����ϟ?=?�p���vP�A�x#��2�Hl�A0c\"
`��8t��-5S�����,�X��.<
#�5�ؔw�|D{.��D\"�pY���2q\0̀���D�I��EDFj�l�p3��M;�ǌ��H���aff����j	�1y���j�JlD �卑�YLy`�f5\0:>ltl�]���/�?�K\0/L��_o���|��[�o\0�v��|:�1���u���=��	�����[\0s[����⳴�x�/�\0`�X�:�-f�S�
f��P/k��^�JUƤ2�b
1�K8��uy(_��R\"��*f�,NDP�9g��Ht�1�6>^*�ݕ@��oN�sq\0��@��ĘM��$L���l^Eb�d�����kh���m��o�Y �_h�遽c�����f�.{ݯ����K�J�LQ��9�Mz�����_���O��}�
7C�i�����BKh\'bf�(��z�i�\\y��T՘T�s�C��T��b$
2����`��aS�H�r�F�9�)4�y��DU��6�U�g�̙��Я3G��������Q
�v�w��$f��˺j�����B2�bi��s{�^Eg�X�-ｔ�|b�i�l��$��S̪r��
@\\�I�`Ӳ7��HE�rR�TN�АXc���M\0�?99�w��Y���\'���U�Gx%�w�٦UZ�n�y�zK�\\��
��i�b�:�
j�l�j�G���)����r��F�͓��mU�i��4�[�S�#QXɃ��CXx0��X3�����\"YH�D�1�dj�\\{\'\"�ÖY�X.-�H�#*뤠��fY5�Ly������|\"Dd�m7�����ǜ9_�4=\0_�@�u��}?\0h+��y�:�mJ���Ť�õ>��!մ�h]}�:PyW�͋���i�z\0�Il�:QX�Ɯ	�jr9�xI�R��8�e%X��F�W<�O��f\\�̈��q�h���,��܅�\0�*:\08Y�Y��6HZ��T�K�E}-��H�3M\0�b��D��D\'e�z��b�I��Қ1�x��~�����m[�iC�evF��c�¥>ZU��VA\0�4�.:3LL\0�����f\0��T�ԛ��\0��ֲ�l�P��c\0>�ݲ�H�l2C����d:;���L;�«G��E�F�v�&eo)n�OR�c\0��q����Xv�\"��4JUT�ƒ�yOK�c�74Q�֥L.��i���\"��H��\'�L�W�?9�K%�w
P3Sc\"f?�)#E\'\\�/�J����|KU����ծD.�~ZS�甘XƱ��\0r�9W�1M�Ax�\0��)�
P��U�zWT��~�/v�D4�[\0}Lb�,�B�Y�9+��͹�]�m�\"SکvdcB.�]w�� ���w�%���c��J�d	@��ҮF��3r%�:��b��Л�Tk�A織>fy\\z��\0��n����&�\'��R)���>�Z�_�h��*F\'�I�9gU�<_)��j�3�U��{\0�B\0l���-��/,����\'��|?\0��~�e�.�	�nm`i&�?T���.�31ѱ@�:�m���C���K�X���Kh^��W���V��`��P;0�<.��%�8xG�y=_�u�M�����R̌�C\0��-v{��xy�����H��´�{\\�
��]���7��zG��ŵ�A,M�J<IU3�4�ƥmh��}�U���v����F)t���3���)d*c�$/�����R\0�zW�5�X4\0�1�|�4��m�8N����V�Y�{у��L-��6���w�ٮ:\\�|ff **�7��l���ՊyR��=kKK=xPm�omS�8S\0�m,�J\0�`T��9\'�s`+�m��x�@�.-٫
m��^��A5F����I�!� 6�u�eͦ\"a��~ȕwu]��PAg�1�\\B��k��p����@����Y�Y�}�^/�E\"�K��0����b�)b�|��<q�<���W,.jV��\\W�xu΍�Xt�7On|tz��w44�g\0��&�Б��������K�J}��higg���B�\0�������Qv��\0���.�0�ھ}j��l
ݹ7�:���V�`ưi܃�BBĥ�O�-GL�XY˰�n���ߑ
����hX1W�����J�ӝv$L\0g+#Vd���Ke`�<v)W��$q���T
;�Bْ��\0`~��zq���/�����c�ړ���X�Wzi쾬�ŴHZ_�8���N�����q��vA@�9�v��x.ħ!�+���i��X9�+2&GX�1UBU5�n�$�}��1䅿 ���\\}�Y��_��S��D#�Yħ�T\'�Q5S�٘�_ \0?=���8J\"�Z�X�9�,�Ւ��\0M;[n���vRU�6D\0�v�v�*0)[��҆�6���f*=��l��M��8Z�qީ����i��w, �9@�H�)�/�(�ۦP��]i��q䊊\'F��5����	gu��|t�<0I�{Rk;\'}��FStTU�1�EJ����kU+m5%6@
�U��o��4���x�<0;���r���\"v7��iJv�@�$t�d����e+]�C�+ă@\0Ζ�f5�qU���A5�y\0�3k���MߏE���rvd��м�E!���X�l�IT�Ͳ\0\0 \0IDAT]�{\"dr�9C��d�ޑDM��������ѣ�n*`��0Qlo�\"�wlFESt�L
��ܼ�S\',�y]Ϫ*crf��SJN��ښ�\"�1\'ͨ������~v�`qT�3�Xo���R�{vC�F.�f���g��I�]�\0�:�������������1�>�i}�~������]�@�A�J9�1v+�͜���6����}�t��)[b�r�62r[�i�\0�m[�u]gf�	^�;�4Y�m@�Ue�D	Em��c�B���\0�9�1s�=��U�Í��N�l �d�I���jU��d�t%{��������\0m#�D�Y�nxz\09+3����w_�`�������c7C�Ib��1�sN�{��;\0NOOUu޶̜ҘRa#L�I-)�:�\0\'���i��{������v�c��&��̑v�NUU!K9�3�d�\'�	-�� $\"�^DD<�+�AU5B���\'G��ذU%;�X2\0�ƺ��G�Ҭ��ù2\\gf��j�*�4E#�eG�d&\"\'blɸ]�S�rZ�x�\\�5�t,��ia��0����d` f�t]	����1��f�Z���P7�9�NX��Jʖy��v��\"�lZ��c��H�\0�2m!��*�
�aL�O)�1��_X�Gze,l��_�^�/�/�x�r�vb%�f ��_���E�d��8/��eڟ�r�gUR4�
��
cx���\\i�����{u����tGD�R\0mDa�҈߷=�yї���5���@����f�&�MIa)iJ��cy�v΅\\��V�ټg�]?zqu�l\"\0\'ԍC����I!;���Q����oܸQh������BU�E��.6�sJY�!_]�Jǉ�/�q�e���@7��*�^�l�`vxx��[>�X�������\0��*�w�&Δrǡ��~,�\"�1�1+ΕIA�i�a8;�\0P�����J�}_��Ha>��f3\0�Y !x�}�xUU�y�P�M�D����r͒f\0	��l���\0$5f�1)�X^���m;�TUe$�?����)�Xwrr�捣B��*.\0=={^ .�·��Y��*�n?&���\0)/-\"UU�ko�8[Q1��ܾ�J�bP2V����Ф!9_Y����7m\\V�~%��K���\"�x����_��[�U�*q+*�����+��s�s�K���I�K���Y������R/�6��.����зm�Kq�\0`�
uSNa���ڥ��	��D�)ʪ�:�l1�g-\0�+\"꺮��24CI��8N�f`�\\����ޗ�
 9q��t\\�څ1Ea��^c�\\|f�7�4���CP�9�5��?����Bpմ�Bx���b�8<\\t]�\\.Cp\04��v�^/SJj9F\0mT�ж,E�BqceSS�k���0���u�P^�������YwC|(;��JB��.�1�U��rN{sp���f�[�P�0mq���9e0�4��R&�cO\0�:(��.�Ţjj\0I�=S.�=S��,��y�b�u�{fǘS�\'n�\0�n�����g�v=nR,D	i��>�1*/9O>;�n����4 ��j���<t۴k{:�y<��|�ΛB\0f�j��-���zY4N�}���8�˻5�KR��u�k�97)�:QC�]UO^��
9�a�|@�y�ǲ�0\'���I6-綩*\'۾�Ax�p%���f��@K*q�R�~w��LD��ݺ`4T��k&���Z8��t�Ή�8\\�{I�,M��e�@;��U�vm2��P\0�YjΚ�//=C7̒U5��:��+K�9�TUMJɌ�����X�;������~J�)�>F�0:\0�t����|�z�M\0N=!�,o���������<sn��O�\"��d�8(Qa�uϖ+\0MӤ�B�4n.�%�(x�bL�EQ�ɱ��>�5U[W\0n�{lo4��z��ŋY]�=HX�BpLM��nݼy|�(����RJݶ�������z}��M}rr���s\0}̳�<��f�L�?z��_.��n�/�>��3\0��[���۷�3S\0���N��]�����o>��889_m����]�#�X���\0�fv�Ν�m���y[W`�a����ɯ���>�I���O4�0;|�����Pb�F�Ě�
@�]�ȋY�=�cf���r>K	@JZ׭g�˲�^�B�(���!��
�<�u���
z���ɝ�,粩%��Ws\\h�L�wǺ��EUUEu>8��[}~��=7k���Eh�p����A�\\�\0�VHL}�����{����Άn}v�z|Ǣ�\0�z�R�G���$\'UK3��\0�]!X��v�\\o�mўڶ}����Ǐ��.��\'������o��o�/���Z�!���[��\\��8�ɿ�7����\0@���i蛺:99�i,r];!b2e�\0��Ts���s=��4�C�c�\0�
�b�����������������?����\'e�)���;����n��w�����8??�o���f����������O����ܽyrtr��������O�x�ͷNS���S3vq���\"|J��ڶm��`��p����������;o�p5�vn~Tݲ�M�t�L��[e��k̑�����h��WÓ��ӓ�7�������EN�
��������=�X��Ɣ��f>������<�����\'�}�p�8;;��_����j�L?�я>���>��\\�\0�us||�h��+;\0���Q�r�q�8����:;�Xm7�k��Qw~����g��vlK�t����}�1���Y]�յw7l\\lBn��x\0$^�g�	�AB�;$$��y��]���֊�yw73.|��z7\\�������2Wd�5�w7���~K{�y�|���7�׿������O?���:�9�_�;�_�����I ^��5��G\0���A�W_]����y�1������T�����ч�O�i��������ؕ���_���.�j�&!�Mc|���R��zp�^�0Q��CJ�>} �-��A+�����#s��ܳ�ŝ\0ނ�)��3T�iZ\0���CgD��3�������Ǿ���N������E�}�v����ei�o��6���}ߥ[��Rk�ӟ���aC@w�<�˲,KQ\0�n�
���#�6eF��5�S�F�܈�h[��IU�b4�[S��cb�u.�@�,0S;}�|����\0�^���q�\0		��7��ʄ$&�̿��i�+��6#?;$��G�Y��fV��D���T�()v!��۽�G\0]Jw��C���0�c���B�͘�$1�x���;^Mr�{�Qdi�3\"bb�f�|9I�:u]gӼ��dN��IIZLfk����:�������T��N�����\0�]��0j���\0��9D��P�.���kh$�\\�;_f�UhB�2�\0�9�_=~��e7MS�ff~xx��ͻ6%����ԁ&@��g��g��$�����$X��`�Z��
Z��������T��2;���4�Dlh$�u:�S�j��\0�PX1-��\"�4�^�]�s��o��D�1��YE$6L�&���j����r���1M<,�/�\0(\"!<Za3p�g9[_�5\"��d�������ǡ\0Hî�k1	��:��]���Öo�)Ůe���%/�R�~�s�8_��x<��W�_�!�Z�4���
-�I�4k�ժ��x\0��QLs�����G&\"�B$�V=<�/%[FMG�S)����S0��}�k�F!i;q؋�Y^��KD�\0��Ԑ5F(7N`Qf��I���@��C�T��
@�R17rb��\0�NB4b�.�O�>}��+���U�߼��a�������c𖢦�b(�2|�2�`Y̙ćO��#�����W�l+6�F��v-T	D\0���p,����F�t���Cd�ddBkP����7:�Z|@b��#E�V���HL���-pV���UU[�A�l�Ĥk��N��8�a��b
����}�I��ߍ��;�3�͐�v\'� A�%<��[-b���ִ��V�Z\0\"��jn�Q�Zݽs\'3��k����q������c��̀�B�\"#vn�E�H��H n7���t���Os)Os0S�{��/��!��ӵ*$fc��_�m/�͕N��v�!�IPܺ蟡��ݶj�F
a�.����`A0s�z�n��$�A������g?���K˒j�4Qj�{�M��@
5Um�3+V�IU]�k���i{�0@ܐ��D7��߻F�!�6���Qm�[3��\0�BD�M,I��\'�������߽z�p>�_?_`�n��ƨ��$0��
�*?�b���M6��}�i�}=\0�@�5 �%�lL��k�`�LB$$�²漘o���=~�l�J̲�5�@p���֢;1Kd!!��R(V���w��G\0w���`O�>p����1ϥ���t�L�\"��bi�RK;:B�1�兄�f�3��%�%�:t �3���C�\'s`�4�.�����m�p�Sp��L0��I\0�]�K�˧�˫��O����3��_����<?�a�c�-��\0�x1��w2F��}4���\0�$�& �^���x��w&H\0��-���\0�-��]��mE쐓��m��I�Lpƺqn&U#r�HL���%�Rs�������!�kY�a�8��w]QY���2�(�\0\0 \0IDATJ
!DB,e#���0��sǴ\"_`�g[C�(G5oc�����s�fR���3Ssu���cfF�)<���y�?������_<����h_��m�J��BeT^��_�Y��6UJjZ
���XZ���[-$����\"�0���Uô�-/���n��R������St%�-D�&Yl�����kʙ�6�IΙ�]b�����
�C	ϐ��H~�b��Ri����?�Y/]�����T��ie���ų�	F`s�V�dP���ʶt��F�lN��W���P[��R��b�f$�����Yɥ��\0����}�8
����~�(D\0\\k���\\.e�R;�g������\'�����k
��x��+���U�b\0��V6\0��\0K��|�k��ㇿ����˿��q��K�þ�����/~�S\0��↧S`�vm��������_��7����Y�O�w�~��}��-�NXk��qǥ]>������x8ܕ���p�$��M�z��.hfU��<0	M�B�V1�0#5n�����R��r�m�V�������g�������}�wo����Vd`��\\�L���T_l>��3\0�΢n�e������,
�L3w]OҰ�l�E}�˥��ڕ���[c����5�y�ރL��o	��f-���=tc���Z�v���]޿���>]h�\0 3[-V3{�1KSM(��-	0���@?\0\0�K�ʴ^=��7B;�6S���n��5U�5�ܬM��CÍA����n��c�����O6��2���<�����\0o������n7������x���M����������7�_�D~��	�e��2.�~z:v�֍8���R��W2c�����z}{7l�u��ޚh�TU-Z���V!1���ۚu�k��݌6�@h\\3p���~�?0
d��ß�Pl-���|vp�Q8H53��.�޺Bs-
����:v};�Ï��&����]<���ḋ]����q���bD�RCJ�a����\0�6E<�%c������|�3�[�ZM�:�R�\0�?]�y��B2�i��\0�f�;��lR��[��F������`�^
ت�I��%[]�;�6��7���[
Ԃ�84�U[O���W��b\0�v�
�����4�ըȚ*fQ%QT1�U�M������ZUWU�r�)�O�K.��:\0���c��/Kb�/�Z5t�|>��k���~���ߒ�0��]솮,�<�fx�gl���3�X�eYr��I�`�9CXDZ(B{�k��~��2/�-\\�D�w}
ð/y���Z�\"�M
�>��Y��^�\0Y;����R�/<g7#u8}�y��\0@�?>>߅!�u����xy��-��D��� +f��x��V	�2�HJ�f�����9C  ���.�*=qf>�Ny�����&2z||��o��gj����8�����]�@��$� ��&��8��~ ��n�� ���9�(�f$�8�������Rʛ��7��@�φg-qOaAR#\0.�g5s�@ClfQww�������1�T�;g�~��^� �S��}��p��U����5~s����?��\";�\'�C|U�6�Q3����R��n}?\0p�P5��c�Sa\0��xp~���0GyLy��C��<��.���L�ϴ�
ລ!6rjk�QH��˲Ly��	j^�\0���`���S���I5��jJ�����[��S��)��\0G\\�?��������_\0�W��劉�e��;�\0BrBU���g�mqc���w�����h�B��+I�n�\0�z����������b����Iݎ�Ş@�Y#��
94�r�y.N���~�\'\0|
�ph�Xv�)\\Z�i�1���:�YDa\'GY*���M�}��~��z_�`wO��ҁ{��jY4�����Z����?�o�rm��
)# c�ZR<��ͯ��K����L{I\"Na��j�,L�bk�I��g��s��q4�׳�x�p)�S�\\�ߥ@�d���T򦔀���~\'�������={-Z�������펇f���Ny^����B\\CL=3����i�8s�N�Qbh�8HdW[����v��ha�M��qx����|f��h
;C��.[Xa���D��r��B�K�v}[��枺�8^�w�@�5t�ׯv{�D<���ð��.�L���a�E�ֵ���RJ\'i
�q�T͛�X!���b��z�S�h�VJ�����y�j.}�[.�8�%������)\\D>���Y�uد�^UK�L�ٴKm��n�핑n��>z�jF�a�P����SƩ�i8:��T ui��d��m��& �5�q�f��ؚ8BhNa���\0*�v��]�~�@��wns��6V���g{�y{6�i�H������ӧ�� ������?�)�Z�`�e)ٝ�8���X��K��v}�x#?֥��yY���,˵�h���C�uDx����k.I�|]\0\\u,E��}��\0���e·���x����ZKQ�	$�H�Z�1�@M��NR)��K6U\"��ı�8�ë��4,Hk���r�MWp�C�R��6��=IКi{��%��MB����-���6�������_�/�?1K��\\
ƤUl��xeH-�4�b�����}�+����q�Ф�1&���i���;�M��p���r�.uϡ�R�vOHݱ��\\UR��M�<�:��6W&��ފ���#\0�bq����������ߝ��W�pJ��,Տ\0��gW�n�bl��@W�����*����)YM���\\?���i�v3�zL��iJ��f]2�5���GN\0�A�i�@k6�c�˲���p8P�o{UѼ\00U�G	m��.�Z�+������ڿ�$槓5+=S�p˶�O�\0fP5us�]1U��y�b;\\�2�y*Ku�C�\\�4KD�ei���.��#�m� ���~�n0s�8D
�P<����iߘK��ա���}ַ
�y��`�}���.�4-�<W\0ˡ����csi�2�6��M�_A�dn�V[�H뢪�O��:��Ǐ��r8Lu<_~���[��n�}l�����½tQ�$���
ך�A����i)�e�����A���8�b��{��x���q.���*��y�KS,-en91�ZM)I�MT��\"q�7�\0If&D+���4���3�@	��<]Oz�]��.����#��}��?����
}��0
w���T�����Gc�Sh�MP#����-Vgv_�fpu�\0\\��J`������Ǐ)�!u��?\08����~�p�@�n���EY-\0֚�+��@ꢄ�k~>_�����4�9�n�w�C#�|���w?<��Y�u���L-}��/�H���LA���6֕��F��\\�M�)������}*�=�S��S�U@���;�3q�k��;5o�bk�d����:*��_��iZ����^�Yw�\0�X7-���gd�pq�Bj��\\��ө��w�r�t񫯿y��5\0WG��ŸedY·�>:m���)Ń��iA�V��x���� o��4��R|z>�N�Х�W���y���7>~z/?}zzj���u��a��9S�)̜bc!lfWo^�Z��
�PUP�����E���1�T�����w�w�t�)�����}��uEq���|0��\\�Fa��:W\0u^,u��a��D�\0�+X\\WTh3�����M�`s^���	@���w?t�.ue�ۖ٥�Xh�����n�O�ˢ����� ��ڿ;术�d�s�����|:]B�\0��n7�S�R깜��x<�ϧW����WF\0����t���<�����\\�e��%gSmAg
5wgy9�C��<�\\uq���
*��4T�\0��k>/�~��dk��@ԕ��B��Z�o$\0X�b>�<�xJC�@\"�QF���
�kqV
�XDB���Y\'��x�8����te��V��O5�X�8�8H*V�R̺���������[���(�\'�$a��s�8A��#�V��Z�iɥ)Y�6/������#3� !�����!��[��%\0�i\0�Z��R��Ʈ-��J��f�6D�����xJɎ�����#!�6�t���yF\0p��He/}�AB-�Ә�H��xK���y�N�)32��K1���3s3�O��Ǐ���LE�3����3�Z�Z+�w}��$ 2}��U�2�������V�<��f�F�6�E0��Ժ���uCO�R��[\'uu97��Vۑ,�\"B�ЯW�Z�X�s�*%\0�:x�s�*���z�u���w�\\�Ԋ�&�歊\"�U*���&)���c�3r3
��!�S��.�#�\'c���:[J��[hxeRm�+��(�[���V����`vk��*���`�ݨK.��eN)���<^Z������z��0C���~�L�o]��Z�y�����[8�K�8��ՠ������BG\"�q:�Gup-�5��$\0\0 \0IDATuT@EY	�&g6~8�����փ�uY�M4�(G&#V&�[����ǏI�
�X���:�ԗsҝA�=Y�}�C�Ӣ-jB���?��{�7�YQ�K��ss]�tnZ4�-� mZ�s����yn��!u�6��B($���� ^\02�����&�a3g���?Џ�W�h�%@��U�3��-���R�z+>�#ǰL�m3s�+č�߸\'n�]��6�ײ,e�3�MS|˄m�З!�a��g`�Y�����@�y[ث!��ת>N��`��R�;��j�\0��b�RJ�8~��4MW\0�_�~s��^�\0��\0$��O\\R�\0H>%���J/�d[�X��`?1\"�\0r��E�Ow��_?�g\0��g�X�T]�k�6�13�P�V\0���� A������ڢfV���1>=>�����Gb��~�W���-�����v1�q�n�r�ޙ���G���wߙ!�hf�q��!Iz]j��R
���Za��_���4M��e^�a�b������\\��v�2*]�o:g�o������?�o���-���x�wmֿ,Y~�����,���P���=g.��S/�ZM+���^�w5�6��،�A��Ծ�hs��ɷN��^����vIM)Q)��|r��<s)%��%�\0cVx��hM��9��S��sbw�[5�N�,�����~}M杳Y��+�y��LK\0�
�sY`O����������������<`�y���E��a���VMuQ,\0̪{9��/ϾLKY2��˘�T�EB
֞���-Ck�~#�,�\0`X�9�n���ZUk)�~8\0�ݱ,�:O��>4���qi�0�@�r5ff������k-�.l��+~L�^T����uLsa�1	q)��I��Z�H�u�%��zU�U\0�̉E��,6}���������Ϳ���?�l5����[��B�����\"qj̦iD�ي�E�r<4aG�ӔsY�JF�-�n�˰�sG�1+7��*,��\"
��P��/\0
�.�.圳)�q�D��.y�]�.��B(�������� ���,\"!�Fv���C 	JlfM��\"��D�b\0� �2/��_\'�5��~��=��~w����iZfvNB�Y�����DNO�{ol�u��}k���g��=�h\0$1$H��(Τ,cGS)��yIe����/y�K^�O�rY�C�ٖT��*M�(q(�\0H����@7��t��{�<�����\0�)��r�q��s�9���^㷾��~�O��_\0���k����/���u�NA����\0Td �q����!����+��>T�>	p�e\0\"s�u�Q6A��=\0�b`%p�7䔥�I��VF{�FE�xI�8G�t��6R1c�\\�4�
P�$�d��4q�5�B�o�J-J� �P�s\'�Tp����	��ino�si�$I�ќ���`�n�7M��c+��dq��5\0�y�[��s��k�\\v���\00�Y/��a`���i�6��$�$N�����E��C���EY��y�$	-�W���$�
�V�t�����5�x��W�/��ϋb2�U��\"G0T��	���d��V��!�ɤi���u=�Ϗ��Z��q��|m/��j��
3�P��W��bF��o���|0�z=k\"�\0	�F�\"����C����?��g7��+W~��co���X�����c�t�&Z�u�er��BFN����d���:.�\0������ֵ��R�b�D��,�ʡ6́\0�s�%���
\0����?�ȇ����ꍃ��\0�OK�xu/���:(=iN�a�+m�b\0~f�B	�5\0Bܠ�C\"t�ӌ�E(g��x1`�y>N�4���ۧ0���}��k_��g�Q�g�\0�o\"
\0Lb[?�ˌ�j�(K��v`�M��\0�c|�����}9�7��\0Gqհ�Y��Rb
 FDكkM!�|@�<t������|
��#�[�%e�ϰ6��Ь�0@[ c\"�k�q�z-\"\0Q9�^�O=y��\'�/�dTo���aSu�c�\0��FUo	&�\"�-����K]�R��\"\"*}k��6\"c�<B	�CK&:af۪ȱ����X5m��,^饰���j��L�$�%���Y����ޒ���˲,˜3j���ҀI,	,�s%�$��V�!p���>x���\0N�;/���i�)>�\0���}a^��@F�S�j��<�21�+�?۱��1W�F�\0� �	��چ\\=S\0�������66#�fl��K�����Z�r�esf�\0D���Ȼ�a�@Dy�4��/�{����R%`\"�Z�BgR��z����q�{c�R�&�&4�^�!kI��;�c���8�C��\' ��$I|UF֤J�\'y�YK�m�Jg( ��������.M��,�@\0g�»7�y`{��\\��)\0{��?�ַKZ��	M��H*
�dHL+�R��B~���Ƶ�w��
Y���[DTM���0L����\0<t�}��v{��A,sA
@���ob����vM���R�����o؏zH	����bM�G=�b�&P]�\\�ɭ�h�|�\0��Q�nf׿�>H|�u\0��Gk���s\"�������i\0�4f����Ъ@��C���8��<2�I�:�żD�8�\0i=Pk��#\"��bҙ)K���.�g��lZ�\\��NQ���P�,��6��sU]lmmk�;c�s�0@�T}�x|�Ҥ���D��<<��_�u�}�\0���ln����\0����?����[���_�f7
�ݷ�{{��FB�ۂ-��;���8�~���\0J[4����2~�c���g>��>2@S9>zc-f�E��gY/I��*w�v�,-�@�4F��^�J��+�\\��,��\"�b�\0tW����e2�a\"#�5��ҕvG�HDL�Ǯ���|p�G	�Ƈ����qm0��z\"¡��Dm����3�R��H�=�n\'U*ل�53�͢����)\0�*H`q��&R�s����?���K�Kn]��`~�rz�<�M�v�E�|���(���F��<�P���Rd�\0��N�\"����i�ԅ�T
\02�i�t\"�i���5��\0Dq�y�w���Μ~��?p1�Y�΀,ô
���\\��X�@���DJ(-bDe�;��FF�QY�!�ض�S����mZ�#a��4�Gq��o�C��ߊaH-�j��|Y�E���8�(��~��#)OIBT�#g�����_�������FQ>�.��29I|M��$�o%��Ms�/�\0�b�s�F$T�\0�����cO>�����7l�8��\'��p�y I�M���:�������+���3�a6b9clۘ���v���#:>�4��=K�4K��VB�GJ#��k�o ��K�9F�}&��U} r�&q4(o�i@��^_Z,�H�]��=(\"\"��
��x8ج+��\0�,�[;A����n�n(��[&g����j%US��eQ���R$7!X�K�3kW)�Tz��<�\0C���ji�\"��ɹ��	���f�*@#h��H�3o��HȒ�q�6q���v�1nWM�|��v4��
Fn�mS��n�Q�	�U֟nqaC	��)}YA�g��\'.�>r��/={f�i=����Ǳs��϶fqq���	q2��������}\0��W�!񁂸�\0��:/�Vˡ�0�ٰ�ǒ��0�3����mb
1�mR&�v����D�Ӧ)Q��I�d�3�^����)���zY���f)�
6`!Q�>��*�k�#e�QYrY����.�Є�*.Ϝ*!	7u� H�Aʷ�`���n|�Ï|����b���0Y�Y�y?�ti�F���<�I���LMj>�FQ9;�Ln�s��W_�����o{��eI���6��\0��ֈ��Kt�L��Y:�fI?�9������M#fߴ$]�m�K�2�Q�vT\"��\0Y㌍���ұu�ıY&ݻR�(�]��
u���,��rqVT���1�$���ɻ��?��>�0�����{nkg{m}c6��GC\0Yg0բ�!Ԍ�-\0���o�|H��C|��C\0����.��l�xxʭ�px0Ch`,�*�{\0�,��f����s4�P��8��_�i.mL��Ȱ4M�46�L�7�V������Gd!�b:�L=C$�Hl
�ˆ��d���O�\0��lf�a����o?s&��C�<����;�qS\0H3ʐ��I+5�����q g�86\08ˌ1���z=U޾��^~��������{f#kʲ4+E�mE�N&���E�!�v�Xa����VH�6ڊ�Sd�s�Yס�,��\0}ғZ�����r�ۿ�辶��M/���k�C<w����������r�)Z;?s�{�A`,�iT������G���ù3\0�{v��
\0��h�O��
� Qa)��t1�OM�����\0<s���ήme³����l`w�lmm%�-�iY.\0DQb�b��p(I�A\0gZ.�,E$Mb��U����n]�O>�䷿����H���Ȑ��孥VD��Y��۾<����PD l��N������r�ΏZ2��j?�hه�-���#���O�G����l10�N������=��[;�EQ���I��SL�&*Q@���ؖ�)�Bݞ�B�j����%g�R\0l��c^��dz\0�?�ȣ�^{������y�\"_?�\\�5��a��� �MYz�,��
I0�]��!���t���
Y
��n<�|}w]��H��nT�&��xV,���}��ggG������˒$�����_\"b�\"$��,1�CV�L��
[\"�����mK��$\\�4+n$g����\0n��=�ڕ��n�_z�
 À�Q0����4�	,���8�#�+�ҮJ`�O���Ѣ��on|��{����t����4
*Y����G�@T@G�S�G���@�,#�]=N�n!�M9�0ֻ�X�Z}��N�O�Q����,�?��S[�;�o�$�/[�v�{�^�$��<��4cIT�Ȝ���TM
92L�v[�D��D$1��K��7$*���T ېud�K+GF{	j1z���dy~k?���|��\0޼t�i��.���ꪐeK�,H\0�%u����~��SmC\"D�,����Dz*��K%�\'\"X�%N�WV��Oi�]Ӛh�r�w;Ի��?��,�=�Μ=��sy��㉺���ֵ��j@`1�V޿m6�H1��q6�.VՑ�:�uDĢ꿐��1X��ޗ�QP�3\0ۃ���Q\\��m�\0����sk�=��^�Ͽx��˯\00��+�۬ߏ�h��\08�W��9��c[��_<=��=z��E\0�m���h��뢘T�T1`}���*_V��\0���v�G��	ٶ�`�[�Bb
BݍH����	�C�&�܃E��fY���T/0�/��\'noo=O�!�&6�>���o���5�E�Yn���O��jz�1$�1 ��v����;��U�ٽ��I�HYh�@6��bal����\"��B���S�����~������h8���q�
7ֈ*8	����W�&@�����[����v�þ 1Ҫ}v�Ȣ�2����Ъ���v�&�snsggggg8v���iOT���Դ��얫(��;x�-X}�o�D��Q8jy�E��y�4�~��z�n	 �㍍
��u�}��*L���Z	Fbn7��R�?UUK����g�y���;8����h�7��7GJ��V�-�0<�X�w{ zw��UV��̬�x��<��*=�A��� @X�VqY7�o�4�+��\0)`�������ԩS:-�B?�VH���EvY�6�J]�z�V
,�^/��&IN�a���ܹ&�J�X=(w�,�=��O9����ݖ6	�h�0s�\\�߯�R\'��APE�\'gϟ�wz���W�vw˪�΋���v�	���M`���Pِn/�#�%	�o��h�(�&��Ү�H�e�zCݪ6a�}؇�9(�=[�����Ei��(�������!�k�-�)���v��:�����S޸;ʌ���j�WGEmK�����󪪈�ˤ˲<>>vi���>X\0I�\"��r�ι��FI\'އ^O\'*:�$��qO&��u�ٲX,�{�Xt�W�\\��>�c}fY���\\�����~�����$I4_�e���z^,�*��j����$UR�b13Di�N�j�����(���i7���3o�u��~1��F�e�
��?�G/^�<��oeY�O�D��^ƺ����\\�?�B�%�dK�s�&��>;��|Q��t:��j��y�.���J_z4ݺuk8�#[�b�[�n��������wW��7n8m_/��~;#kW�<^w6/�����Ij>���	b�ƑV�=&.X�ڼ{��8K�IBc`M���Q�������~L��\0��v�<ɲލ�o�����|�+6��677��T
B�)Á;�\0,	kt{�Y�H��w�<���	 �cKT�uM�h�� ��Uճ*��\"�k׮EI�7�3��[����S�N=��g\0|�S�������t���l2�tm����|Q�嫯����.\\��C�,˴O���$ןe�n�pG�Iw�����K�8n��w�z���}��@��yQ\"RVe�o2�E�(J��nzw��9g�ŒC�z�e�!=
��6\\�-3�r�w���,��zY��b��qB�$*O�zb�K�6z���8:�O�@?K�������_}�/o޼�%)��t�6X�o�A]�����������[����3�NwvO������X��%�H�\'\0���Ũ�8��u7��W{P?ԉv�\"T׵���zm%����.\\�pp4�ʑ^�g��Ɔ��/���3?:bV�=�}\0�n�l���;�����!��~������ɳ|:�v��q�F����2�K�\"�7
T�U]�ЪL���K�J\"Bb���a98q]�!t5�ni��FZ-v��ƷZ3u;�KVbi��I
,ď�vԔB�S�Cˎ�B͎�5?ӥ��h��(�A;ëΜ�E�Zӑ�F#km�+ͯ%UU]�r��~���/��SȽ~~���E���\\���i�?��?-�n8��,Io\\{�����psc�����y�k_���/�ȁ91J��>��w�eF?K�HW�ul�o��0bU ��kȷ�:礣������Fn��(J���`g��d2y��|��{�����UU�i�ֻ�.�E����w_{��w޹��QTUQ��*��{����ia_y�\0����/>��}(�����\"\0�~~���e>Vtȵ4M�K�$*�P׍vӜ3�h.r��Չk!MS����w�·���VW�]�Z�l�>\\���4vk\"�\'�Z[EQ���|�;	���:(�%ȩk7���CMS��8��̜��>p���7�x��_�y����<KV\'�ι���\0\0 \0IDAT�l��B���lcc#����,��������R3XKgO�βlgk�c�
S�҈}�������ߎ?���T^U�$,�%�x:��x<�hXN흾v�\\��_���}�\0�e}���͍�EYյׄ{{w�,�&ԓ��������.���Te%�����E���pm]G���	�����Ǟ���}B�XY�n��Ǿ۹MӴ,�6�1�q�W�M]�(�y9�T������ѣ�z_t��,��d���{G�%-�K���G�;jâ��;f���0�B;��j��m��v��$���m��\"�[[[�y�ƥK�.]��֭[u]gY��{���^����x�as�
�	A{s����FD�eU��p�e`�(ֶ����ǟ8����{��\0��ci�/JM�EW;Jegi,�u��<�l��Yv���4!cmQ�(���
���X������~x��+\0.^�����$Y���.�c�,ӛ��k����*�N|��mG��V�YVm�\'�ҟ�;�ig�=��`0���f�\0�i�i�WomV�j�i3�(�p���o���+��rx��g+O	�*8�\\ �f&���q��q��L�m����!I�Ⱥ�Ѩ��qΓT�7I�̊��N��?:�+�0.\0��<�X������z<�l��im�ߛO\'6�E��2 1�\"�YB�h�6�Y�����E�4�\"\0;�Ϝ>{��ٳ�=�D��n>`:���f�������̲L�����L�Tb7.�(��������8k��A��_����q�����[\0����~�7~s{k�ܹs����zN���Y��ͩ|Y���
��,KD�q3Ռs.I��(Y6�2\"��ǃ��(����4��Lg3�D��R�y]6982�?���~p�g����N����ڶm�@|�P�>���Ko;�0��$�-ʢ���������{����/�_�_���u��3hj7�Qlķn��(��<Mc�<MSkZ�\"
�X*��n[���
��pMSc�l6{���d2�����$	2Z��b-pkv��v��UU�z=ޛ��l��F�?���@k��\0��TE��A��UT�.�����o����Ο?�˪�q��;�� g��u���H��U�RqLDJ�\"hg�����~��}��ZK������2�����[2�hh	8Rj)4�[~�@J!b�B �Nt����Z��IJi)ea:g�{��d�DΉ�.?��D�Ή��Q�
�Ϳ�w�q���ϧy��O�_���]P���5�����$�uu���z�b1���Xa�u2ڢ(X�%Қ���h�G%	��7�T�U��4ggg;���?������(� T���ӧ���?i#l,c�p�gϞ���U������@���_^F7��d��2����E�G�!K���b\"
�ԫ�Z,�� �zi� ���Z��	��m�RQ���%)u(u�CD�Pa��0�DꐫÍUc�
-U`�h�
4B]�p� mI�0B���f<Ě������eg�X�3���F�ƄoI�������D�e�8���y>�J�^vY��8!$l}�ȀDQ�j6O)�\0>���j;��\"\0����	!�����e��5�ti�8�;�����<y~FD���w����ӏ��(gjo֐sh�6�4 ]��1NG��2LN��}��M=����4���������g��Qꖔ$hJ�R��~��0[n��2+HV�d���%c[�(A�:�u�ZF� �
\'p8�B����`�(՗�э����x<���g�+�����Rp�Y���m���
��\0e/jMS5F:+è�ˋ��G~��Қ�\'_Zg�f�
G6U����.��QQD�
�����?���k.�;{�2�����������pw�X�ڴ�5A
�ֹ�&,���ql�)-��R�%C���u���,�V ��g��*D#�dr	pg�$���%�\"�s�޽{��@�Z�PJ=\"RA�����O��R��0��3�N}e=����F�6?6�Nz�4��7#� p�J��5�Z��d2�}ǥ5�Z�GBA��;�G�|�ԣ�}���+�� &�(L�ւT�a��qg�,�����t��#A��mթ!#�Y業mۺ�DACE�US�� O�N~1�;�_�ڻ�^^�=~��r]�Z:%����&?ն֭�ڡ�2Ɇo~���ui6x���,<xp~1>::J�d>��Un*2ġs�4�����R9!��D$uH�VR�U[�k�n;��Yҁ����*��TAǭ�aCAVM�1I�SUU��� �	I5ʶ�O�th��p8�!�H����*��7���Q���� ��/��P�Q�DIZ��J��l�q]�ֶI�[��Q�k�Ua�HQ�C!�+�i��U�&\"�2O��
-⨇� {�K;-;�I����b8�V�T׼�B!D˺�q`�5{��Y>��z�9�9a\'�-�� ��0!��󋯿u(�v���x��L�O?���_��o}������[w�Q��|:�a���M�������ʷ���? ��;\'sRe�J)]�!��|��\"����q1+�����L� orl��r��3����nk N�J�^�y-s���<o�$���&���*r�H��J�ho�!$%FI���H����3֠A,�㻇EQp��4M�m�l��bw�ŋ���������s�	p0������z����]�Jo#���q���RJ)�
���Q���(\\�;���D���
����K��r\0\0��!������CN��g���:����ZZڮ�HX3���8�����}��\'DԖ�������Y��0k�iYUV��>x������04B
VM]/�0hK��Bn���������{��q��0��(����{�t��2M�.<ZV���J=Z����e�l=�[���`��(C�VXL���ނ0��g�\"vy�8�W�K�9�T��J�=��^+2��i��ˡ����[ ��0��� -�.��k������a�h�SN�Q�B�M5_^Nf��{����LD�(*[���Y�u�D�����?|����e)܉@EQP55��Q��m�f^��������HpV��\\��(�7i�I��ҧ0#~��Gt����p$��;�B�үGB�{�M���D·[����??���u�O�5�x�眔�1
;�s�A���?�ˋ�D�z��JO3K�(��^��ۮGW�]�S���x�u=��\'�
�xH6���\'���9����F���?�%�4�����xЎu���h��.���92��q�yS�	&���}\"��q��O��,�reBJC����0���K���,�2<V�Z�e)v])�e�t:=<<������v4�����Ɠi��$DYV*�ƹ$M���D�$痗Y@JEq�G��˪�{�E]��5ƶ�~��޷�=�����	%��1Ƙ����q���k��i괟~��r9>eoot*6}�L/����xD�i�bg�����RR��t�\'�Y���b�P�����X
F��m��Z�#f�W���Q;�h��gepԍ2���η��x��l�o�u]��P%n��%Xq�|/��P��d��0UKD΀�S ��+�Q��</����xgoWZ�&���B�ɬ,k���$q����k��ݸ�*�~����Ft�V���xߡ��>�>Wz�Wfﮤz��#g��3DK# y��	q�ōE*���-�	�^Bq^dy�?��n�:���O��&\"[y�<DZId� �H:2�5�E����\0�vyy��;����Eq�CKBQ�$Y?��uc@�e��(
Uh�X�bn8jB;+�0K�Y!���F@_��ˊ�F�]/4\\\'��y�\0?��/vᥔ�8F�^�n\0�i*�T�Ã(����b<���|qq1�ϫ���?��?x��[q�k[D�-�	�`4q2���E-��ɏ�^N:���ھ�XbF�����i|.ֲO��UݘCd=�Y��,��\"Mǻlң~��O���[��F
:h�R3H@�0��6��3̿:[��z4�,���~�����m}�:�T���n\'��2ι�X��*�\'�#\\��y��ٿ������GϞ��O�������,�[g�8^,�Ţ����~���lo\'M�4�л��\'�dYƝ�kW��Wԣ�)���G�0У08����5�J8��Q�r�A/;�(�Mo�!C��,��	k��M���\0eAB*
Bu��Ē��Ȳ,��a(tGH�b�H��\\��ވ*�/�]]��g�Y�L@�$���$��^��k:��-Ӷa��ES��p��<_TM��p\'��|�@sfE�i�����p���DdH<��h����������o��DT֍�B(�z6��ij�6��� C������7-ɤ����a&׀3��y�jM� �Ţ��f�m��:�{Z�uݢ|жm�9a�5�C�:r��`\0�y�Ey�����r�����<��֥֙�~>+:��R�i�Wi)�VR���ֲ�Lv�s���W��x<>>>�R�M��{������nc�o�D{-w������/��\\�<��mY�8�����]M�4J)k	h���|>�A����[����u\\j�J��	�����[��L�	��7?�����x66_�}K[��B�F��}2G޼(���\'.o��ŉ[.=^��?��t�O�*��bՍ2�y8d��%i�7�b\0�g�V�=�4��^0���o��6֐\'i��\0m!֧�/�.�F��������h\\l\\�h�B��¶������O��2�aEW����~��뇳B}]�+f:_�떓�7����Hq�.�&Ɣ\0D��Q��\'�2Pܠ���ݻLr���6�Y�ew�	5$ņ� f}��eyv2${c��?`n=X�HQ)�����q��L;���p�_�WѣH���䧫����
e��8��*0����\0\\|�>�����+n���%ѳB��\00���߀X
�i�@��7�Rܳ���eY�%nt~~
�����h?�Ѝu[˓��ZW�R�v�o��u1���n���.���/�oIyq�c۶DW��!���b���ݕ\0X1j��u�8M�U�(�i���{\"2��1��\\��p�D�9w�#�n�Q�̎�*e�<���bdK�]�$��6p{M�Mkn\0�n�\0\0fIDAT��+��Fݘd�\'��������92!O<-\0�w�I�^��Xk�������$no.Z���iZ[��^oƃ���7f�e�I������]@f9��7`�o�\\nÂA��:���p���]�a����T��v㚮�A�
�6��[�y�#}��}���3��1�A�1�<<�-gj���:-������X7�~�s#�dc=oyMˉ�_�ֳ���ԕ�3���ӣ+���|���)c��X�t��n4��/�
>��m�,k[P)�f\'a�{E��$�\"�!^\\\\ o����D��s����@?q���njC�_)U�����ֵ�8!��\"��9�0�	`1��,��mѬ��GGG`���W\"rd�M[���<}�r2/�{��m�AH��Vi��{�$����&\0>0�Nр����y���*��\"�����{��I��
��J3���Q@�6�̸��rP��z:�Q+b�W�f!�]�J����8x\0$������ی����g�@��	���|�!�\\�T[dw9??��m�
�}A���iK_��c{��/A����[�,�)@V�[3���,� d�Zj��E�P�QY�P�.��������,�PY�~��9�e���������nԣx�X,V�8��]Y���	H��v��W*�/�ںK��[���J+�����G�z��ĤMs�n�
�O����u˲�ֳ��90rt�f~{[�w�|�f��/FhL�5NS\0\0\0\0IEND�B`�","Male","MNG","09865433567");





DROP TABLE IF EXISTS hmessager;



CREATE TABLE `hmessager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageB` varchar(50) NOT NULL,
  `messageH` varchar(350) NOT NULL,
  `status` varchar(7) NOT NULL,
  `employeeID` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hmessager_ibfk_1` (`employeeID`),
  CONSTRAINT `hmessager_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






DROP TABLE IF EXISTS hmessages;



CREATE TABLE `hmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageB` varchar(50) NOT NULL,
  `messageH` varchar(350) NOT NULL,
  `status` varchar(7) NOT NULL,
  `regno` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hmessages_ibfk_1` (`regno`),
  CONSTRAINT `hmessages_ibfk_1` FOREIGN KEY (`regno`) REFERENCES `student` (`regno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






DROP TABLE IF EXISTS hmessaget;



CREATE TABLE `hmessaget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageB` varchar(50) NOT NULL,
  `messageH` varchar(350) NOT NULL,
  `status` varchar(7) NOT NULL,
  `employeeID` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hmessaget_ibfk_1` (`employeeID`),
  CONSTRAINT `hmessaget_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






DROP TABLE IF EXISTS login;



CREATE TABLE `login` (
  `email` varchar(55) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO login VALUES("amanidayo55@gmail.com","Dayo");
INSERT INTO login VALUES("joh@GMAIL.COM","URASA");
INSERT INTO login VALUES("kweka10@gmail.com","Issa");
INSERT INTO login VALUES("kweka11@gmail.com","Mwanalus");
INSERT INTO login VALUES("kweka12@gmail.com","Nkya");
INSERT INTO login VALUES("kweka13@gmail.com","Urrasa");
INSERT INTO login VALUES("kweka14@gmail.com","Nnko");
INSERT INTO login VALUES("kweka15@gmail.com","Massawe");
INSERT INTO login VALUES("kweka16@gmail.com","Lusajo");
INSERT INTO login VALUES("kweka17@gmail.com","Mwalongo");
INSERT INTO login VALUES("kweka18@gmail.com","Athumani");
INSERT INTO login VALUES("kweka19@gmail.com","Simbo");
INSERT INTO login VALUES("kweka1@gmail.com","Dayo");
INSERT INTO login VALUES("kweka20@gmail.com","Pallangyo");
INSERT INTO login VALUES("kweka21@gmail.com","Jose");
INSERT INTO login VALUES("kweka22@gmail.com","Mkone");
INSERT INTO login VALUES("kweka23@gmail.com","shoo");
INSERT INTO login VALUES("kweka24@gmail.com","Shayo");
INSERT INTO login VALUES("kweka25@gmail.com","Materu");
INSERT INTO login VALUES("kweka26@gmail.com","Mahela");
INSERT INTO login VALUES("kweka27@gmail.com","Mgaya");
INSERT INTO login VALUES("kweka28@gmail.com","Athumani");
INSERT INTO login VALUES("kweka29@gmail.com","John");
INSERT INTO login VALUES("kweka2@gmail.com","Abdallah");
INSERT INTO login VALUES("kweka30@gmail.com","Gonza");
INSERT INTO login VALUES("kweka31@gmail.com","Mtaka");
INSERT INTO login VALUES("kweka32@gmail.com","Boko");
INSERT INTO login VALUES("kweka3@gmail.com","Swai");
INSERT INTO login VALUES("kweka43@gmail.com","Mmasi");
INSERT INTO login VALUES("kweka4@gmail.com","Nnko");
INSERT INTO login VALUES("kweka5@gmail.com","Dayo");
INSERT INTO login VALUES("kweka6@gmail.com","Mtui");
INSERT INTO login VALUES("kweka7@gmail.com","Dayo");
INSERT INTO login VALUES("kweka8@gmail.com","Ndosi");
INSERT INTO login VALUES("kweka9@gmail.com","Mushi");
INSERT INTO login VALUES("mboya3@gmail.com","TUNZO");
INSERT INTO login VALUES("mboya4@gmail.com","SAMBO");
INSERT INTO login VALUES("mboya5@gmail.com","MULENGELA");
INSERT INTO login VALUES("mboya6@gmail.com","WILLIUM");
INSERT INTO login VALUES("mboya7@gmail.com","MARO");
INSERT INTO login VALUES("mboya8@gmail.com","MSHANA");
INSERT INTO login VALUES("mboya9@gmail.com","JOSEPHAT");
INSERT INTO login VALUES("mboya@gmail.com","12345");





DROP TABLE IF EXISTS loginst;



CREATE TABLE `loginst` (
  `OID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(55) CHARACTER SET latin1 NOT NULL,
  `ostate` varchar(10) CHARACTER SET latin1 NOT NULL DEFAULT 'offline',
  PRIMARY KEY (`OID`),
  KEY `email` (`email`),
  CONSTRAINT `loginST_ibfk_1` FOREIGN KEY (`email`) REFERENCES `login` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO loginst VALUES("5","mboya@gmail.com","offline");





DROP TABLE IF EXISTS loginstate;



CREATE TABLE `loginstate` (
  `loginID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(55) CHARACTER SET latin1 NOT NULL,
  `loginstatus` varchar(20) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`loginID`),
  KEY `loginState_ibfk_1` (`email`),
  CONSTRAINT `loginState_ibfk_1` FOREIGN KEY (`email`) REFERENCES `login` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO loginstate VALUES("5","mboya@gmail.com","disabled");





DROP TABLE IF EXISTS pmessageh;



CREATE TABLE `pmessageh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageH` varchar(50) NOT NULL,
  `messageB` varchar(350) NOT NULL,
  `employID` varchar(20) NOT NULL,
  `status` varchar(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employID` (`employID`),
  CONSTRAINT `pmessageh_ibfk_1` FOREIGN KEY (`employID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






DROP TABLE IF EXISTS pmessager;



CREATE TABLE `pmessager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageH` varchar(50) NOT NULL,
  `messageB` varchar(350) NOT NULL,
  `employID` varchar(20) NOT NULL,
  `status` varchar(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employID` (`employID`),
  CONSTRAINT `pmessager_ibfk_1` FOREIGN KEY (`employID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






DROP TABLE IF EXISTS pmessaget;



CREATE TABLE `pmessaget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageH` varchar(50) NOT NULL,
  `messageB` varchar(350) NOT NULL,
  `employeeID` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employID` (`employeeID`),
  CONSTRAINT `pmessaget_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






DROP TABLE IF EXISTS program;



CREATE TABLE `program` (
  `programID` varchar(20) NOT NULL,
  `pName` varchar(250) NOT NULL,
  `durationINYear` int(11) NOT NULL,
  `depertmentID` varchar(20) DEFAULT NULL,
  `level` varchar(11) NOT NULL,
  PRIMARY KEY (`programID`),
  KEY `c` (`depertmentID`),
  CONSTRAINT `c` FOREIGN KEY (`depertmentID`) REFERENCES `department` (`depertmentID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO program VALUES("BT-ELE","Basic Technician Certificate in Electronics","1","ELE","4");
INSERT INTO program VALUES("BT-ICT","Basic Technician Certificate in ICT","1","ICT","4");
INSERT INTO program VALUES("BT-MFT","Basic Technician Certificate in Multimedia and Film Technology","1","ICT","4");
INSERT INTO program VALUES("OD-ELE","Ordinary Diploma in Electronics","1","ELE","6");
INSERT INTO program VALUES("OD-ICT","Ordinary Diploma in ICT","1","ICT","6");
INSERT INTO program VALUES("OD-MFT","Ordinary Diploma in Multimedia and Film Technology","1","ICT","6");
INSERT INTO program VALUES("TC-ELE","Technician Certificate in Electronics","1","ELE","5");
INSERT INTO program VALUES("TC-ICT"," Technician Certificate in ICT","1","ICT","5");
INSERT INTO program VALUES("TC-MFT"," Technician Certificate in Multimedia and Film Technology","1","ICT","5");





DROP TABLE IF EXISTS regstate;



CREATE TABLE `regstate` (
  `regID` int(11) NOT NULL AUTO_INCREMENT,
  `regno` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `seID` varchar(20) DEFAULT NULL,
  `regstatus` varchar(20) NOT NULL,
  PRIMARY KEY (`regID`),
  KEY `regno` (`regno`,`seID`),
  KEY `seID` (`seID`),
  CONSTRAINT `regState_ibfk_1` FOREIGN KEY (`regno`) REFERENCES `student` (`regno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `regState_ibfk_2` FOREIGN KEY (`seID`) REFERENCES `semisterstate` (`seID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;






DROP TABLE IF EXISTS result;



CREATE TABLE `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseID` varchar(20) DEFAULT NULL,
  `regno` varchar(30) NOT NULL,
  `score` varchar(5) NOT NULL,
  `grade` varchar(2) NOT NULL,
  `coID` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courseID` (`courseID`,`regno`),
  KEY `regno` (`regno`),
  CONSTRAINT `result_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `result_ibfk_2` FOREIGN KEY (`regno`) REFERENCES `student` (`regno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

INSERT INTO result VALUES("2","ITT05101","KICTC-CER-006-2020","80","A","ITT051012020");
INSERT INTO result VALUES("3","ITT05101","KICTC-CER-007-2020","18","F","ITT051012020");
INSERT INTO result VALUES("4","ITT05101","KICTC-CER-016-2020","22","F","ITT051012020");
INSERT INTO result VALUES("8","ITT05102","KICTC-CER-006-2020","66","B+","ITT051022020");
INSERT INTO result VALUES("9","ITT05102","KICTC-CER-007-2020","19","F","ITT051022020");
INSERT INTO result VALUES("10","ITT05102","KICTC-CER-016-2020","21","F","ITT051022020");
INSERT INTO result VALUES("11","ITT06102","KICTC-DIP-003-2020","23","F","ITT061022020");





DROP TABLE IF EXISTS resultstate;



CREATE TABLE `resultstate` (
  `reID` varchar(20) NOT NULL,
  `restateID` varchar(20) NOT NULL,
  `reaccess` varchar(20) NOT NULL,
  `restatus` varchar(20) NOT NULL,
  PRIMARY KEY (`reID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;






DROP TABLE IF EXISTS rmessageh;



CREATE TABLE `rmessageh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageB` varchar(50) NOT NULL,
  `messageH` varchar(350) NOT NULL,
  `status` varchar(7) NOT NULL,
  `employeeID` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rmessageh_ibfk_1` (`employeeID`),
  CONSTRAINT `rmessageh_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






DROP TABLE IF EXISTS rmessages;



CREATE TABLE `rmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageB` varchar(50) NOT NULL,
  `messageH` varchar(350) NOT NULL,
  `status` varchar(7) NOT NULL,
  `regno` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rmessages_ibfk_1` (`regno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






DROP TABLE IF EXISTS rmessaget;



CREATE TABLE `rmessaget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageB` varchar(50) NOT NULL,
  `messageH` varchar(350) NOT NULL,
  `status` varchar(7) NOT NULL,
  `employeeID` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employID` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






DROP TABLE IF EXISTS semester;



CREATE TABLE `semester` (
  `sID` int(11) NOT NULL AUTO_INCREMENT,
  `seName` varchar(20) NOT NULL,
  `courseID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sID`),
  KEY `semester_ibfk_1` (`courseID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO semester VALUES("1","1","ITT 04101");





DROP TABLE IF EXISTS semisterstate;



CREATE TABLE `semisterstate` (
  `seID` varchar(20) NOT NULL,
  `sestateID` varchar(20) NOT NULL,
  PRIMARY KEY (`seID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;






DROP TABLE IF EXISTS status;



CREATE TABLE `status` (
  `statusID` int(11) NOT NULL AUTO_INCREMENT,
  `statusName` varchar(20) NOT NULL,
  `email` varchar(55) NOT NULL,
  `lstate` varchar(20) NOT NULL DEFAULT 'enabled',
  PRIMARY KEY (`statusID`),
  KEY `email` (`email`),
  CONSTRAINT `status_ibfk_1` FOREIGN KEY (`email`) REFERENCES `login` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=latin1;

INSERT INTO status VALUES("5","admin","mboya@gmail.com","disabled");
INSERT INTO status VALUES("24","hod","mboya3@gmail.com","enabled");
INSERT INTO status VALUES("25","hod","mboya4@gmail.com","enabled");
INSERT INTO status VALUES("26","teacher","mboya5@gmail.com","enabled");
INSERT INTO status VALUES("27","teacher","mboya6@gmail.com","enabled");
INSERT INTO status VALUES("28","teacher","mboya7@gmail.com","enabled");
INSERT INTO status VALUES("355","student","kweka1@gmail.com","enabled");
INSERT INTO status VALUES("356","student","kweka2@gmail.com","enabled");
INSERT INTO status VALUES("357","student","kweka3@gmail.com","enabled");
INSERT INTO status VALUES("358","student","kweka4@gmail.com","enabled");
INSERT INTO status VALUES("359","student","kweka5@gmail.com","enabled");
INSERT INTO status VALUES("360","student","kweka6@gmail.com","enabled");
INSERT INTO status VALUES("361","student","kweka7@gmail.com","enabled");
INSERT INTO status VALUES("362","student","kweka8@gmail.com","enabled");
INSERT INTO status VALUES("363","student","kweka9@gmail.com","enabled");
INSERT INTO status VALUES("364","student","kweka10@gmail.com","enabled");
INSERT INTO status VALUES("365","student","kweka11@gmail.com","enabled");
INSERT INTO status VALUES("366","student","kweka12@gmail.com","enabled");
INSERT INTO status VALUES("367","student","kweka13@gmail.com","enabled");
INSERT INTO status VALUES("368","student","kweka14@gmail.com","enabled");
INSERT INTO status VALUES("369","student","kweka15@gmail.com","enabled");
INSERT INTO status VALUES("370","student","kweka16@gmail.com","enabled");
INSERT INTO status VALUES("371","student","kweka17@gmail.com","enabled");
INSERT INTO status VALUES("372","student","kweka18@gmail.com","enabled");
INSERT INTO status VALUES("373","student","kweka19@gmail.com","enabled");
INSERT INTO status VALUES("374","student","kweka20@gmail.com","enabled");
INSERT INTO status VALUES("375","student","kweka22@gmail.com","enabled");
INSERT INTO status VALUES("376","student","kweka23@gmail.com","enabled");
INSERT INTO status VALUES("377","student","kweka24@gmail.com","enabled");
INSERT INTO status VALUES("378","student","kweka25@gmail.com","enabled");
INSERT INTO status VALUES("379","student","kweka26@gmail.com","enabled");
INSERT INTO status VALUES("380","student","kweka27@gmail.com","enabled");
INSERT INTO status VALUES("381","student","kweka28@gmail.com","enabled");
INSERT INTO status VALUES("382","student","kweka29@gmail.com","enabled");
INSERT INTO status VALUES("383","student","kweka30@gmail.com","enabled");
INSERT INTO status VALUES("384","student","kweka31@gmail.com","enabled");
INSERT INTO status VALUES("385","student","kweka32@gmail.com","enabled");
INSERT INTO status VALUES("386","student","kweka21@gmail.com","enabled");
INSERT INTO status VALUES("388","teacher","mboya8@gmail.com","enabled");
INSERT INTO status VALUES("389","teacher","mboya9@gmail.com","enabled");
INSERT INTO status VALUES("390","principal","joh@GMAIL.COM","enabled");
INSERT INTO status VALUES("398","student","amanidayo55@gmail.com","enabled");
INSERT INTO status VALUES("400","student","kweka43@gmail.com","enabled");





DROP TABLE IF EXISTS student;



CREATE TABLE `student` (
  `regno` varchar(30) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) NOT NULL,
  `depertmentID` varchar(20) DEFAULT NULL,
  `programID` varchar(20) DEFAULT NULL,
  `year` year(4) NOT NULL,
  `level` varchar(11) NOT NULL,
  `email` varchar(55) DEFAULT NULL,
  `file` longblob DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `state` varchar(20) NOT NULL,
  `regDate` varchar(25) NOT NULL,
  `phoneno` int(11) NOT NULL,
  PRIMARY KEY (`regno`),
  KEY `depertmentID` (`depertmentID`,`programID`,`email`),
  KEY `ph1` (`programID`),
  KEY `ph2` (`email`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`email`) REFERENCES `login` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`programID`) REFERENCES `program` (`programID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO student VALUES("KICTC-CER-001-2020","Amani","Ivan","Dayo","ITT","BT-ICT","2018","4","kweka1@gmail.com","�PNG

\0\0\0
v>�_����N?����ׇ�|��ۅ��O
��3��@z�\\�z��1U>Ry���J����8�_F�����o�_^�#)�~^w��{0���?���]н�r�~�����z�9������=���\\	i����T�o|�yz_��m�+��������Eʷ_������ߐ�3�p��
�!�xb�1��{��G\\�ZHYÍ�\\����\"��W��X»�x�[�s��d\\,��~�\'����Uɇ��O�WT2eN?�		�������?�(��������%����R������^m]�q��`B\"�R���bl!�N~&�1�h� �7��9�--��{��gc����,QRM���L�*l�O˝�%�\\J���^F�5�\\K��U��l��VZm��6���^z��w�G�#�8�QG}�1\'7�\\y����hɲ�֬۰�(��WYu���k��\'v�m�=�<�PJ\'�r�i��q��n���[o���;��\'����Z��Z|���O��jkߗ�������o�\0�3�C��)uʙ��(�Q%ge��b��\'we���_y�ߙsJ�\"sN�����=o���-�[>��!�����wJ����t\0��D��*_�L���K!��L����t䳈d�!�5&�9=�|3���Of��c�Z�0m����%�~����҂k�b��@�-�]��Ub�\"n���m��ϛ�i|�Փ	N��s���$�h�s�\0:(D�rm��̈q�1���c?��:K��$�!�QJ�h�5�D������LkB߅)vr�s�
^
�#3%�����e��|j����B���ݫu�mz�>l����u��L�oy���Y��VIg&Ou�����<k�^Rcu��\'A\'�㤲l���8k��
�
��_���4H_(S8$�7`�h���}(x+�$��]ӟ}��rV�M��a��:��h\00�ʠy�k�@�b�)o^?c��&���z��\0p\\�Q���HS͇ƶ-y���P[�v���m��
a���6}T]��������Z�{u�?�I5uwj`���Ia�dH#�)]�P����
�����V��|cQg�P+�\0�C�&ă���dI!�j�	v:��3)ȕ a
}�w����!:�̓0���:!L)U���5�,� ���AD�����&�h����7��:h�H�k��(u7���2����z5���/��	g�\0�=�HPj51��Gk�EiTɔ��\0E�����Д��Ȕ�\"�(v()7M�b�o�]ౌ�@K�0`|�)�w������O�*Q��b*��I����9�C�W�?�~+� c��Ȟn���M��F�7 ����F�5[9��	w������*Y�D p�.1�*FV�uH��0,��h�bt�7��p����4���~��ڷG�#�����G.�ԃ5�zi��}��,T]�6�Sg��	2�
Oׅ��I��!\'��E`��+� )=�5�\\��
���<
�v7��/��%���Aml�/��Q���~���Y~�w7~�ɋ��lO��@o�Ү��z՚��5���<_2@��1��gЀwD�!$�`���B�E�
	%�Q�qiz�h���1q�����q�j�ݗ�!�X�� �^Z���u�t�^��s��C՝%G\0_!�����Fǲba1�E��Ea���VlG�w�iƌG��;3��dovx���C�~�(*\0��{�p�d���#�N��˚+���=���{�J��
!�Hsc�_�c�\\��A��%é�&Y�(�)d��gu,��	��䓮K)�I�@4�F7��b3���RP��C��4`���yK(l���Jxf�T\0SUK�CFe��7X1�k�6��v	���QN�\"�K{a���K�5\'b䠧|�5x��\'���!�}fLKu|�a�|J7�g�������s�!����8�d��[/F�uT ��)M-�V�.5\0�����9�s��@�[��U�PY�W��]���8B�����͐Q}zfu(h	u��S�T��A>�2�
Z��g!.��U��J�p�EO)�ᖀ��\'iFH�T�9п`9~7����j+�>�\\d�*���g�� F�猌K�-�3F�d�b�b
�i�T��+6�CL�t�%�c�#B9Q�K�ق��FAWD�Tzȴ��y��|�*�7\"���j�.�i`u�ښ�\0��{�L���D�5D�4LH�
Z3���Ң�~	3}� �\'>��� ϴ2��5�u����4ƹA�T	9�.�E�Y6#�j	N��1Оh�-��,�B.\"
om�k��]Lch\0oT������ �Ϡo+p;	U�3p1�J�R��L!�1��B�G� �Lc��5�@4�8p� MU*:��8�IU�Vm(z�h��z�?w�8aZ�5E�4����>��C��������A#��F��
��zM$�n�[�j_�/io��@*:>�N5�A��[>�H�S�>��1Q�T�9�8����9�=e�7C��(��B���8�X^��y��eF/�)���Ǡ#x%r��=K�S���V�p��S#�(K�4�g�ؠ��W�ߢ�T\0@c��L�4t�8U�e��2r��[�8ߪ?:
g���Bs�s@E�3�`[pL�Oג%��h�K�\0\'o�1�p$�!&iR*��`\"���7�KV{k��0֙.赅Lk\"�M��9���^�Zظ��g�v}ߜ!d�RD��ŅN��y�4�g�D4#*=l�O�kken� @�����	��fec�b��Hc�Ŏ�<��~Jih]��!�I�ʮ�m� 쑭�N>���H��2&�C�2�˄ܹQ��|4)-d���+zJ%�m�@�Jp{�m�7�.�	��Bq�O�0Q|��b]�BάQD5�y�фH�v�&�v�Lm,�2
H�a�r��
���h~��d�T���N�9<~n�J*�r�6�ˬ:��I��[-F]a�1�(뵳G�k{��ָ���o���L�U�\"Wk�%�(>�:�W�v���ILҼ+�i�g��.�(��},��I�%�7�cc�;�
�\\��<�P�*d�/�_��⏛���U[3Ź�7�)��!`�]�p�tC|\"��1�2K�*�ڕQ�qt�C��Z��j⪊��ʏV�!\0�<�I��Щ@]:�h��.��L���It��͐Ѷ����W�IQ�!6��
x���sb)tm(~���߱�VX��S�C�:���Fg00��B@��UZ�7`�2�6:d�ch}ŹE��j�t\0�Z���\"������#��}(�*(A(ó��p���U��KX�YhVF6ߦ�����Fp�;k��jEr��]��^@�O��w!��U]��SmP
Ok(:&,c�s6DBiR�U�X�Vt�.�@�L�ΐ�Z�,��C�Tm^R��r�!L�h���&��S�m���B-z����uQ���-F׮�W�xD�,�li5�d��;�6���je��XuXkQ��/
Ҽ��v8��^T��XC��Q�-���H3$�L�MC�ҷہ���cA=�[g7��L��K��:� �pj	�bF�i�#4\0�K�%Ke��@:W�V\0�ж�*ڮ�:ċ�����J~MG�t�\"�H�	S\'`Ȉ6?5,J�ޏT�J�6��J�4��c9��dv�|�F��m���[��Y�����R�,<����J
/��F��LY[4Q7�N�igr�G:�G�QLS���ȗi�KmK\0�����e���ѽ�0l�z�/���/G�Og�øH0
`ŦC]MƖ�T�
HMU��mD4|9ᢵY�jD�ƗZ6�r����C\'Hf�8jPɇ\\aP�}����*\\-�c�}�5}��+�Ƥj	s�_E7�B���΃��ԥ��D\"��:�������6	$�I�#�6��Ԩ��@�\\�[Һ�0�e��Wqk��@�\0!�z�ߐO�����8Ty����t��S�[�H�J����tUS6<r�l�:u�[�3`���p��Px��=��T�IK�� ,�dC�@��*�[�Z�@����y��+f�(%-&�����j>��L$ixOz�t�k��3A��#�L�V���nTo���\':��%�`!�E��ZP�б�*۫G����^dEaAf�נt�n�Ua��L�#e[���T������VId�ǊJC�g�,�ϴ�b�:�c��zXB�k�{#�t�@[�R�gc�\0��Tϡ�Dt\\��?K$����� ),)�%����\0
>3��um
Ϧ�7O}��s�Pf�D�v�y�O+��\'i��aT�)3��G���iiH-�W�qcZ�/��>m�k�l��=t#�ע\"U����s�I�YL��ڣ���娪M\\J{�]��L���:��Y�~l!�k������0�D�]�#ZO�F*�G\0�H� 	��շ��y7��v-p�-�+{��C�d(\0\'��,��ue@
v�␡:Yq�*�B�Zu0����G�����b���YWWA�\0qrtRt���Z�xp܏w�w�\0�Qe��5h�mfRI1�_C�#�B藙e�JR�����%x���?G�Z��g�a����S���y�8�ʲJ|N<j����x�ƹ��3�f63G%K�t0+��$q\\�t�r���8k�kݓ�0RЗ��Ns),`D(���*l$h�I������?��%r)䪀�c� �~�?�ݭU���\"I���q>���.Ь;����4O��3p���
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:661d1df2-5da2-4c7f-a1ae-1e7e2974504a\"
   xmpMM:InstanceID=\"xmp.iid:a13546f1-744c-474c-950e-f825e5df2f2b\"
   xmpMM:OriginalDocumentID=\"xmp.did:bd10e5a1-abe6-44e1-a38f-ffd24f429499\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1603714770176172\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:d50e3d98-a889-4d21-817e-2c3b677b3ad9\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?>	3��\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�
����\0\0 \0IDATx��k�d�q,��yΩGw������QW4��]���2ɮLI� ��3ӯ�:�̈Ї<U=���Yr�f1e��1̫��Od���\'�����O�E�&\"���Ht]\0�n��0 @��E���h�p0���l =a��,�h,�����7�
�w}��w��.`��?}����$|x��^bK\"<��@\0\"\0:dJe$�$�$N0@xГ�\"\"zБ�C@Cr 9\"�\0�������x%�R���?\"�@�58H/�*Q5��
� ��C\"��Њ�b0l}p�Cz0�
��=������QN\" d\0yt.�����\0�3g��#W����$�$��F����\0��O@�PRA����\\��iHg����p�Aoͮ�V�,dpƢ8u(,��>���`��2��B�|��N�lI<1LZ%g��{,z���@�X�	��%�7���5�ҁ2�.p�1*�FX��x���XUh����L���-h��(���Ct��0$>\0�F\0%A<{MXr��s�Ylf���_���//U<IMRU\\5D(T��z�}��1/�g��Nru��(�C���}x�?`�?���\"aɗ���O�;;�v�lJ�>}v�;�T�)�NK�H)�v*uC��x��?s����ys����ɛ���v������Y�D��$|�Y}�v��0��M�ۖ�M}��!�ԇ�-
W����g��&�fT��c>���!��سk��ӧ/��
ֵ7�廌�G����p♴�����?FC����z�������J�z	�P���$�dP���1#u��%��N�N�O]��������%�1�!ٱ�C�iH���4��h�PѤ��B�ČX �!+�\"A�&��8��E|�D:سŗ����>{�/F�q�\"�Q�
i����aM%������J�
 D�����a/0;;D
$Ԏ��E�m��0�L��0���/���3<���Q\"��0�fBIq%)����2�mT
��tSOI\"�n��P��/��PAQ��:/�8���i�t�as�Hw,�&z�w�C�Y�B�D��?/�Jw
��K�]
H1z�h�����T�����=N;-��R<:c,sT\"�P�)�ds@�\0TQ��E�_MЫ��ag�0�@��q�k�:���K!Q�.7>]�o�l�����c� ޺��[p�0�}��Q-䄚�\0(�.t������|�����c�R�N���ZH%��$D
*(to�CP�BYg�h0�@�嵄��瞒t� ��
�޹��u�&�;Xhe,DE��(�����g631L`b��ҙuv��<���p5����oI�S�\"���CE�H�!�&F�=�AC�Q/����� ᄐBD0��O\0�aS�RC
�F��
�I����탡2��&3�@x�\0?��F�w�}�u�l��N�i��_^��nSo{Y�j΢�+c䆨	�
�H����;�%\"���BQ!_�A\"t	@�X��&x�v���	ŉ�����!CT�%����T�ή��E<(R�F6�����Џ��(a;D/�+O�,���׹|1�mV�����R�8VhU�$�Lv!�t!��sG�7u~�?%\0x��FB�3HR(�
�r�m�t
���\0�-T�$R�i�^-��亮�������ߍ��>�{�3���7��1�����a�bjH�H���%|�Ύ��*�H�ҍ���/��a���.��H$w��u�\"��\0�
^+�g#�I��5�u�!n���Hx;��v����X�P;uf�p�F����OW�/��vZ\\���k<�B?~�/���S�J�[Z>���|$�>`���}������, �H�5���\"$e(\\�
_�Sg������_��ʏ��/����M��ۡ�I���ڮGD!
��:��
�RME�ڈ����X7BV��c-Ck�[+i��+@c��6)	QI�*�*��z�D�4`�*�u��q��RT\"D|�u��Z�+��tA��[�o�F|��z/:��X?�$��3�tG�$x�eX�N�2���W2}��~P�u�KJQ��ZDD��{D4.\\HP�$ܛg���tη2��8m~-�\"*)iRiSDD�d�z��`8(!����:	�Ea�]f�Nx8���閻��9*�?�LZ�R�iP�ɫ�)���ӗ���8���zS�:�n��Sv���}��6�I���8�k�	�Z�s}]���_�PQ�h+�\"\"�g��%8EDu\0$1��ѭ�ہ!\0Ū0�T	�q��c�bp��.�Cg����{���(�Dx�:̉`dէl�������_c9�=l0�۬��4w�� ��Uw��Fk2Z-l��Jyl�o���)kI|��^E�6Я�&Qrç���j1����᭦J,E�X5N�\"�$��<,���V�8ʵ����@g|���!�DT�CJ��$�R�i���W���0��3�Am�ҋ+��4�FX��K��o��a��h�=�!�?k��
�U,�)���M���j��9����)wk@\"\\��F:\0���b�{��J	��
u�(�7�$�n�o�L�
�\'��n!=��gn�h���g�\0�n�6��$D] ~)�^��Y�iNM�}j�y�\\EH��}����
ӹ
�]/���U�W���lK��9���x��S�!E�����K����D��B֠�}��Iy�a���^�ԩ���O�b��.��}ګ�.dVÑ���ݧ�5.d����/������XUD���f���A�63�v�K�v�ф�˭Po;��^�8��/Uߡ`Bd�Ģ^�\'R���D�}��tַ��nV+�l�>\"U���l>%��\\�u��l��ͯX}x������nnVU�{SP׊-�ğX�.���f�3/{Ο��w7��n��0߾� ��U���J:�\'
Qm�?�/\0}b�Z�$x
Op�W�l��U���@z~�w�)$5��$򄏋�>�n�ːܔ�K}�7[�K}�\\j+�[��E2�s�=mkY%��4���lZ9|\0�	�ӷy����*d[N����a#�P��D�u����Fx�PS������a�� m�x�Z�uU�mӮ�9]�?�6���e�kK8�1��8�����*�
�ϫu)gj��W3E\"֟_��7�$�0����	8�?�mҔs�����k������R3-�f�ST����ܔ~Zm�1�y
O/��ǥ�{�:�3���#b�YA�Z-�P�Fη��4�2U�ISN)��e�DM]֔I���[��I]K/��Ҹy:DH�\'mU���;�����5x&Y�\\��0e�R3,���Hߓ�R:S�3�7�� ����<��Y�\0^1ʷ���I�
���f椔4�ڔr�([cif���=�W�Uϣ�z���X{�����m�����~!$�«!�%II,	�^É�\'\0�?z��2�5>��Z��.&��;EγD#G�HN��u�XȖ�#d���<sJ9�^W�J4�@W�����ט�Z�X~��t�*r6ϵt���s+�V��7^r!Ƅm��,�QD���W�6���Y�Ge�����:�Ǚ���F��mk�J�W*E+�]�}�rN)i�-YPլ�9�sJ)��z^h�lխV�5�mh{�����\"UB�8�<��S��$��ձ5��a��07+�J�Bc�Ń�^�4����di6O�0\\Z1
9�R0[��:��O}=�u
x�v�Ma$.�<Y�5�Q�	`�A/@H��rί�k�9��\'֩˅X��{�L�����nt��6~�{�?}���� ���H��͊��h�3��Y���ƞ��U�_Wـ7�.K��J���N�8�paR����.�NSȆ�r�R\'\"*0���>��%eg2��z�	�e��Y�o7�]�]T�e)e���Ѯ�]׉dB ��o�kw�di�����%��5��H��\0�(��0&��5s��4��C�?C�Jtv��gn�Ŕ����|�\'SG�#K\"3##z�L��Q�o<>s�jK�E�օ.7͆#,ܰ^�D�4�I5wZ@�$5�N@C�D�
U�@�MZ	��Rl>��8�MA`��R��m���x�|PFVT⼺*B(�J�`�9��)��*�mV]ew�{T%&(B.L���F_�n9����Z(ʟH�w3�?!&�6yݦ�^<-��f[J��|ق�W��:����M�LQ��@T8��$L�����>��s���I���ZY�R��t<�e������
��oo�;E$�E���jm��m���.�t�k5��YR�8J)K��,�í	V�n��˕�f�We\"�2�����e2�X�ܗ<�$+�4��|��������*`:��Q�ݭ j�2Ggu�sr�Rs-\"��bJtI#��Y��L���XҨ*Ar�Rܭ��,\0/����w��H�Ї�_D�B�!��Ȓf�W3Ӕ B�-�F�%.��U�õѺ�S��(M?%���	ԙ��>9a�
%��De�����L�jMNZ�o)@�Yu+�\\-�\0R+Qf����@�m ��ѧBJ�$�ŧTZ��)D<��I��H]�$��i­�͂A�{��d4��X]� 01[5�]��6O����2�y������=��8��AE��C��u
U���>E�m2����%���:O�G1w].�\0��y�_#q���s��}6�\0\0 \0IDATƝ���DO�|*�������Ӳ䔖eǓR�JN�]�y#ډ�y��j]\"�ŘzX�v}�7�������B��R:@�Q�RJ1��ս�]\"���Z�H�k@�C��1�JFx����I���i�)y�83��2��V+��e�ihB �l�S��6�J��\\�e&�)�dQ�KI杪���0��4-ڼLӘ�j�
�&�9��%�E���n��^=��Zj!��3X58M�4ZK5!�R����0���D=�S�����2#�Ls-��:�Zj�k��2��*�R�����������HB&E$%0��k�1Lv�_<�0�#�Q�$Ff�,�B��X��c[�=��r���j�@��t���6���}��6���#p=O��q��i��c53�j���,HM�L�uY�2�ԕd,�K��$��bu�KY
\0�\'U5���h��ª����kuN�!]5���w�C�Ws�P+F�-��h],����	VFbU�̣:�&����憟�\'�BS<�ntC�т��DzM��
6	����ov�&�[9}����F5�n�1�r����M��a^�b�w�mY�J�>u}g����M��D��n��މ�w�~�}����f�ysww{w���楤,9�K�r8�L��0�v]�I9�C��G��q�lY�ڶT�ͧbM�B�L��s�Y�wy��uW��ϟ�\\\'eXY��|<�˴,��Zk�t��>�z*�*�e������%���\'��]�۷v2/�D�������Fg�D�P����C}םݤ����ay��ݎi�r3�a�H}�jҐZK��5�e�H&��60�4�}��qh�n�L%�U���m�<=C���f���¾�۫���8�Fe��i^`�麥�t��<_o6��T�s\\
��4�sY�j
r	��ʠ	Q I?������W=��s%�2���N��K���5䪳9�,\'n�CXl��y=^gϽ��ɉ���������Rr���-
��%���c?{�<��6\\�A+j��l��>OcV��ND�l�F}�
S2��x))u���asu��o7�Me�R�~�:/T�\0���3�������#t��uB��Y���V�L�u�JH\'1D��w�l�W����N�C�&��ΘN�x2�Z9M��{-��v�ݨ�x:�MR��?�s~|s{8�s�L�S����le
Y��onn\"��2tC�{�a�|�gW�~~�������0/��t�e�fy��k��}?�J���mq+a����8�m��VE�n������vw���l��]_�]��0O�a���a<>.�	@�������~��<�ibA�1
�G��!\\��0�:���\",R�,i��*��������mJy��:��nw<�^��<�c�o~�����_����e>,K8ZؒR>���O>~~����ׯn߼G鳤���o���v��������˼�A�.��H�L�H��a���r`�8���8��S)��e�Ja����F�t<���]���c�ƫ�v��$��\\QKԇI����cYd9^/���՝ϋ��\0����{��A�J��S�)����8��M���{�(�V�ؐl������}�ۖhN飛gW�m�uY�y\\\"uY�M/����8������W�r��������yz<$���/~������z|x�ل/e+���v��������x<N��ϋ+őD4ݼ,�<��4KRxH�I��p����i^L]H�i���+�_?k��2��
S5\'\"�N6;�N�c��:>c�����e����z�{���G��T��Z�7!SH��F=ԩ$�(�2��%$�
����I�Y�4M��Xk%�z����4��j���u�\"?����<��{�p��٦��t�g��z����h���/?���?��_�����RƯ��M��a}����w�����K��������}��2��<ݿ��{����Ns���\"}_s]�it���j��v�d���b�]r�.r�w��:.�t8�1(����Ϟ~����o��r��O�L��υ�\"����>1�$L�5��(��	�=� }������Or_EF�;1���އBJzx)K��{Nz���ic5>��ӫ������_�u�<>|����&���뛾ˢ���>��xp/����W���7�n��Tk�^�u���t\\jى������g��x�\"w�%�%�.%M9Q��%c� ��f���O��}T�y��p��ї㳏?�_���W���������ϟ}2l�H�����,�lzn5�oE��U:v8�t�p�ͷD��$
�M�eo�$�)$���6�=U��Ո�]����mO���Vw�w9e��Zk�2#b?t�݀�q������/?~�b3ܾ��x<��4~���n��6W�]��f=ܾ�e�D���7���f��}x<���Ñ�>\'�;��Re7�n���>��o�[M�k���o��J-N���~�<o��bvrم8��������z����8�������/>�������ۿ��q����Wo�k�nx8�_�n�+~��v��t�
Y�wv\\2��t,e><<><�i�ِx���h��7���,�nR������~O�y���}����G�oơ�W1�y��N��l6�^_��E������׿�����ݫ׏�OsSw2�ޟ��_��|��ߤ�y��/�����������R��s9�s��!���ؿs���^�.՗���ł�-!\\3S�����U��e�fZ�=Bp����ԂE�TO�x���ϧ�o���������o�����?��?�=���ԓ*�s�������GV��x�:���E�.\'u�i/�6���j����D�Rr��ahZW	OIE$w��u��a�ݝN2�~t�́���je<�mOi	T��\\�y�Q�Zk.n����8j)�R�zd�4���5G�?J�I��r�Nh��%�����h9\"j��0�v�B�p�]�
��}�����`�\'�q�I�;;\0�s�����/:�f>\\&\0a\0}TD�(F���\"������j&�,r(��t
����˧�mY�~�v:�)��R��P�m�.���z%�9��A	H�
��r*��p8N%� B��V��\\�xs�h�����k�9\'y�����ܞ�e��m�U�%W�����s���Դ�������k��ˇ�rq�.M���t�nn�p&3��I7�}��08��ǅ\08q��y&N��(Q��0�?H��B��iؿbܗ�p����i\"\"U\"��t�\\.�����0�)�D;]#���j�޳�$7s$�Iҡ�S.�i>χ�4�9\'��\0�Kfp��/jV���J)9��ׯO�ò��OO۲`@��Z�0
@���_�C���\",���8O����cJr<����YU����W��m{xx|x�~�\\r)�\0c�c���̇cfq���#�0O)M�̥J>�RRJ,I�=��Hb	�v��}m}{��y�\'ΉE��CΉk�Bt�OdӶ���Z��N�$�t�n���sJ�5L�LVc
�
C\"w�
ܠ�����Og��#�x�4��c��\0Er�C81�j����/�vfL|KwWՇ���L?��an����}��V��k����?�Z#f��)�����˺�߿�V3s&�SD��C8K��� B�<�!���$!�����k�n�Ҷ�$�r���nK�>���yN�iJ����9TĶDqr%dvP-͸GK?�㻟�n8qx ��q�1X�G42Nf�}�ݏ  S�N>����T9��wp���rI��!橌LTDr.)����t���9�N~�.��JH%��$�9#1� ����\\�8\0���nI��C2�Z����P)�����ko-�����P�-�^k�����`rw�bi!�)E�g�gFf��Sw��������⛠@�9��8��7S�.w��=��r&�����Ä�i�\0��y3x8�<��߿���0��o=BDN�\"r�9�i����x<��q�g\"�\\.�����(�wǣ\'��A5B\" 
�0 �<! �G�ثh/�!	�����$�Ӝ�����ۺ������3��X(2{���b���{D�R�p>pNᤝ\0H�׍���,�����=?�/���mt\'l?��
`t8������nϧ��_A�E��o�z�
�Ӎ��u	m��#�̼�pdBJ��P�9ga��xЕ�>d�T�i>�����pD⵵���Ǉǧ�����\"w��a>��L�nk�
c�pk\"8%���㝳#=={7yo4�|rx#��������͡���8�����ÇG�խ�bH\"f��ګktI�vt����ޭ����4�Ϗxs�V~|�P^C9h_��ʐb�� w5p�7��O)�@�pX�C`tWL])�H1�L�
�PG�T��@����D��N�� �����P]ߢ=�[4�>@��@=�$gd����zoN�Y���8�\0�I�߶N��������H�P��.[�.�������V����iZ�,��I�V���,E ��T��p�2��g�k�˪�F
������#.���w����χ�_��p:ޜ�ۚ���;�wڷ!�]{���$���{\0$�TI*���0F�|����
!��IX����֚D�I��k�`��׶.�ֶ��ُ�oS�j���O��:=>]~��߬������ޕ�U� :|=����TGD��[7�+ޗx�CX���0
����?�7�Ⱦ!\0\"R�1�Hu�<\"|���P�=S�?��}�{FwGA`�!��D�4�8�ZM��>]�/�˲�k��KMii�k�6�Km�d�ik�66\07O	C�]J�����a�<��2K�((,���ֺv.%G�׿�p�f%eD.933��*xqm�k��C�96�k\\f�*Ye��Ɂ�U>��� �x�
@�)Ä)_$!&F44�`�l�4яC����ї�%�SJH�n�-Ѐ\"�c`�o��;�I�w���d�hL\"(cO	�Iؐ���:��Vd�؏O�9PD����Z�HhH��W��^u��u\"R��������(M@h�V����W_~��_�������h��]\0\0 \0IDAT��ڳPɒ��lPUUwRՁd�(D�D �d���\0h��~
��Ev�}m��6d/ܧg��O\0
5�2&�m<}������7�J��P���Ÿ2��j7?��5H��8ȉ�0�y�\0A8�;u��l=M9�y&��:P	(�a�I��vm�@)%���z��ݵW�Wu5�����x������c��P�|�p�6r�����������V%hk�\07��;���պ��8�awX���$���
��xZ:�g.�Ƈ���fuL�����7�(N�>���ܷ������D�Qm^Kj�]0�flFg
&��\'H����ˇl}�i�*5��4isf����Y\'\"���ko[�ݺi����F7�=���S3\0W��B��ʏ�\"=M��+�7�D!�9ɤ�G�x��>���1 e���a\0Ơ�8pu�HD
�@�˃HD�1��E(�)�D�$�4��a�rf�p�PDޕ�
;J��H�I�ǥ�|<�Oǻ�\0\"ܚF��:�m���
Ѕ
�H@\'Oo6y��\0��<�cb�?r�$�� �\0��bש?�^ԫ�)f���M�o���Z��/�n�G�)&a\"�����4�	�\'��2�r���\0@x������F(%�0�Xuf���t�sN�����zm=�	���7���jk�<1#�E3$$�=�n����N�H����q�\0vݧfH:�����ɏ����Ð��#Eú�vO�w�~ ۘ^VI<��!D`�3sD� �.���\0��Ĕs�L�@���~���:$̂rv�Z���c���K��4MeJSBu�=Ԉ�JN\"�v�A)I��	��N��*]/[�^��bm
��q��T\0�9%WwS�!�릶jWc
�J늦B�$An�
�]��<\0�
\00$�41�KSn�q�F/_��pw����_\"�\"�����=�F�H\'5�7`B`\'p�ڄ4�2*f���z$�������_��`�tD�\0A0� �q
�/�#(>fA���2�ġ��ל��\06J�ُ�A�l@�N�@����[�k�k�
�jt��o>���䜍�!;H FG����\"2\0!B��������r@E\'�?C\'㿯��A}q5�{c�F8���{�T��9��	4��\'����;y�
�š��F��C(2e\"�����\0Ȟ�/s73\"
D`\\F\0a�)O\"�D���@!����=�t������]5��C��Ԁ-\0�A�&s�zI룔gNW�@��, d�4���)8eDv�>�b��c�wI!ܷm�e�?6ž���ʷ{?��:���R�E`8yP\0�k1��d�c�#��䛴��ޗ��t��D[�>�z��;h�P��g
��1�|4����-������f\\�!1���!�$7��jN����<����D��w���f��4O�3�궪{wO�BB�]:����w�L��)II�Ơ^X�S8E� 0KfΡ�V{ޮ�{ ��uY����t���?�7�}Xl]�\0�<�ˀD�Z���	�b��y�|�|�<S�1�ԩ<�l4�.Б؀l0=��H�Ǔ]������]�o?2��k�8�r ;����	���i���Y�o�����>�W��B_�-��\":%��1&�~Ap�]\'�yE� � �L#}�5�J\"r��c�Hff��U �$\0��=~4�}��F��y��KFg7���A�0�h�vW������H����\\��k��W� q�~8�y��?_�]�i�A>�y�����������~
I!�$�|��� 	).%�R��s���y�O��|%8R 2�K��Q�*2R �#�K��1C�K�H�s�P}����`���c�Xc�!�E{\'?,���G�//��\0��10|�
�Q(��[p��+v�2�
`��v�4�������X�����C��1\0��03q�Aƈ`�1ZB��P=�����ݻ��!�����ޣG���G���w����)8�V���0�!3E5,�Z=/*���8@j�k5�@�)�(73-H�0��#sDtb\'2\"E2@�������<�(�\0���������ѽ��g߾�ݳ���l�ǰ{�e��]V%���Ctt%W�̞ٔ,�rͼPi�
�qt&\"RD�+y^th��Z)+�*aj��(��qqTd3�a跛�n��{�+��	��m�~�Sqy~���Ǐ?�w�n®h۶��EJ&F6$w�����Ь���&B$D�����\\PD�AK.��C��KĦ�f�q���c��8GN�$��cO�E
X��S���a�Æ�rO� ��}�y瞓�Ҵ�Dd\0�@P1�M#P&qw#%7�Zz�h��FnX\'���N�5L�j)�R��%����c� ���<$�R�e��ӡ���9�]��5F�4nz�zpKl��z��P����^c���D�y�w(\"MtCU�s�i���<Μ�8�z�}wv��v������O�~��;�ǀ��!�8��%FPF����rOcX/\0��zq% �:�`��=X��D�L��s�$Z�j�[\\h��fq������d������o`!T�ln�U�ӊm����i��؞��Lvgaw!ÖsO�!�)dI�I�EVF�\0��Fw\\v�s�\0 )�KVgE*�qG��,u�Z�}M��Pj�	�#2�#1�i�ǡZ�1qQK)�!�V%D�͐�3)�D�W�{wsu��.\0ob#���b�&
1Ĥ%i)�}��ޖB���N4���6�BP �஀��8�a6�%w]7����?����v������y���O>�t�Zm��2���) �ꊁ�����t��WI@e�J�킈�����\0�ܴX�B��)k��1gR�m��4�TZ����	�|�5�6����֊.��`�U�:>�ƤVv���pC�@�s��`��R\\���lПnϏ�o�t0�`����3J�k��\0�n=���vN��o�1JA�Ѩ�����R�
�0B�bA���O=�cD��`�:��b}�IM����\0����\0�OI	[��8dψ�F�����\\UKѦi@����o���@���۔�bn��X.��Ц\0��ͻ��w���Eg%�|y��ɧ�=�g�B%F�]�(cI�Jb/-+��
��zd�Äkwq:��t2\029��+�Y�*�M%m�����@2�2o^+R!�37�3������mUyc�<�ft���ZmԞ4�&�H\0�~�_u�𥀐���j��q��0��%*[�o]�q�*����sy��tNɨ �c�2Ggv`�䘝ȉ�)�25��T[\\�bЃeDd��QS�����\'�;j�P��E�\'��s�* 2	!:��9E-l�����Q�Rg�Z����H�qs3(�
�9;�\'7r\'����g!�Ӡf�(�\0����r���8�zR�\\	zBh¬q�������/�w�-(H��q~|z���G�w�Y���B��.T݉��ĊhQ�ǅ*A��@7u7F�V�^y#��R��
�d��ʌ�+E�S�\\�3EᙄE�%�sq\"��s딼�@�u��ي:8��t\\�8Ӓb��}X��/?���Ŏ͗D��v���wؿ�����!?��@��G�`ѧ\"�F)0�|$\'�:���y��Mu�DoG�#
%�:�9Z���e�. 5�����Ԡ *��E
��Vʚ��п��[پ��
��ȡ�����)
DB��Py^P̭�>�l��e]��5����)�3��
:`6H>�0Ќ�\"H��yUH�u�Od�q�&�W�MB�kБ*��G?\"�ʉ��88�X�z�j7mh��U0�%Ts<D qb7B
�ccM����m6�ݥ�3+E�q�G*#��[���f-�R��QD�{	1�RZ8�4�����P}Mh\0�JhY�yߧa�GGw?~��g��ˏ�~:�/��Ԛ6D��DP-U9�� K�T>����O�D$�[��ka�q}!��q?lW���o�9���f��#:	$�kf)�RiÜ�yl����g\0��g�`�ͭ���%F!��9�J!�1o}���Ʋ��ѻ�|���G�t���8���DM��E$;�<⚥�Aq�š���
����`�Y}�eƱ8N�H��c��w�\\�t��$ث�k�$@\0��i���o���iT 0��eoj�U�̑�Hֽܵ�}H����ҥbŲ՛\0>j/�p��WJ/Es.���j
��NDC��Rr�IKW&BH���,��l���6����_�ꋯ���G�\0���������HUsN�K)*Ř��&����~�{v�_}�h�*�e�M~�v��C�hN栈�h�(�S�ܫ���0�v>��mQZ��a�f��DdGQ
^��\0iD�
����5�؝C��������+��#�(�B�����1\0�H��
V�����k4�h|�þ�Wy��(Ԇ	�q,��Ta��Rqw�� UV�>OT��F��#��Qu��-���@��������D$�%uE���T=u�n�t B�J�)��]K��(f-c-愐���@du���v�Z<|���_|����f��Xo��٬]���,�k)�D�	n�s)Ħ�Ht�3:<�om��L03S����7U����ޥN�\0U��@0��@U0�fX��r�F�sf��P4���,�B���-<3n����9���Eپ��K޾�ݙ�kz.]�; ��0\"D0v��uS@AiF=��tx\'�@f�d�{ȑ��J��:>�Wt0MK�+�n�!����N��՝	m��׾ʀ�l�7>�\\��ɠ�´0\0Y�ȫ������9Klc���M���nWJ��B�G�@�n��wHu����uC,��a$���#�^����������O~��_����\'���\"9�2� �0�m�X̙I�J1t	nh.�7;���w�vz�f���L��ϒ���
M�r�cq\\B�Z2QU��H\"^�Y��i���zF��y/P��/`ܓ�\0!s�Z����`
��3���^,�gY�r�B/!��̲Q��g�J��ה�QZ�&t7��h��
`]no�E<l�� x���䣇�|�W���/�?x���sN1���iV�P��%6,`�,ʆ����
6�;����˕ٴ��Oc)Z�b�$&e!�S��ة�;�Q��@\02f`g6�@�
g�����\0��ZQ�^
/#2��3�u��8��r�H�̙z�Rt�Ϩ��4�!�\0HnN�!��Z�d$&d!�n\'}���OǕ�6j�LB L
#є���?�G�o�g��c����~����U�P6u{R�شѯ�����{�9���;#\0\"��*\0sbQS%7#�Z1 ���ĳeX�C���ޤ����)�G�(�0��礚��3y��Ȳ��VG=y��W������~�4���P���al��!��lcT3,8��9����[��79%����M9�?���*�=_�ŏ��T�%�>~�.\'�T����<x���?e
k5Z0��y�D�;x�eW��t\'\0�����8��U�i�ǥ���5��Zg��(����{z���uW�������Ac�s[b���Qڮ��f�^�ԉ�F�!\"j�l��Y�1��m�1��>��/?��_=��{=hb\0��}�+ 9�詋D���Y���H��Bn�U� H<�3opG���)zkZ��ޠ�5�6Y�|��f�D�q���=�`ed��*�\0F��ޯ�k7�5���t�<:=�,\"������A��~~i>J�&�+D���#�B����w�\\,��\"2p ��R=*��L��+2���6��9PôzA������۷/��l�z7��I�5�nH�\\�4�������}�ů�����~����(�\\�^R \"Fuw�*\'�\0�6R�L,m��\\sV�F�u��A	���w3Lo=�k�^/W�D�.6��[yU���~_;��;���`��:��~��W�<2�2���Ω�?<��5h}\"��rX��*c\'*�\\�����}�����~M40�
3�9���/g�����R.M�;G�$\"��h0 77٪A�
ɠ\083��&.��,N>:��p������7?t�w��A%OBq���{O>���_|�7O?��Ν�6>Z=�E�le�^���غ�D�q�6Mlq(��ꎔ��7;���f^S�^om=��џ�J犺�Ҫ����W����j!Wc�aZ��Q�p�V�yb5tDd���c��Jӈ�#Lӓ�F���St~+\"br7�!�V��3P\"q��cXU���J2� I��B16�	Y�̏I�Q�=Y�y��ŷg�~؝��H]��D��;{���/��_~�W��g�\\��E�@Hļ��
������S&ރ��PG\"��L�kGƵW{6�^QT!F=;K���\\�k�f�{]4_��e�.	1t\0�:A��`_�ց���R���Љ��8���J��P��
hA�P�(��l6����b�8>999>&�A���#8
����,��c[�
�\'���\"��I��������/NO���	!H`B��q��Q�<�<�|o�8R��e�xՁ	��vC߭N��ѐݍ)��	�4f�e
Еܛ\0`i�j&�5���~�^}���]{�n^ґȢm0�w�w��g�ex��<>y���ѝ�EgU�\"�e�+,WF���#\0Tt��E�i�dJr�;ɵ�}M6�{ �І�Z�<4<̦�ç��ȵ2A�<uc	2	�/�%�z��S����>ܕ��1D���! �������]�m�Y;kg��\"�9���	I��~���ݨ�Ȯ�ЋWx3{�=\0&�v�����5�jR78\"#
R�a6kCh@JnL�B���
�F�Ӎ���#3���k��I{�ڼ;�� �j�XB�$��(B�@����m������￿�:Ky�:(e�=x(����wq�_�O���Wo���?~���<��珟����䓧\'��<��qےD��|�
>���}RU\"�6��R��C�Զ��M���={=��1:�rn��l�<n�\0�:a���� �U߼i\\~@\"�i��Z���ɿ5w^I��6��Ǝ��4C�cC���(��f���C����hX��f�93A��-�8	�}u�C��M��ͭ�EU�DlN\0C�n�s[	��&�e3AF&t��́H�q��W�������ky~�����������M�8biv���k7^���q��������ǿ�;�����e���^\\�EB �Ti�U��ib��b�>�x�+����@��|3�Y��m>u��b�O4����Ng����<��d\'�����,��m_Tr���ߌ�����b��v������0��a�\\��f���&\"4���r%N%�T���R�Q62a*%m6�]�ͬiZF�¤)���^W�Hq2+C�]�{���=�o����-7���H�̝
1J䶽����U�g�?�P0�8�p17|�
\\䯷��C�ݐ�
_=X=�(�x)N��So\0��
0���4ml��tx���Z�wX�����!�g��Y
��G�R���q�W2��~�}p|%�+��(y���9��p�P�TE�F7ĸ\0@��I���m�hg���b�]y{�N)o���v~�.�I�@<�\"����]\"`A�t�9�m/VGwۦ1%a�,�;��f
9i6���/�����~����?o:o2zCZl��\"7�H��с3�L�	�\0^j���t�]��Y�=����[A��O=�&28(����9�V���ALڶm�FDp\"�_���k���-��s��laO%)��)\0sU�y�(��!⵰���r�&� q����j4�Z?DM�9��#���:��x�Z^E���Y�8xJ�y.�IE��A�C �Tn���[�U��;X�m�n�1Ƞ((Mh\0bb�	
`�sf�v��I�x�E�%���A4��Vr;F0MC�n7V� ��i1!!3t�ݛW��������ޜ\"L�[����
��`��%[���E_
�:7]:.�Z)�s迣��Ʋ�߿x��ǵ*/V���ɩ�,�2�EbTU\"\0Te���i�U�Ɖ�_�)�.�^z����\\K�z�W���D9��9��?�k(Ј=]Zo2��Q��#�nn�����6������*B�y��K�*Y\"t�Ȓ#hkN�;�9�C��A���8b�Ó�`]��,+�N�U\"�pM%�Ŋ��%.�vݫ�_}�d��ҰR��:Kާ&4\'��y�c�7/�<���g�|��|���e���9�<����4����Q. ǰl�4w/�W�X��n�iGPfk�3���:��7���Ǉ�_�i�&y*f��pv�����L�����zM��9���j�CPi�7�s-7c��~�\'�۬=�s�;��n���IncN�B�ԕ�M�����:��^������肃��\'�Ը|�B+H,�W9�{��P�CX��N~I��CO�+��&`�or��n��v�0?v`M��`ūS�/�.�������^GeprC�H�EC[(��gw�ajbγv��ߩ��C4��Ԭ�
����e�:]\0C�p�q��?��=�?tn��ǭ#����93��SW
�_Nv.#�G���/�u;<�Gˤ���j���6W�=����O�����@���ږ��пYI\\=����]̈́8�������k���R׷�ľ�7o�}��ׯ���]�IS��9�.a��
�.�.ۙ���24NX� H.�v���\'��������W�߼��6%;�?��o~�6������0��朠(��b�$�(�P\'<̣ײ����3s�Qr�~r��?~�W\0l��n������Ԑ���%���k���\"s���ڷ�aKx��=�����RMV�;���7��f}�<>ngKu_�:��ζ��n������h��Эώ��x��
�{���t��j�A�c�>w_��w\'�O�����ǲZE�&k�Hj�sv�XQ����B?E��������Gk���-?��oFV��m�1��|�z�����|�އ�^
�R���R����\0���u-�������z��p�Q����g�YӴ Ͷޮ/η;r|���G�O���b~�Z�,��Į�n��ε�e��Z��	�c��|q�Ć��_CzI�-����GA�,�g�L�Ķ��g�y�U׻����\'\'ǋ�,4�hD���������={��[�$�4͖o�\'�=�Omv
CK)�����+X7\'��P@�J�p)̵��ӓP?�Z$2���W/NNNf�#Y����M<^������0��fv\\Zn��/��?����a�yp��y�-���b���bm�ρ\"��(���\0śH<�ˏ�pg��㣧��Yo�+��ݻ�/^���/�?���Ӆ4���I(�Z���\"�D�`�}m����ߏ��˟tL�I_�޳^D\0`/��a�D���5[�[{����~��w�~[g�y����׬Y[��F��I��ް7y�5L����!��:\"S�QBD7-�hD�hH�^�>�wu�A��<���C\\,��b�D!d׺gZ������٫ݛ�1a`�<N;-���l7l�{e�#���h!GK�\'Q��J�ӥnHCJî�|��w���y������q���~q��\"D��e�
nD(�措��
�5F�%1idyt����G���{�z��G8?���i\\ޓ��%^,��{�qI�_���],S(.�`VrF� ��7}����旯������_���I�ޣ\0Bm�ǳ�N���bh��,!F�P����d
�������_����h�\\W+��ru�X�ǽ����<v�\0����\'�#֜U�N�\"\"s���H\'���Áj��!о��
��:0blP@Ds&��~�����.��4\\_}��Z��i.� ,Ml���1�攝��չ�gq��s$r�ʘ��M��p��Z��	1\"��u��߇���?���^�f�/U�	�4�2\'�<�=�*8�1��K_�3AcwӒ��O)!R�H�.�GU�ቜH��^қ?���N59��-$��k�.�g��Y�.�d\\7C0tCp��
xq+���R�RH�Jj��Z��nW�f��\0�:G�)������j�Lc@��4�m{�pӗ���Ho^�_\\��]�B%��v���U.Kf˷٦D?�q\0�bd��&Dq�`M�q41�D��G3��1�4�gz�|��V���ZJw0�c��q���>�2=2��=����ǔDB�]�a��a�(�Ǔ|U<
A�f~���,P����O�z	UݼL���}��\0,8��������u8��^��tv�i��-���>�aJ��b�n�FC)�ҫ
p\"�V_#���\\�R���?�Oj6�#\"wS-e�*���Q�=F�h���V�Y���	����J*A������ikW[2�\0r*E
���ΏJjP$0 �D��	�b�$1)t\"���[�تX���f�޶�.Q8O�*Y�x2r35/M���&�:JX-��	�(J\\t�&4��w��\'�)���ES�;:P
�y?`�G&TM� 07�9Ҫg25G�C�Y9~N�u��YT�^q����/B<��/��5h�j��B,ڶ��NX�4�$9�PW�qr�`n��y����ߎ�]v��Y�y�q�ij @�VVE0s��y�GE0q��EiH+
���.4M���X@�n���J�˟?��X���1xJ�R^����(P��Z�0˹s\0\0�IDAT0�@,�
�P��C]~�@lr:5�b����M���\0N�e�3�t���\\x�]S��T���\\RGrg ������+����i�\\YT\'�}��
�8s�³G˼�4s5T���V7��3�%�&z����6�в{������O��ҧ���n./�n.ן����_�AJ��L�X3?�Z9%�Y>G>���+U�T��T������DL�(-��G�P3Wns�N���\0�� {�����1Ʈ�,�y��2``,�,��v���
�&ӥ��Kf�>�RqG�t����[Q�4�0j)��HfV�����M�L�Xt�ġ�MVZ�\"����b�6��f���k!��	�i�\\���?�_\\�s�Dmb���e�5q\'�W��H��!�p� \"�4C0\0p�@��&�v�����K�|�?�������o��ÿ������?����-B���.�׭��Tr�2zI��B�ޗF1-d��EKQ*DU,:{Ux%󔲂R�� ���+z����3��T�t:�Q�q�\\Z��^��02Qr#�j�X�
�O�ڿA�̜[���h֡���m�)� ӜtN�N 脨��
n5IB��\'�
?:�>,��;\'���W+y����mNS�-������������>#j6rC�\0XM�)��U�H�Ȁ]�M�\0�H��>^��?�}��o�\\R�ŝc0D0���m^ZV�Dcl����,D�Z�T����㑵�1F��!#��g�-V�
��9 ��������4\0��Zd�/(}h��£s��!��k��u1��H�� ���8��~�/�5�ƿ�zW��Nn�0��<%D�	\0�,��l�5�{�|C۽�S�4�	�A\"$73F���-�����Oo���;\"�v�(����������9�Y(6��ڦm�BƤ0�G��^��}@�4\"\0F>o�Q��bn���N���js��$���ȱL+�WLM�F�E�
EP��RQ&+�;�;b17\0:J���N�Ѣ{F��Ml��^M���4L��&.8���5�g�h~�;��)�|������zIS�o��3a.E�,\"P�D��0l���m����yRZL p�����on��7�&��m)r!a�v������
�4�u�}�<vF.5�e��-��M��6�ݛ�xu�������/C�\"���뷊�\\�u�yoS���*��it�D�� 5���J!\"`rT�bZ����Sh9FS˓
���EH���ч�q���z�S��SEB�]���Ô6��ǡ��4Ln����t�?9�OQ���GoM��	LL���ƾ/%�IW��:����}��?�+��L�	�(�����մ���m�)%fF\"&l�/8�iڽ������߮g���4��Yc��w�lsWJ!HA$ �<�UG�j_}�F����l���Ӱk�h�r�<���\"��bx���!���=��C��4irC�4p��[�C�P�421TCO w\"@\'$\0ra\'�Є��Mĩ�<r���R
 ���YsW
�b\0at��
Tl�x��%�&.�ׯ��\\�ߍ�y�!�>CTFjY�`[�Ee��]:��q�g�5��#$@��<#	J�mgS�eTM)�\00p/����0^�p{�B�g�V�o�E��-Ӕ��n��0�#W���;=���۰�;[wp7F,f�4���8
�ijB8[���--��~#j߷�������?��|z�_�i��,���t���}��h��Щ��!��������J]wS�IC�p�uإ��Z�^�?����q{���T�mǭڄ�;�4&k�#�|n�ߏ��>�`����0�):;�H�!F�RQW�P5#�S������Ӏ��]��_��&b��n�L�~��~�m�hcK�\0 T���.\"</dy~����7%�)�Øf�VM���&2���9��\"��1�!�9�uKdޏC����ib
RL�ߟ/��C��w����o�����+�8��w��k��.��R&�\'�Gn������\04�-�,R��M�b:N�FQ�u����S������f��!�f*�n[H��4L�34��\'p�t�B��.�G���pzp\'gf�Ŝ��4�,��i4M�2JbI������6i���zן�=�wpE&����e�iR��a�ida��
��Z��P-���9�O�K�R�i芹g��R��M����,�T�@���Sw#�K�t\'�(
��.FDZ�������ۿ�/�DA)`@@�6�+�Q�QD
�Ym�q&ԁ	1�?�1w3��B��y�<�*��7�\\ʎ�!������SJ�*k�bf�|bS���w����Y�3��뉬�(G\0/Yw:N�#Xbra��Z��\'aaj�Y�.�0�)�ðZ!4��yQG�F@���,T<��\0$A���\0�s�_̐�%��n�	���t����v���+�@��3D�BX!�����u�G��{�\0�������~�.�?�t�q
�Q�M�v��
�4�[tMc�Y�d�ƐFT�h\\��N��盦3!\"����@̡k�e�.�n��w�!HG��
�lZ�����N�����X�-j�ŦY.�U�ơߎî[�X���1��%H��\0�|��>���&In\"��c��i����xR�h/�4���Ǉ,
&j�A���@�7l���VJ����ԋi��.A��4�_��͇�ݧ�7Sa�:)�)I�X(�M�Mc����\'���B�����w�5Ռ�����A�����(���HL���1�����9������0c`�����s�^򔧑����Ƹ1R\0��xBs�yC��9!T{��]%t��:M}N}��4툉��D��ȫ��j���ht�˭_++A�RJ�1�i��|��y-$A=��c�%�����6��v=�_��v���YQ���H�#J6��Y���`C��|�x�_��w��71r���g�I�cM
UGGB:d{��jɚ��l���
*g+#$ ���9�V���	,���H����д(eLy�)ư(�0�#��!�9Ԟ���鉲q91�.M8N���V�~!��6
}Kn�Lg�bN�8_�\\�qZZ�Φ�I7��箥�
INSERT INTO student VALUES("KICTC-CER-002-2020","Abdallah","Hussein","Abdallah","ITT","BT-ICT","2018","4","kweka2@gmail.com","�PNG

\0\0\0
�c��_��|N�v{oT�kV�!S�v�B0=	��h� �w�\'᛼�ş_�Ǔ��G�-��¼�����\'�N
�G��GC�:
�y�x@�Rؖ�|������o���T�����yr�p���X���_�d�j�����16[K@������gbqb&X�����9QZHg`�]S%扰���I*���X�x#�R�e�o��@���Ӷe�\\h�h�Q��\0/7��X��@ϼ�
�����C!d	�<$U*���?�b1 � =�;��2G8���c�SIǻ@��
_2��\0aGg8<=�k@&�\\�u��OHM�d
��]�+(R�9]Έ?���4��p�TR9(~y��Q�o�U��hՠ�~JQ�xr\'AV
������R?�֔���@�[�JDdL����T$B�`P��\0�ڈ�,�ʷP~���\0�xN�=s���j
��[�:s����u�5�L^� $����R#k���\\6����z�F�B���w����Jr��I����NB�X�$��Ȩ�`H�v�!!�lH7��!�y��
������ZMX`�<:pAy�
�@�<]�N=�G�Қ)
?�̚)����i��.�Eg��k���|@Y�qZ0oX\'IG�\0d^|����:����9fwѬ��0}������Π�g)w�d�@~�x�bN�6�Z�RR�\\��BX��5�m1	JF�,�u-��7\\��\"�m�
�K1d	&ŝ���[����i�?P��~
rx���Nj�M:#ɇ ��:m�Qcϥ3o�?j�����nC$#k�3
�kB�vP&?m
;���+2��En��&T\\���KC+��Nm�?=tI���z�FQ,�-�G�r����9�yJ�i�����9�{D�,�[���=@��ΥJQ����+��h>A�5�V�`�#qǍӳ�Me	��A�����
u��r���pX��k������(:\\�quЌ���ʛnAfk��73%�*�0�k�*w�ۆ:�͔��N+�*F�ҷkq���5C,~Ȥ���	ը��6��غ5��s�,Q-8���b�,�Lgd�Qg6�25��;�cܛ�6 �)��}ޔ�_uڼ
��j��C�y�F��_�vlɼ�y�m��^�؉�ߊr�+R�YoC�]��wɓ��\0����]��𨞅
����%g7���j��vX�4��%FE�s%\"<�������g�K\'x��)̨�M:aL��2��Us3_:��\"8�M��	d���(<=�O�N6LJ;k%$�r�� X���+��7�6쬵��AC՜lOZ�H�)|�E!B�z�^��y�`�n�6��8ԙWdH:
�=���W�X��V\"(��@�c5M%ț]�7����lT;<|L\'���0O���[�� ���em��~��
�4��KNd�0����6�$�ԃ��u�,	��
��n�	4G����%Z�:?K!��\'-�%�cb��`#��k
�����:jxǒ)V�4a�x:u���J*�n֊ӭnMsI����z�@�Ȱ�\\h7\\b�s]0F`��ԥou��`�nͩc1a��o���OL�\"��I���@�4�A#\0�YEr�&c�����nT.� #���Ar���u��uꃞ6n}�1���(Fp��#�t)ˮ��!!��i�K�Aj���Jз]��#VZDS�S�R=�p\"Non\0�QF������Ѓe�NӨC�B�mV��D���zG��w�%����5>m���)�/�GY�n>.7���z$:
��9xEdtL�2WL���S�f�W�!6�~B�كP1�}���$BK�I�`����u�x���7 ҁ �̃v���h��EF]��;
��.�nƠSݫQ����Po�
ņb/���[�V֙�v���&zctYż� �u!m�\'�����_uSC�������?�Q�<���55����g�{�������2�Gޭ�	D_�]C$�i\\��#�Q�&� ���:a�Sǚh{
�)!,�n��RyY\0T������ɩ�����p~���w3e%h�SS0*놩\0Dw����윃?�t�e)>�wo�
v�␡:Yq�*�B�Zu0����G�����b���YWWA�\0qrtRt���Z�xp܏w�w�\0�Qe��5h�mfRI1�_C�#�B藙e�JR�����%x���?G�Z��g�a����S���y�8�ʲJ|N<j����x�ƹ��3�f63G%K�t0+��$q\\�t�r���8k�kݓ�0RЗ��Ns),`D(���*l$h�I������?��%r)䪀�c� �~�?�ݭU���\"I���q>���.Ь;����4O��3p���
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:aeb657a5-0ffa-4161-9772-a3d0d14d696f\"
   xmpMM:InstanceID=\"xmp.iid:ff96567e-8fe1-4bf7-a92f-ee4c46827861\"
   xmpMM:OriginalDocumentID=\"xmp.did:4c8b48c3-0bcd-4a54-aa23-d674590bbf2e\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1603714838723861\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:51aecb27-c61d-471e-90d5-b1bd1b9c65f0\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?>�Ķ}\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�
&����\0\0 \0IDATx���oeǕ�y�����df*-[n�յ���3`�`Ѓn�����%�r���[�̇�LْK�t�U����>���{������?
�\0�\0@�������RL��������j�Ҧ�T�y�q��A$M�\"a��W���oG�4�����LȈ�v�z��ի�~\0������a��<��uggg�w�޽��z�V+�0�D��V�-���������������~��ɓ��~�j.������\"��\0xX����G|���?ysr�Z��yRӜ��޻�u=q��c��Պ�8��3}i�q&�?��!��<����>�]]={����O�<-�}7M��Zk��
Ȓ��z��n7�m7�w��9���������?��?���! $B�\0G@��3�����4��%���P�o4��L-QĵO}�{��\"��t]-E������W/~�_]^�~���<Mo.�4S�7���Jb*U�t:��݋���qx�^���W�^߽ww��z��ek�^m~��O�$m�oͧ�UĤ�9gD���;3��-�6�/@��Y���ݗ�_����!�0;\"�:x�>�|��G�~��o��zs�������2RK��Z
�\0\"hk��0<����¯�\\}����^�:/�n7\'\0�����]D ��\0�G\0ѵ��-\"��Ϩ�-��,!YEDf.�]b\0��D��������/�y�����Vf7+�:ϻݮ�:)��6g��Zk����]��\"w���������_�R�������>���@��I���TUDrN��[F�r���\'\0�<�\"0��+\'z��\'���������s�6�[S���ܵ��j�u]-u��f�r^�WHD������Zm��[�:�2������O�����9o��a���DU����Iu�蟱G\"�hfFDA\0(̄e�_^�����/?����O�����3���2Q������8��c�[`�Y8�����4M\"�Da�\')��w������\\^l��ӓӟ���>�\"�%�h̥��ap��7��)%\"T��X�B��\0���ՋO>��������g��d���X���@����u�@)]�1��p\0��돥�S�&�X8%���^ʜs����]�_�|�?�_�������PfZ��p�ED�c���[F���]��\"������nw�ك���W�������p�������o֛R �ǹ�j�<�.Oe>�,rqqޚI�2\0�:����K���֦�j�BJ)崻ڝ���ǫ���������W��r�/�S��y5o��ef��$\"\"��Ώ>���G�<y�����uwy��:M1�Z�y6��*\0ܽ{w���8��<g�晈�����k��<G8̇ݹk��\'ۓ:O�����?OBҏ���4��k�k\'Ԃ�-�?DF=B�E����������v�t��Z���o͘�p<Kk�TU���RBDU������Mǣ$ɹ#ff�k���;�qS��0���j{��g��T!�y���z-ª�̷���]PΜ�?������������3����fƌ\0�9��Q-��L���K���Q�K���ׯ�K)�j�%�	��m:�j��~��P3u7�h�BD���1<�Ƌ��~�O�������?���+ߞ�?$&�+�,���]<�䣏~�??zt<���jwI̵6S�$�<�Ņ��S@�ڄ%�<Mǫ�N��}�uf���;��p<N
���G����_��<���&� �6-�D��ӏ������d����5|��-����g\0}3�\0��6ҍ\0��fLVw�>���|�7�
\0W��z����P����\\�\"r�	�����C��.�Y
���i.\0t�j-*�R��a��`h)�jM���
�z\\#p�^�֦��R�2[9��������ǿ�g����H���H����y\'_���\\_�~۱�ۺЯ���	!u�Z��O=z�ɳ\'���eӦU����4�R�4M�U\"�.��q���c?t���L���7�/ub�a���aV��aw��������1@�u�ߛ�;��\"�8%b����xu����_>}̉�.�5U
�F�tr���ݪ;�V�\0u?�e\\�� S@�j?��:M��4��~�	\0�6ۿ���lN��͈���&z]��a�_]���2O��T���u9L�ե	��+�3Ӧ�w�۔�z�b��ܒ�9��t�m`�+��դn8�I]�h�KNuU�j�D�%�\"D��{�#S�O����n�9�sv�����{�տe�k`�f�����>{�Xk
�(�ԍc�^��,I�:^g��Ð�[���N�kӲ��f/TI���	�f��3+�YJi\0J�(��H�f-�j��#w��I��~��_��?��?��g?K\"�7ߴ�e�O���#\"�՛��~���3k�c��`�
��mX�]\'��n�Y���{ø�WO�?���~x�{�FWc���y9�Ǿ��X�|7I���^v�S��x@�k3UG���i:�I����4\"ܴ��H\"�È�/_<�������޹s�o�^ѥ`l�����U��V&DJ�@�-��0����٪��8l֫MJ�u���ԡ�G�������v=�}�m^��t����w�cu`\0�$\0}ߕR����c�6\"�.L4Mu�Z��\\
���
�ݚ|��gϟ<^�C�H��~�����:�D����/���]
\"�}oU�n��n�M�{����ܽ{g}�.H~�֖T��NA�ͭ�w3��΂���w�����W:����n�톟ܽ��pw�ݎ��f��9 @�I�`ѯ֛}������z5���ݹ{��+�f�4ͬ�N�Y$��=v�1i�0g�癓�9;��|s��������D��v���\\Jm���.
��2Br1��[
	�/Sa���f��ޔ��.��B�����\0�ժ�{o�<#�����ʹ֚R�i~����ׯ�ܹ�Z���[F�����...>�L[E�,��0�����_�Ʊ�_�1�!	��)��!�`G�!  38���9e�������wm�+��V\0��uC>Y
!3 $���#��.���i=d�91Y��$L�zqq1MS)e��R\"u]�D�}��?��b|K\'�-����q-ewuU�az��ܻs6}f�ZU[������p�!	� \'@�\0
D@�e�-R\03#303�1�b����s�Yh̹�\"�c���K	\0���/��Z�:n����.M�޼����O�y��P���x��M[L4��n窄 �wOO�)�����Z�A8��DA,(\0�4]0]��;d1���Dd^\\������6&��\")����>�>	#lVc�\"Υ\\\\^��8����xts�h�-
\"@�k�)x��bBD\"H.c�k桓��1̫Uf�$�C�\0�y��|\0�V�z{r���
�<\"�}��2��� �D�1������?��f�L������k�����b�;�gF��Z�u.��gO�.��ty�:�I�t�2E��U�(ܴ������LȌ�$��$�~}/�u[eXF�B`\0�b]�a��W7����$�$\0ruSC$\"q��>=L3��R$%a6��z��D�v;3�\0�)��Z[���g�4��\0Gfb�p���5�w\"`�-.//���J�\'�u��͓�ٵ���V]+�-Z(a�5�
���b(�_��~}<C,6VP\0#ҵqd������|���ܢ�u���0��C�-\"�9\"L�É����]-y�����4�<O��,�x�?�eZB��L�2���(��t~~�?�V7�l�À�-�Z+ъ��p\"aB��Z���f��\0tc�~p��S��ȇ�n���N�+w�@��kK��5����Ab�8�\0�TwT՜;\"27\0p�Zk?���x�����F����?t9�(��!B������a��{�f���Zfto�E�T�IkA�E�VKhka
䪡N���n��m�u�J���~��ݾ��Cӆ�]��ۍ���<M��xIEXD���[�,~DU�����˹@�]a�&}絹���V��CD���h�`iΘ;��\0 SBXl#@����~���`
�zka�n�����A�0h�B�>u=y�V�r�9�S���Lo֛�a��1M�)3w9{��$���Z���dB@0�e���~\"D\\��s8�]�%��I��BZ�a��c@��ds���!\0�Y�<�1�F������ᵂV�5ZU��k����\"gNz�\0\0 \0IDAT\0sWu`����X��1I���x,�f��a��D��`f��M? �|�@
o�f��y}����㞈RJ��JʹG��j���u��\0��]�̜�H�	��ZwFg
btU$\0�p���9\0=��f��͢5Z�Vٔ\"�̖�)�M?�~�e���t�5�+őp�ټx����Cz��e�2\0�ք���pq?�ʹi�Gm-�!%FDp�!2zc�lo��.�|k����
m�#����\"b�F��`�BðNA���ZX�h�\\�U�\0���h�u
�Lk��$�h
�����AI@]�u.�jCr�g���\'�V��d>V����Dj��%%
p1�7oބ;2��CO�,_��_�ï��-���99z�|��`zmݷ�n�.�r�HDsws�e�� gN=�\0,>Ҧ�		�����`HK�22a�C0�C�
�,��+3�B�ۋL�}}I
�Ն�K_��&ki-1�aBPՔI<5�]���ں��Z7�p�5�F]�bh7���	\"�zΝ����f�Ak[�A���8�@xvv�ެ���Љ��\\�̜Xr�\0�s�H���R6�0p5g�`d\'$�+@D�
��`Ӿ#s�w��\0D��J_d��u ?4���X@N�X�\\w�Ʉ��r)U-\0#�j�K����a�47��̉�;o���-���
�D�E�01;rBI��S�(̙�C�,����<̖�����Y�h�ZqSaN���aK=4/>�%D��%$���S�V\\kf�N¦�`Z�/�$��֪��w����ɓ�k��&T���}���DD�\'\'�a��C�Kɉ�P�w����}i�D�`
ላ������Y��Z��;�k�ᖓ����o���*�k	�tqd��e,`�\\��Vpme���鼄���f���˗/!\0܍nȌ�e�����4ML�٬�L� \0XHBC�9��n	� \",�#\0�#P�9Tv�U��\0�ఴ&���%%�����@����^� ���,K拈QS
�f\0�,��
���ټ���a��M��6��\"�3��}Fb\0�Q��n��/�������$i�ZKG�$)RafN@����q���Zj\0H/�`p�9(�\0!93w	�{5@��u�F@���d;!#3.=v 8\\���2�8�j�)���u\'|v�~}u(Siu�����L\"BUe��?~��%-�Q<�������%{����j
� �#�Rww��l��F������Q
a\0K�3¥�\'b!\0����)\'�`���ڐ	�	�C�4�(T[MY������S���F��e�F��˹���_�rP�����2�.����	�%�\\)��\0��@� @�|QPq)�@7$FBp�0�I�:�O�(�D�u9 \'{^��Ֆ����W�$f�!B}�\"\'afnF�S������]ǿ��o�����s���v5n�<(�w�K�aF\0oߑ�bx�S\"�.;\"ZxsmV�G�м^a`,�x����$�\0�<��V��jN�j[!�xa�������%��X���z�ԫáK2�Ϊ]u�rr Gfq��$ZM�}{��9{\\�L],EA�e�[�e��Kq��|b)	������?����Rh����s?^�b�#�ppW�J\0��M�� I��A�ىy�6�̜� �5psWK��H�:���^�c�Vн-�TB���޽����n�L�����v����qh-��E��u�k�	sױ\"��*�H� *�������4]H�q���(Xl�k�.��C;��9�X#�`3����$;�LIz`h���.����´��fn�X$H�
fq�\0���sF&�EVs�������a\0�W��t�A�{[,�W���v^�M�=-I�1�#\\�C\'5�|���g|��6�Hs���yجe=xf�����)���Z25*��e�R0�a�-m��%N�A����֛(�Md(�!���,�{N1\"�I����RϤ��D�$�Rk��ҍiati9qv��2zs�(\"D�j5��������O��V�:�6WT��v���jخ�Ȣ\0B@
en���\\f�1��a��%M(�ә��DĒY1���{k��lΙ��L�!	9��pLǾ�v)	5aUEɈ���ם��<#�9;�8C��/��ﺱ�_�ڽy	6m6���
$	@�E���:�\0�D�@��ī�f.���՛޻�l2��&�IR&�\0����\"�tzzJ���d�	\0 %!��p9ttzo{�� 
60���]�o�uj���n�͆uߥĥ�����*���)������j���LI��J����_o��R�y�<v��GS�K���%�#B���8���)�l��J+�)T�.���\\�<h�ͭ>zs-z\0��k���c�we:�)�r�ZL\'�R꡵Z�̼�8I Ƹ�M+;צ�W�蜐!��d�ˡ�W���0CD��)q�[]t�<n(u��g躢����%��a?pʎ@�����\"9�,��yI�\0Dj�)a�zd���Iwrr�Y�!n���\"b�u�q)�!�~1�zBz�|j��̋��ܛ�Q�K�y&$���ڼ��ha��Z��U��V��2���,յ��t#���r�u��a��X�J
�fP�u�*1���9���yӶ_���Q{!U��z��O^��>�ǳO}��FI	Tء���\\-�?V���ź
H\0(Y4K����4d1d�0#X&D#�a<>
Uk@�j�T~vW��_�S܉j^_w\03�^���wr��5���w�r/��x�__���\":DC��r�\\,//.�l6�!F���\0ș�`�b>�����l9���
�
G�}D�M=b����r��s)�sM-�&5���j��m��r�+l�����XǢ��k[�n�
<$�b
�5���A�^Ŝ���o߹���pP�fh�m��G�o2�_+��%|�_*~��y9�~ӯԋ��uq��KB�������C��b���FT�ѼjO��O��h<����oI`���t���ǵ�P2\"9W��~#�b�N\"UIѻ�ʢ�vҌ�G�\'λ��R�`��N�.x&���}E7��
1Ǿ	X;��)n����_��_=x�FSWEe���~=���Rw��)���jӯ��U��r�rUӌ���2<ZNg��ƍk�=x��W˅�2��m��z���,�uR0D
A���CD0���8�aTW���y��{ǌι;��,`�G�#0��q��߆���Q�	������4�_#B�8��3�����������}g>��@	�ň��\0�׀ѯ)\0�!+w@��r��麼\\��u���mc�3V?��#Ww�Iͼ�Oj_������Ӈ;˽ds��U�L��*�����ҐDP����6�
�,G�U0�Q�ܿy��o�uvr�9{0���^-?_�&�������A�?��G��0���Jʐ�
��mK~S��I�$Y5����L`�3{\"0��Rb��r���w���޽{rv|t��S)��{%��G=�ǒͿ�9�J�����ܥ�0k�a����hzr���������r�����w޸�����ܽKf��������ų����]�Q��D\0F���ٺ���æ[/6�V]r
j�ٕŕ�Tv�s�1�$�\\1�*?>;y�ޝ��\'cf�]��ܯ�];ݔ���&����������?v�JY��OF�Q�G�f�S�M1�Y�Ţ��q���~�h6���{����۲|�������%\\.�\'��Oo>�N�t㋏���%�v��gI�����Q�\'?�g�������o����-���w��������G����ݼ��F�:#W�e�����,�S�Qr`�&u8��9?n�����j˓����!�KY�Ԯ���muT��\\���i��ƈfj�5���x
a�q2l��$�������o�M����oWpJ���﷫��{?����N�7�F���[�f��`|����:�z�զ�.X���i����<}������������������/��h���=:�su���<B�e���,ȕ��%�=�)`̒��z��sUU�Q����Y���?���w~�����ֻ?̤��u�^��o^S只�q�ų#������h�E5W�:]2�A�OΏn���?s�s�e�}�V�����jဦ����$�S0 ���Օ�\'����Z5��ϗ��O������_���ܺ�N�[t�������{���ǿ������������{@1Ofs��%Ƙ��9WW��.2N������t4���r���G��}{���G2�ZC��_|}�Ѯ���^��Ө��˗/���/,��S~
��%��:�eEd/�c��=˒����?0,�4\"��S�64~:�ݦ[-�0���P]�O����D�ۈ3����?��?��������@5aK�����f>99�W܌��>�����֟���w�y��L�S���擇����߼���s�d���k>���E�0ā�CdP5�*;�R ,e
VUh������h|��؛4�}�7�A�n��4f�]�	��u	���Çι����)ޒ��Hݓ,.��{
/�Q�����O����w���{�a�i���\0�o�}�.������߿�k{�\0R�[6��rf@�
HL�WU}~�����~u�X���������v�,K��מ�D����y�NytD�4K3\0b��33���!!��#�+�w�O>�s<��w��(��x:u��痧k�C=�P��ιC<��뛪N&�dU5�X���q��@�̌�MӖ���H�Ebk�:0S@��y$*�\'���_�/n�J�\"��qL\09
C5v�A�]T!T�kj���(�G�� -�t���nݽ�~����G��<�S���ݸ9����ݸ�M�L \0�-�s�FU4!������\0X]��w�vEhH��n����\\U�d<?9;�e.����:�����o	�\\A@�_���RA���#\"*�q!��m�æ�^F��P��IX�����O��m��{�\\8h�u��O�ߨ�C����b�,�&Q�2a g��\0ErNC��u���{���r�E{�u�L�3�w��4�t���fttz���>�POO�Џ�,T)g�Q�t�j2�D���D-��$SA��x�c��Fu��W��sL�gg�����,�X�z�7�5�uc����!po���%��8�����vz�M	l�/}
䚜�b��H��ԫ) �	_Qp�0�����ƣv>�2@]FJ1;_YJGg7|;²��r��Z�]J��D%S_\'��x�qqwv)m�Њ� ���O
���9\0�0����&�i9V�7����KyPnO�>Q���LD4�N�\"�Y^i���2��v �\0(��!����#�l��
rq�%\"e�hy#�Ro@1	\'1� W�Ё�XJ���xbt�ƍ��6���앀|�v�д�W�6�4�cߧ�#�jF$D@�[�1�`IRUD��y:������{�!3R�Yۓ[�K�/�]�[w��*��_8fW�,\0
�^��L����~!��d^�n��v��MD3�b�^��T���\\�EK�,c��d\"��j\"ZZ�rqq���n�
�D����tj��)Z޻f�MSU�5n
�#C��xW
�j\0Bp�)��= �r�+�ڒ��^b��m9l9vD����\0��1\0��)�)�Z���๏=�-BR�����h��Ѵ��sY?]?�x��gcp�
}��H��y\0RY:�1���f������+��j伡�j�JH�,Aבt�X����#mG6P�:�E&�*��a5OkW;Ώo:j����{��9PQ��v���	?u�!�����k���|��l��߼~1^%:�:�T�%�޼y�tj�ө�V3\\����J{�{_�m�ߪ�B�
�U ��w�4kN	B
�d�0TL�E���b��PL@�ITI����gF&���M�J$��\"2�*�G��ّz4;?:�5,����]WO\0Y
�h���0�LLA�\0��11!1�Y.�ќS�I$�
�4�ȒS�~2 �fq����ӣ?�ڑA�z6Lz���R��Ó���}�߉�T�������Zx�uͪ�\"������2�/�Z�8��IY
�~�������*`@bd�j\0\\*Q\0-v̀��L�1����J֜U�DET��5m���BU3z���\'WW�W�j5�\0D����zl�3 ����]�����)�~F���a�6���}�S��(�l �b�S?3 G�`��E\0��99m�H�*b�rRf@R5	֯6��o�\'\0�7���B��1v�1�\0��4a��R�<8&��C���x��q���8��]��
������Q�R��H�Z�
�׹��4 ~�\\��]�W%�^��\\�eH�#3#���b��];���Y�(PRE\0�k\"69V�~8�Ȁ��0�L�T���j�+oF˫ˑ�B����y�������>�Nc��FM}�V����\'�PlxBS
��Ub�v$0��@��2��-����f�i�����ٓgy���m[��f|��<�\\�����cs^�PVM��	_���M��pۧ�=��}���9��s�l��\"��pK`�03�vPB������U�!m�p���!08%\0\"�Y�Lz��>���ų<��Y3�` .��{I`ʱǜ+2t�������m��=|X5�tt�����T��h�1\'T+N�E�OUUTTD���I;���j�\\_-�t<�1�͏�����W�����=?�gd$Fd�W:�v� i�X���w=��-��ey�:xX}��4٠c�@Jb\0�s��ʪ�`ͦX�Q�I�,�Cr䗗WC��ϩ���ə��!�ݐ��j�+�L�m�WWW�==>~q|v:^/ȷ��H� ��ۊ�0�������~[Lw�\"��Ħ��y������\'w�x��vX�����o����l֩����Y�kg,��h@��w�\0�>�{�oܫJ�zT��mw�w3D���*&�*���:g�&C�CR&d���.���5N�0����1]��ru�k\"FKy�]�X~��#\">:���b�/�q�X8������kM��9j���|-���@�@�0hN\"\0�sC=¨n�z4�X1gY��g7�\'3���*5����k�v�C\"D(�e��\"��7��!��
��t����2pG�gjĢf�DJ�bP�a\'�S_73US���`�L��̏��ګ)�j3��$E��mc��
����S��f
��y%���T��R��@f�@ǳJ��36u=����nq�컸�nW\0�������g��;7x~������\'����ggYl��B�
s/1��>�!�<}�Yr솭s��5U]6u�N��z��G�d�������
��u�=�R\'�������rF�r �(bմC�$C��>W�A����:�[vT�:\"��6��΂����G%�w��;o�u����٩R���а��mۣ%��N�q�v}ק�O}�̼�H���e�~��Y0ǌ�`�Dv}�v�?z�|2�V�i�Ni�6UK�\'��a:cu8���_/R(�u}?�8����}߭�!QY�)�3Er�XQ��e�vZt׬�o(��o1��o���^��=]��YT
N�Q���\0r�LD��]��݌����[81EBF��TƦ�5KΒUl;�)���cJ)g���v��U&���J 3_��DHx0�~�Q����L�/��/A�5\0��G�]j}�r�If/V���\'v]����+���忲�F%�(�\"�1Y;j������\\�\\�s�\0ܐ���z���j��b�]_av���p���#T�L���3���\"V��zeeS3�:L���z	�Z\\]\0@���
�l��.V�]]3�*��`���b5jC]��1�CTrh���1�����⃧�mW�n&Yɗ�\"��
���L
����@f:���a��ɓw��f�j)4`�R�8��P��V���u3\0����p�VJs^�O�7��\",ͿԠ����^��^��_�A^	��R��\\����u�@d*��ǧ�~
�J�!�텐��8����g��i��
޸y�ǆ��� c\0�������O\'����I�:u�zϯ���?~�W��z�^�x|�l٭Ɠ	\0�ۦ~�6U�g��ƾ�`�����ƣq�q�~BP5,�fZ:�ȗaO�U2DCVbW������}ovv���~`��sÃ!��+�����d�/��^�lE���*\00��Ӿ���0�X[��]�b�E�����!\"�+J��N��:���\'G{��eFD�
��/dU$m1o�~[�u��>۸���v<��p�j=~v~v��C���d
��31��hre���o(\"�l�������1��E�i�B�ݺ<v̓�b~�>�~�sO�\"�������%AKߪ���S�,d�1m��a���l���l1@���5��\0I�����{�/�gbF�C߆�h�LFG�-���s�������e���ӧ��������j\\�8l��5���kR٦!��b��R.8�h�g�\'O�I;j=q=����옩��ZV T@50�,�D��!r89�e@(�!�o�Y����ٰt�\0]
����C�_)O����6���-l�a�������i�.:�|}�΃�I�{��K�Isz|4t�	G�䍻o���{Ƹ��n�=[.����?��O���x֎������J�������u�g�w�Zbf�ů������B����9v�ʩw����Hj(j�fb\"�Y��#9 vը�%HbY�=}VQ����8*�\"���2����K;���垦����xuuU>����_B�_&����*3T@��ST��No���L����
��g�	��n���ŷ�\0�п���Ѭ�bR\060՜R?k��aT���	�lW�f�]o���j��v1e5���,G���
RcD��7��G��8��c@��
9bW;zU��9�ҁ�lws�/>o���p����R@���Ŀ�����������g��b�L�� Mے�Iɺ߷��]ۃtb��-F�\\�aHy�桔�7��sİ�o��АL)��ȉo�v�CQ�jEX+�Y�3K�1rB�՚A�v�?O�HVM�~s��2�~���&\0�W���S4%9y�՗_}k��Q*�
Y5i�yNy�i*�������7��.uM�Dӌ��i����tݒI,�i*��m��H��b$�n�X���O��2�qxu^%`$a�sf�x���3��q��v_�`\0d�<�>�(��G�v�-�TĬ_��{����<MC2P-V���|5\\9�p��9�w��!̩ah�F�R��4�8�x\0Iю����)Α�Sֶ],W�<�K.�5 \0jQ\0cg���y53D\"C$E�/��v����6ɯ��un�O�&_�w��uH��ޭ�%��X����lȤ��������4�{��h�Ɯ�y�4J��9�{l��=Z�ɉ9�0��[-L��rJ@hY��m
�\\ o��uR��vX����痖�������v�w���3�EG��F��%�����սK�ww@̴1ǔ<|؜�\\�<i\0���p�d)�hJ�\"�JL!s��\\p�E���\\,�rFQ���/]*���m�y�}�\0*���v7�h)�����i�	�m�L�b��zf�B\0���W��aw��[�����/���^�o\0��#O��+�s�3����V��!\0���)*�k�_���~b��VĀ��V�C0�f��<�,��iΙ���h.x\"�%.��~��0�o6W���f���n���R��#qΐ��H�o�E5�\\J1D#-)�/�\0�.7�B�7���y=��p�B�.���[���\'v���i&�3�E���\0����L	���\\h�DB#���c\"�9����t�R�,5�s��9�M)ZJ2-%�y��&*�����9�Y���Ɍ��o���s���Ƨ,�dHR\0N�����e{Ρ�d��#^\0�8�qJ1�\\@Y�M��\'��������Fܢ��md �M�:n��X4�
i!\0d8�����*��ϊI�s���|s�J���2���ͷ/~�u�aMM׆,.�i*��1�lz��xn�Ƈ@�[9�U�.��5Ȯm����f�mZ�m*31���y��g+��BJe�
��mpMpBh
Z��v��Y=P�@\0�T̌n�  E�g?�>��W�v&4S3 �Ӝ�Ň�?��O=;\"�}�Fo��w���N
@.�oRADa	A���@Ȏ�NR2t�@��@.��y��bj9CFN�08��T��;9�43bJqڍ���	�\0�A�����i�sN�oqϔr1 ���}����[�ޜ}�Dbq⚦i�]:ߙn�B�D���썉���1�7̮	�{�Rf&|ҁjLs.���y&�b.��	�v}���]
#3� j��4�i?n�r|\\%��s�z��-��?��PM	�\0��@.�8׼��+����A*
���5��;�.PZ��<8o,FJƅ�a�8��z�oC@�1ǔ���4k�QA�TF全�Y���E<Y���	#�e�g�B���狓{�*K`��*��p&j������+o��p��\09��K���g�1�!����Tr�9��R6U f��yﺞ�Q���<\'ZR����6��8
�ʾ~a��<��V��@�
Z5H�����ދ��CR#�<3G�9,]I��٨0Q!��9�&�P\"0�4!h���<ϻ�f�v�8�qf\'� �9`J%�i�8y��WN��,�0�1�yv�=�����ۣ\"�^�P�,�*�\0�V�e33�;W��#of�����z���R���e\'\"j�$9G���o�Շ?��l�\\�q9K�Ig͘��\"�RD� n�N��1�q[J�T�4l��>����9%qAAS�1�8
��1�+Ś+� ��H���K������E�RP������;�f�R��lN�B
a���@g���J����f�we���0&U	A�L�4��./nL����o��\\歔&�q��pٵ�e�n�A�m�z��i�{�J�Br�ɰF�;�:�QՔ���럩����\'_���\")���������X�3��HE���#H9��2�F�s��Q3aa2�\\��Ӱ�ߤ\\����8\'v���q�igF����~��׽PSI9g1`4H1唻�Y��<�4�{�󸟯.-ǐ�Ŕ���/!\0�8�J�5�����5��S�c���J�3��lU�	
`wt��7��q���%V-�i4�f��sQ�Ȏ���U�ǒg&hZGc�vÐJ�9?��������j�ۏ7�k3@
�����{��Z.v�K���\'+���#��T���[6mLi��J�\0F�7-F�Hx(
rpL4�����RJ�M�<���3����`@\0� �v�������q������B(h��!Ʃ
�0�S,c��dC�����7���tuu���-ý���/����a��a���k�5�Y �4�fд�j��a����\'l��L`�!Ny�3!f!g����
��E�/U~\0��������
P64���x�������ׇ�O�|��{vK��������$��J��y��!��2E�X���i�O�ͰYＣ����ӓ64]�8N�� ��_y�Y�)5Mwrr�6�f{�b�U��3#����͑\\$���
N����XƔ�T���CF\"$`\"D�b�c4�H�o��/��[0�������E�5^�7���
D����L�����
�\0�f����\"�k����r��9ǹq4����=>;99Y.��9U��t#�9F�Y��!��:�m����n�JFR/�����2�%\0�3Ą��S�
$
��aN�tɌ������iC�������)��,���=�7�\0�x�վU�30EP\0��������s�ZE�XD�3\'�H��ĈL�z��S���4�@Sʦ\0�	!1��4M�`6闋��S@*\0(BΓ������X�i�AՑ̔
+�8��4��UR�]|Z

3s�@f6��Ņ��j��ι��F��V�K2�\0�,�*X-�5[N�E��Y�˪j�	����L=����1�iNeN�D*0J)��a�c������}CAb���yd֔} �H\0�\0��j�I#V�����jRz�a������y�q�7�;�M�y>??W����<��?���V I�̩�;l�
�O_x��㬰��C�8�Sڧ�Xt\0B\0�4�����c\">>>�[k����3�ʌ�� �T�T����Q�3�
ژi.�QA��Jj�\0H���jut�<:uM�u.�;avHbHH�H��&t�W[�R��1������G�<r��$���R)9咽�}�4�qL���yb�������i����GQ�����/���fj��9i���rW��j���ѯԲ�Z�~Kg������\"�s2��v�����������������l��,n��r����G�����p���iLq_��`�s%�-�4eUDP�<e�[QT�	
(��L�V����D��T�y.��pvv���>z�h�Z���-���\\�ӷ�|�_�������T���\0�����Y

a5ID\0B(��70�z�5\0d��U�M�B���\"��?ȕwKׯ��������\0����xdڭ����q�}Ӎ�0�#-9%v��0ϣ!x�r�C��n	j���!�����q�GM)%\0a���7Mӓ\'O����{���?uN�)��2�������|��zH)ף�y�7����uu������?~l��7�y���/��W��������/��2����~�$0%��9���i1+X�P�@�BDf	A��Y�����s�,A�-c#�a	$�ŋoз`F`z�0BB`��*@2SdP@L)�=y��ٙK�B?ϺX,��4G0���	������1�q[���t���:��.����v�],��߫��:c�l6�4�Ya�Z���׽��ۊѯ�bZ��\\>y�x��<}�$��n~�ˏ���ɽ�9��r����U^�/�����я���E��zRs�1�����<#{��h����b%�����(�cn�,��d�\\-�o��u�0u삄ƅE\0�\0T�!�!�!�����\" N1��_S|��*�G�x/1Fbn��i��<��<Ǧi�1�\0��!�4\0��ضm�P��n�����˅��\\RJ���{߶��ٓ�����s���@ɳ���Cb]�(�|�S\\���H=Q5\"J)���l�W?�8�6�he?��������:?�1�<�W�o������/���민��KQv�5�L
f@�N|㻬�߯�� ��� �hm���z���·�vqܭ����s�K�\\���~)m�����j���t��i�5ŝ	,�9�����-�s��b�mSD!f�ޓ�k��ǔJ��\"Ī�̻���ͬ�:\"�w�\0�o��N�a@-0Mq�o�7���j��YE��3W����e�)~1J��9�-EM�̼gD�g#B�1���������ǏOzW�=a����o��pu���l1�q������?����~핶�~a����i�dME���\\�-S4!߅��#�A< �9CD���C��>�G�j�-��;$\'��5,
��I��N���\0�0��M��O��q۶)��>Qr>�Q�T�<Do.��t�{?���>l+pm�-�3	0�`q�\\.�*�\"�k�:��rMv`@(���Ѕ~ٯ:�u͢�����1��뭐ϭ��*:X(#��9���
�{\0��~�9W�>+���;�����*4M�̕��s��v5@����o6����W_}�x`�޺�}�1�UD�LE\0NS�9�t}}��\'�L��4�r��\'�M���sȨ 
�rvhi�m���xx������\\�P @���9#T=���,�	s�B�DST\'�=X&3�*�DN����F\\���!@2��@b��G\0�.2r݊2���:���H�z~��ُ�^!��]�M��x�a5ev�<�s� Uu�Z��v�e�cJ�9���O�Զ�]�B�^9�$�C�4���V��0T6�4M!�q�B.��>;==����L���=?ù�2�c,\0PwÇ������Ǐ���b����z��9�;=��u���(+!6���������w^<Yfd�-�4t�2\0$�R�p�KѢ��nI��8-�7MhfE��D��ƹP�n�E��!:`c&dg\"@�,����+�!��
E�}���yz���e@�T�Ƙ�CN����8��Sj�f���R�qG3���5���n��ޗR��WWWGGG)eUm����&�T���<��8v]׶��2���>���ſ�o��E)�Ҟɾ2(��(b\0���|����UJ�m�����vq�TUE<\01�j��]�	P�iJ����ɣL?x���΅V�yl���\0��>)\0!Q�3XF����2������`Q\0@ v^��
Pd$6��9!v $��P9�\"Fd���		 �*�1�_^o�٤����cB��R۴�(�j�Ǳ��f��l��_�V��וʔs�I�f���W���R����k1P������s�i\0�qnB۶�������+�m�h��d�R������2g
��������i�1��|ttT�v����X,�s�����������?x���r��\'/}�0��ވ���a|r����Z�*��m��\\^.��{D,������ZKq��d��_�4n.�����#�M@ V\0H��P�Z.%�ČHf$�o�k���k�k�u�:�Zv-��\\`HI@��l$�b�@���=�g����2!�V�dTD�!;;���I,���8E�<�@��wE�!b!���i�6���y�+d+���+g���>��@\\,�Z��n�f�g�\\T������pk�O�A=Sq�*1}��CU���G��^�@WGw���.�c���GGG�5W�M��NX��a}�����\'����ՕbQU$�*�YRђ��z�U%��86BC`@ \"� gD8�=ĆBN�\"|U
��؁� 
�p�<Q��G����ғ�\\�n��
���#@2&@Fvw�B�`�R�谅Hp+ec\0j�H��C�2��>�RF	��XJK�,\0杤�b�εU�\'�Hą��R�Uw�k�v΅jo^9�s��9<�����,�⽯�4��M�$\"�Ţ�R)|9��\0!4������~�w^We3���ҿ�5�t����..���U�0׻���j�)Ƥ�M�
K�\'&,)j�����1L�����HԴh)%�+9ũ��JB-hZ����I\"$tX;!����\\C�aiH�vp�g�է�C
JA-��ld
����:��z��H��P���>	H��\"t������! v�)H��ӻ��q���h�bZ��� �H�N���&qqqq���y�kL�Vk�궥���v]7M�<�6�gu���}U�2�����SS�6Y�{_׍��w��͛71ƺn����D-F������x��&���\'���g�Tl�b��y���
M�=�����o��������F\0TJ)KY�����,I�Q�!PR5s2��X�A̸d\0�����w��@.�3;1��{& R�X)��,�Ғ������OC���q�����9�@� \"0B���t�\0b�	FFu�o3 ��B�9�ݷ��1F�g�\"ƣF�MӴm[�u۶�\0�ue�@�뺦�y�_}����i�?���@/��
)�����t��+2�\'b$Ff`\'�E�\0ش��o?n/���������nnU�޵������sp�r��y~z|(�x�EaJK.b\0�	�m��piTj\0�G�h�%�}�u�9U	!�P�����;\"�}oq?�JD���6�����Q�\'ƣϾҲ��b�VQ�\\TЬr6
�	�	�ڋX�2\"���TT	7U��_D�Y������8Q n�|||)Ρ�Z�4(4u��}U�&��U9�<[�7\\Z�����q���r֜��K�PkX?�N�奔D�.=�m�z��y�����8ܩ~�,�ǌєN��r+��HUU�:��KZB�vͮm����8�ۛ�����_���/4Eb���I��b��
�0� �L*[�_��������DJ�̫���JH�`ߍ�Ϭ�e2���.������i��v>�1\"�\0�12!��4��%M�����!!1Wu]��jW)%�8ϳ�c��-���H�4T�Λ��R21���c���h����0Xⵁ�~��~Y��ͭ͞~:��s49看=�&V�8G�|Q���\\��i���횧Ǉ�������/>���/@}*P�\0��wA\0!PT!PӞ�$��=��O<_�a \"#B$R�@��.�ٝ�l}ޫTT9��=���!K�um���0䜋�(�#U]R2G\\J]�dx)p�-c�˲0�ѧa�4&��C֠��sC����;���4�mkcS1��b�YL��P>��Y݊��M^�\0\0\0\0IEND�B`�","Male","Approved","12/24/2018","79191202");
INSERT INTO student VALUES("KICTC-CER-003-2020","Shaibu","Jakaranda","Swai","ELE","BT-ELE","2018","4","kweka3@gmail.com","�PNG

\0\0\0
��wL�������;��C*����>��������eU�Ϭ�|���?����u����|���C������_���ο�B8>�������{>O7s%��롾�}�!O��*�/|�ޟ���^#�ۛ_��0B$�7��7��Ղ��Ol|��bz���∦����\'���H;urf�7�j�YKx��v:7ށw��łJ���Ɵ�н�B��O�XWT�eN�.�w���?���&2X^�;8��\\b��U[����xc���B�_ Dܻ���Ȁ����[ı��ɅzL9.RJ��UƜ�{Խ���{c����,QRM�Ԍ4�Uب��;54K*��RK+��2k���Zk���R˭��Z�m��SϽ��[ﮏ>G	p,��6�cNn:���\'o�sŕV^e��V_cM�|,[�jͺ�asǝ68��n���	�R:��SO;��3/�v�ͷ�z��w�����>i�˟?k�;k�eJol?Y�W[��D�匌��xS(訜�r�N�S�����*����2F�	���e��������9�9���C�������ۘO�eHm���D��I��y��������EhF}��1�3Ǧ�\\���<�S�����Vk�]��D��˴���\'�S��µ������c�Ĭ�{g���]I��c3u?�_4�L�/E�&���X<�S��t��ضԻ�g���ɭ-.9[#Kk5�܈+Q���6�{���~&��� �%
M�0�J�A�3Vɇ��|;?��6*�{q��춘o�.�UXF\0:Z1
��ܻ�ͩs�<k;m�`���$[$$�q�JӐ��;�-[=n2�	�VB2����ξ5̵{�_,o�>�\0�F �<�n=��E�gH��|�ܓ$yYul(��� �qS;\\ŀ�E֨�H�KD���-܉n;��龃�؍�tk��a���d�a�误�)t��7�y\\��N��b?��vj�h�%�Y�/���!�W�%��$۴��K��\0�ڥ�ŋ���Z(��Ļ��>��T�ձ��f48w?��踓�8<7�)��)���I�k����:��Z-FZ��X�@�)�E���\0G����`�e�Ǥ9w�Vid[PƬ��):4l��C���eY�q9�������漞���z �).M3�F��Ed-���\"�;�>\"]�s�&��J\']Kcn�&�v
NW�(�z�o�v|[:��gh=mI�ia���b#P�<R\0�D�Κ�7��dZ�7@n@�Q��im�\0��D6O��hR��#���hx��	O��rH{(\'����eo�&�\\�w^��	:Q�8$b���%�� �+���X_��&*Ȫ ���{�@�CS�xԐ�#��i\'�I�ҕ�;����k&��/��2A���)b��[g�$;��G��5� ��#��?̂ţ_oͪ`�b}��hGpU�5\\\'�{�E<�A\0��$����@!p1U(w��c(m�r
\'��<7�\"&�At�������8��4ܺ^4֦�
�S��3@�F�܅����)��z��Gj>m��!)�Sz��#�::A
�dq��C��ȫ���@i����(C���~��1��
2k-���Dt8��W�
=Q�%��ł��,e�ׁ��C�MT�����2�
\\Y�Er�噢M�n��P@2BZ
���GnGG!��� �p��i(<5�N�\0>������+ы���P� \"xu�m4�~�ü�i�FgL�` 9I5>��/O\0���A�k*\'9r��V���㧊Y+TԮ��#��{-T>B��@�:�s���5=���J�֔u8�2y4R#v��<F�T�SϺ00����,�.eD|@��BA��{�*<FHu^I��R�����@�}}CN��u�w�����Y
��cQ�؋J?�ED`������h��Ld�5h+��AFT!��ƀ� ��x�[j�y�Fp`�S���V�2j��4$�h΄�k��Y��{p;�{�\"�5
�![�l�������X�v��\\�S\'����&?@YթS��T�(YY4}��P\\�beJ\0G��������~\"ILd�`���J&Y(6Ծ��2���>мʰ>x�����{#[)6I�8d4\'�
��Y�ZJ!�6���p,�*���X��?���@
5\"�.�����\"9TovcB��%q�\'>p�0�(���K��bX�\0RFBtO���	���c]��PS�a����Ox���EB��H�4�Z�.��	Y������X��zG?j}]/�\\�x��d�A�9�eNh���>�Ms%��ckC}�$,���0YhxO������l;��F�L�2z��� ($:*���Wn(�BMI��9��@�8��l�]6K02\\
(Sz����͒ ���1�J#��B\"�
��\"�@Su� �E������U���pQ9��C+�=C���T0Q�NWx\"��k��f��p�E�������N�N�p�버��5k`�fG�\"c������.\\B��\"0���|��c�1b�븝&�����{��(
��ׄ��Q	�t)ۀrծ��|溝�����)�䇚� N20!ΰ���4jWю�`�L�ʑ��\"�B7#��At�o���ɤr�����\\�#V�ܞ*dU��F5[�����2t��zl���sC5��1���ᗥ}��*���h����gb�Q
�rV�]� 7�?rWlhn�l%4�ޛ%Th!��I�>p�����ءZE�$�f#t�AV/\0�qC-�\'hZ픒e�5�p@��0��|�$q����і
�S��rOo5}^�ۼ�@���ʣM�~�@c�pj��Q�q��@֡���t��rBFJ)ɧ�˷�A� ��k
7����A�i*Ca���+��X�ŝ:t��
�A�47����d���\0�	��iAҔܑVA;�@�}�}�Q\"O��O�T�j�\"�C1O�[�覑o)�i��d�Uh֒e+�ӥ�%P�G�\0�J���K^!��e�Y@�mO�-�4�Z����P�/|k�
h�^��_�H��4J���5�f���6(�*\\��N����_&Vc���SW��.���H�C��˻��	�����+�<�gD�q��uA%�
Ծm�
X~�5\"b��#�@�SD��;�΅��;�ql\0H��.{�&9��I- ����f�欸�
�� 6.95^����ߘ��7r���t��H;T$����U`�hW\"�$�K�$��w`zsKd��	A��\')�{X��Z�Q��PϞ.Hr�t���ϝ�q�^tY�R��9\0aє�{\'xJyz��_5Pz˿�I�����\'��QB�j�c�TT³�A��WS}�Z�+��I�/�踣�Jрb G\0��8A��L�u�>�6V�f���^zi �!J����5�EX�$1��L��&�f��*u
��u�W4<�ə�~2-xb���h����[u�#Q����)����툼���v��Ң-�rC̵E�S���݄��F�N�V�?bvD[da�]B*\\���9�X@��T�M��ī����&̀=}\'?0�Q;�/y?�b���^�mf���i�N���vǆ�L�<P�n(�޴�)�iS�ק�T����_d�}�|&�҅�4���Why��V*XA5GT��[l�c�p��� �:�S�d�*%j�&`K�T�9	�Cr�μ���tzCspSЦ�&>��(wfi$�\"c]�wRM��#oi>�!�&m���n��h�h��}V�Ԣ�4�:\\��W�&�$ߚ��}6�����f�����0F�Y���n*�h���n�<B�rOy]Z�KݢŮ�R�04xh9��uY���5Ce���]>�t呂D��
T��.O�i,W�y�*ʡ�4�FŃ��fGI�V�n�\\~%F�����\\	��P��)�;&#S*2�r���.�۹�!��h)h$���wh�j\"��E$��P)ĝ��r9ਜ਼�c��ј����4J��٢�QE4FR#+��}\\b�\0\"\"F�#i	��ai4pX�lGCh+WG�F�rOYP-NG�tĠ�t�ʪ�\"m��8�\'q�АGnE\",�[�Җh����wʘ&8.�H
��)��ڟ�\'b��9љ �AQT��BʏTGP���C�D<fC
�2�J,�hۉ�^�&�p���t��)ϐ<�P�
]O$Ho��f5�ʔY�gڢ�2�C	%zij�T���< 򦢻\"Dgű(F�(��si���(c��\">v�>��+���ֻ\\�N^&����l֩\'�l:�6D���h;G�
#o��}���ZQ\"���*���ڽ+��\'�|g��\'�:4�{���>^B�� ���$�=EƏXhX����eV��|�O%��ψ�7m{a �����j:!��lX���_nړ�E�t�vT�м\\ֿ<�g���CB�w*�{��z*��ݧ� |�ͷ�>�{iEYaj\'UF:�uMU֭Ќ
䱴� �&���Y����A�?]�k���_ҙ�Q_���)`\\���c��@%�q�S��u�!jdUk��H�\"��W��m\000��A�����Q�B0�_3q����5탒:~\"�����φE�9����\'�aICv��k�$Q^�m��敂(���^��M����4TMٲ�tG;�W�.g�i*�-���|%�G�ͮSCe�VoA�����CM�%�:��M&�]Nס�i�P`���N�̨�������$<�S�6*I2��A��1��	��\"G��%G\0\"�J�Af���AT�@^�3 ҵ�6��P]t@�KI�Q��zS��cm9S�Y����
�1��^#�\"����\'D<��5�ƹ8�˒���Pkf}舞QG�&$�BM:�@��w���f.�eISuQ��I���qr�5��ǖ���f�%F4ܔ�<��\0�8^=��px�C�������+��8�@j�1�\"Ⴒ�N^�ܮ:��������
�ī��Q�~���F����K��1ajs�D���֖A2���g<�����P�$1��2ړ�9ӆ�N���$01)�`�;B��	�w���@�u��4���j|;�r�c�a�ӑ�Ծ���(��\0H�ǂ��ɱ`J���c$�L4X9:�Bk��s����-�7\'�����u�cs[<iMK=,L�d��)Ru���K
oDb����Q	�_��B�l�U\'
`�|c:
Y��B�=ڛ�yfP8�;��!��N��Q5�E���w(C�� L���/��|�:}���EBN\\H ��� �+]���Lw���^
��sp$�r�a\"v�Qd#���u�s+*�����Q-�rT�
�V2���/7=����TjM�ё�����h&H!>K@��X\"�^���.�F�>��O��l�
�8�0@Z`Vu
&��g�E\0V|�mdM�Pe9\0��;Lƣ\'a\0\'��:줋ʹ6��}����kGxy#�L�V�&,��2D��
v�␡:Yq�*�B�Zu0����G�����b���YWWA�\0qrtRt���Z�xp܏w�w�\0�Qe��5h�mfRI1�_C�#�B藙e�JR�����%x���?G�Z��g�a����S���y�8�ʲJ|N<j����x�ƹ��3�f63G%K�t0+��$q\\�t�r���8k�kݓ�0RЗ��Ns),`D(���*l$h�I������?��%r)䪀�c� �~�?�ݭU���\"I���q>���.Ь;����4O��3p���
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:cd3ce893-9c99-4332-bcc1-8ca0bfbbbb50\"
   xmpMM:InstanceID=\"xmp.iid:5d58e17e-846d-4e82-a632-8a71b7b1f92d\"
   xmpMM:OriginalDocumentID=\"xmp.did:a32b1634-ddb2-41d5-ae4c-278127b1f9cb\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1603714992254135\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:494b6aa7-893d-4716-8944-3daae8f1c248\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?> T�]\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�
1:m�\0\0 \0IDATx��i�,�q%x����Uo�B�\0�(����6�Y���f��|��8f���ͦ�G[k�R�jQ\\@�X�}x[UeF��g>��Yo ���C֞Y�����9���|�-<�M�=�c���ނ\"!\0�L�D@!\0�+@\0�a�bH&Z����	�� �b\"�I�c`;Ϛ�˞r2��R��2#�P�*�t2����@��ED�!4���$��٣={@�}�A����� !����ɇ]&qtA�/k���/v�\"�)2��`�r��e�bE�
e7)j6$Ofd@Qh��5A�@s3�d\0���\\KUXrϙn\"!	:�H�����(��֞>e������oF�����s��;}�����<���dmW�0ʌ&�3�� ���%�P�(Sf�QP�Q��(<��N�螌(������,M��i�e�nnɍF�
(b���6y��e�����a&��G�{�:�M�%�iy�?��͉��:
ڞr(aI&4\\J*$+XME�h����0�b�2͙u����a���}J6��\0k�VF�L\\�=�we?�������������|�fzJ��S�yҰ�Ø��9mNO�z���P�u*�+ţZ�C�)4�у��%��ъR4�@�b&���/�q��ǧ��h���`)�)@=�G�)\0�D��E5\"��3��s�:0LӼߟݾ}��wo�,���w������w�޽s���V��b���̆\\�\0��)�q�1�|r������<��ǿ���O>yz���\'\'>l�w��V��BkEg%%0Zi��Y[�*���=�~!bT�Q�~�\"DH
,��x(�\0AޏƀI�<ќQ�s����dGK�Z�/tqk�>|�w޹��wnܸ{����yL�5��y�ƔG���&e�|���~���CTٗ��t+v��B/����=v���7����鵧�z�����o>�̗�|7t���Y%�q6��b&k/�]�R�7W��>�?u�Y�R�jP{�$)	j�do�{j4\0
%�[ʌ�\"|��y�\"6L��L����[�����/���eww����2}+�TԺ=,���nf��~G�1� -�o�D�2�l���}��\"�����/?��o|������}�r��g��q�u�ZeTPR�4���L-���nq|��R������H�#ХGO�x���
�� ZJ�.no-��p2����������=��3�~�g���׾~�ڵP�k�i)�>jQ�2�g����(�}l���]���q����5h�G=R�>]���b�	-o1�JJ��x�ڕ��x���^y��7��ᛯ�z������z������PUkE�%j��$�4��_�X�DO�!D���	�4�}�-9� E�?�)�fKۭW�<�>z�o=��x���o=�����3���/}���ݻfv���^Q����x�u�����s-�~����G�E�b��%78�Ja	�2m��+�����o����^}����.g��J-�l�a�6�v��R�*�=�<����+�<��Ds\'�˙�Ab}�%#[�ё�e���٧G}��JQ��\'nN���T%�g������_x��\'�������>�ԗ&��n?�x2��\0��dR��<��O���A�4�b�h��I��i��<Ii���:��t�����_��/�X��D\\K����IC�̈R�y��y�lN�i�q>M%�Y�`ˀ���-ݽW�:�?l�~=�������!@T�6v��\"��ɜ�`�����QI̇���i����7/��GO�ο��?�W_�ֿ���j&��/;N��\"�~V݈�r�l�Q���(��ô����?�|��N�yK_���]���I#SU d@�{l�o�릡�n����?�я����Ϗ���Mb2�Fw�p3
3i�0�b)%�rȞdsٷ����6Hj���q�f{[����*,E���2: \0m6�(E
�Mrf\"�^�J9Ǯ���Ǳ~�郷vo����\'O���o���:�W�I�AK	0�{����(�T%����?ɞw�}X�ˬAڈ�n�����gFv��aP�#Ԍ���+u���A��mK1ّ��t�s�NH@ ��	,�
��Hy)����T�c��_|�g�������k�R-|�l�`(��f�)j����
��uB�gp�����
�R�J�C�)�z���T������}��}�{�7��^�i�+sG/���v������X��+��d
��PT�D��Z��sD��[:�lZ=�y�i����4���n������W^�����|�q� %f���j�^���(��z�,j>\"��O�<ZU�O��J�����먕��jCg��I�R#����)�eި^�������\'��W_z���$Y�8;�
���O
R�d,��3s�b��E�
�`
��Dq��!�evd���\'73	���tw��R�`5\"�Rj�=1)��͌D����V5�	7ʭW$�DUN�S\"��w�g��������Z���?���\'nε��[Ξ����.?8j�C3��֣�өZ��5T���d�.�eL�j���^#�����o���?�����KO�����i2��;,��Ĕ�\\n0xC��\"4X���X��Srg!͘�DI�k�fy;j��h�bͻ�8�
FXHQ]؞l)�i��V͠�{N.!jD�f>x�@(�{(r�dѺ-#it��	0cr7J��)���$K)���SA!�T�y�9xވ7��G��_me�����\"���Ir0�y�¨��yߚ����K�N���Q\"�ъ�1��
Jd���6����_}���}>��<v�Z�_��~̉���n�<u�\0V1��\0�z�^��YԈ��Nh�Y!/%���)��RS�E)s�K�
S��4Z� #FOQQ�k�T-mU�ѱ��ح���pp�D@\0T���Hn�f���y���܇�̽�3Ҭ�*�d)Yԩ^�q�λ�����o��\'�zs�NN�c>/�̓��4�Ò��J}�}��TB����=�ݬq�K5�$A��w�|�����~���A��-3�C�370���6)
�9�dJ��\"�2�s-�
E-��7O�џ#\"yG73�F;��$�S�@ZN�FTE+j�8B�\"���$i�0\"\"¥�nfm2\\��@6fw��*ɡ:���^L��ի�O7n=��Sf�Ο��wo~t���f�ӿ  ��K-�M�o�i��,aw���:���B��d��Ve�hvq������O�l��������R���u4�fߚ�׊
��*��&yo���P��V�L9:%��v�<�z1Oe�J��q�n�f��Zk)�~�\"�h-\'�s���LE͠�%_�W��\"d�$�R�yN)��k�\0`��g�T�d9! Q��D����b&�[ڌ������9�0$f]O�)�fg�����ɕ\'���ۓ�(
Z�`�F����8��E�[�[r&Ot�9��}1�\'�oo����_��ן8=݆.���.��TL�<�9+$U��Z;dM�������	:e�) ���\'�@��g��X֞V�f�S�dg�<�]���c ���D����h�EԺO��V�I�w�����7޹:ژ��jR�2b�%���F���f�# `r*\'���X�0c{�	s���0�&T�Q��̳�S佩*��CJFCs�l(QK���U���1+��aL9%O	B��g�s�`��.)jE/!����~���%�ZnCR�4	�\'�(%��8�HzK�����v#y��E�ƾ�$��F���8�\\��_��_������j�P��C�����@!%F����f�d�vU��A�C��2���H<�B��$�2U�R�:-}F]�=<V�_Gd�x���9*#�b$����_����O�
�5óDK)�!�
�b�I�$Ň�~c�!�4V+�e��S�ɐy�<��o���מ{q��T\\�P��i�(�Q����2qq��m\"��s9����4�m���FKd2�n�T�
�TU%HG��F��e>��EN���^�n��|���o������4�J4�q�v3!�|x�v���K} �`�`����hS&9�u��ݗ7��w�������Փ�|�mkfR6mr��I���2fUme,2�N:��s�u�f�Bmi!V��5Q��@\"}H�Eg�Dr�nC\"=Zӽ�vAE*PN6�م֯$��Gw7�h���p��i�Iq�8\"`!%��6�T�	�R
��̫���?�����=�u��#��:���|BtS���.�J}rn�/�II�������
�#P-��0EF��w_z��_|8�6Ƭ`�ѵI6:G���
�h:�Gs�?#�
ӝ�Ds�}�÷_��8׭g�w�u���&Yb�0\'�t�j�t�����1	(�����6�6((�j�)q#�E��e�f���z;��[��q��z�	R���{Hq�4\'%�Ԥ(l�?$����\"�mz5p*��^iF/t�3x���ͪk\0��l�C�B��~��?��|�j��lK�mT�b#�B������^��r�OPM> #��ٝ�gP����~��;�<�(�%g%D6��ÐS��a�d�	{�q�s8~a�����}�٘�fkZ �fɼ�f����R��0�5�v?�#�.����D���v�ܚ�D�0(ڽ֩���QK�成\\d�g�H\\0�U59NEʍٳ���6������Ͱ�q󣟿��W�?6>��b^O�si��-jEl�����h<~Ѿ��i<:��y��\0�c�����}r�u�=ĥjEzw�Ϭ6��)\\�Tm�����w���D��uޞn��m�,���/��3∯�>o�@���;.n�Q� {���ky�G�����q�A	�=Zz��{8=�\"X��S��_#Z�\\4�6��5��s�!��-HS��3h�ry�\\z�%7��h4���QeU,���l�W_|����O=]v�;�ٰݎ����8�
��̌���i��1��O3N�u��-ݽ�z�����>ji밈��{�c�M�H�}��%!J��\0����(�
�#��Omk�1u��Cf���E1_\\���3q2�u0n�����G��4=���e!L#x���#1�$gew����n[;z���%�Mh�O\\��u�eK�8�(j�[;���9X�Oq1�1����B�h�*,�j� �U���+�m#͐� �B~�����R3.jq�l��on������Q�Y��s�2����>?���ӧ��������\0U��w�}��+DN�7d�1�!+\'fS�Q�綡��`�
�^�@Z��u���\0ֲe�l)�ۨ\0�����Z%�pF�$Pj�m������$�3$:��kn��3�#|�\"�{������~����_�K�rZ�J���Z���O���S>͕A��D�G͊�]���h�\'w�Ra��>8�D\'y������v��7r�:Hr��SZ��)�������us�n]B�j��2J����AWM�վ��U�D[FX}ddVE�@���AE���v\0���!�{��퍸��	o�u��W��L1+]�|g*���2���D�m��O ��q�OR$t��Na�\\1���
EET�r���8??����������u;�t��@c0�T���_v}�w
~��Ǧ������$��яY��i�T*�V�8̓b��۷7Όj�T���kؚ|����r���}=`�Z���wH�,��%2�?��lj��.��в������mM��?a͖K!���q|�x��h-wzS���
��A��yV�a|k�͑�>~M��0���EI�Hiݦ󋋻w�e��Ty\\z.����ܧcמc��������{b�~?�cm�#n�Z�ǒ����~ރv2��JN��I�o�~�g/<ɲ�������B��5aQ�;�P4(�F3��������hMǩ��\\��SJ�7��E�Fo٨���;�����C�����j�$0�!��B����&�o.x��]�)\0mE�ǸYrK���`s�j�=�(��QCDP,�Џ<�<�V5Pz�`�+[{,�ӌ)n��}㵓�{淿m9ՈhL�Ì�o~T�}��#�����kB=\"=t��\\�gS��4�K������w�`r��P���Oj-gg�[7�Q�lRRq�0���MNt0��:?P�[@�4z;丌�@�Z��o�1K�DK��a���
R�7���	��2Ł˶x/����+�,u:�%��0����c��uNC.\\}�@!�U��R
���ɭ��좞_���ٍ��{ܖ)��NfQ��i�Ҋ��_{��tNB��[(��s+9�=�\'zf�t�%���47�co��զ�lu�m���>Ͱ�[�D
sv�4iT����w*�僥lMO��c�.3���nh;{RU�(!3[
/�|?[���z��j��G�I�-3͌cT�e>�}���������2��ZW}��ԝWb�5-|�>����s��iF�T��:7kz-�f�C.�g[ώ�jDk��t����#}S�t�ʢ��.3ƶ�q��X��m�H���j�v�%�\0K0�������׵ߌU�@{��͓�X$�\0�}����vw.v5R7��~��{{ڝ�f#�eyV���.^(>|���l���rm$�w�XW_��p��z<����y��U��M���dV��s�z�8u���{wn�w�T��6:3�Q���	\\�� ���ܹ��MRD53O�_>��#m�1�f$�0W�!Y�)b���=1
��&�X�L���LJ�ѳ
#�Ne��2�DN��%��,;�2�\\�@�w��Ȕ�̖��)FЗ)E�hFΡ�5J��{=�j\0,b��Uqݮ�@�2�8��j���Y�!!�`�P-�N�cVb,����΃ʹ��фƥ�+� !�U�:B�`�e���q1�&��>��������|��Z�]-S$;ԡ}>��V�B1�x�Vt?���`��r\0ko��F�=��;�2ըe.Ӵ�ZZ�>�!\'fg�H����$`}C�3�%R[w�7[X�G�Q��@`v36�~�;~�7N����:���d߭���K�V��-�ݻ��0vӞ�ۭ���s�:X�,Ǎg�&�o�&�E�v������M=��i7Y�G��H)�ˀ�V�e�|���/0��58%j�y����R�D7��L]Lt��������@��\0�`i�-F�Pu�U�ڐ��(��8G�ׇ���3Fam얠�Jۏ��:@�C���n�&6�sJ�ɚK*A�39j�m;��濰�ږ((3��R��+���GZ�S�h��������6H0�B�ݾ�)�呋�\\M��Kf���ۯa���i�\'�v4��JjÑP �~��1Čkt�[��퉲�9:����Qk�og�4�5��֊�{�h+�V��%���G�}��䴤�8��j��<���=����o�e}h���6�O<eѨ&�l���(��Kkv�X��c��I̩�y�\"��=k��A�Y��/P�6se6[�?*k�<�LG_2\'#\"j��Rd	���ou���co���c!{�*B2cj�6�V@n;����V[/^I�u�t�SH�\\PjmD�O�f�d�er�����yE��P3�=�껅U����0�F�Gh���\'A��y�/5�h�����.;�
�K�G,b-R87O���÷,�T8�1l�N�3��֎xñ=�Q��ㅀ�u���hsT.�AP%bY`��xo\"�V5#�~��k��k�L��6�RfU
E_&�wm.��aZ��22⒐DLR=4IGi�Z��VZ`/<�V��O�$TC�%P�j����fZڟ���xr�t��8��e��<���_2u��͛󄵃��V�*b?Ms���,:%6B$-�����gw�ݽ�\'�F���xIB�Y��h����.҅O������Uw���SN��������]O��<#�ֻ�xΎX������
�a����N�R��gdˣZ����t��@=`�:l��*Y��^>/O�xw�j򳤤�j\'ť�EH�n�0�u.󔳏��0��~���}�i��D����6�-��+�u_3�ȷ�9-���n���q�9�<P*�ô���G���pI����_A��0b����(�R$Ԩ��y��n�<۸�\\Q��h�������#������tהeѷa�ݸ��7�`W�$�@��D�*�7�\0	����}o���7�}7��X��5����y��v3Þ]�
Q$Y�{##O���~������J<��^͗FU�ԗ�~0�q%bf��;&ơ�3������&���vVn[_����a�ݗ�(�g���Yq��\"]b�q4u���&3%�6�BY8�r�\"�L9�j�B�M�sE0�q�^E�?��=�h��L�yveZUeQ��^��F�]�q�?���ڼQ����ͯ�G�`���g��r�g\'�ggg�v�ĉj4��Ƒ���*��ό˞������hЈ:����g琇JtXj2��M�P��u�p�E�<����O����A�5�]i��V�B�<
�\0ʐr *�\"9g�l$�BNC%���ƣ\\@M��5������91�}�(9��`��N��C�\0�@�Ȁ�oGz������r_��mX1����a��L��X2u�������������ET*�{.��NY��?�
��>Ca
�sF5���!���\0��魚S������ɰo!C0������jꪆ|�H�4�0��6ukmצ2�A	�d��ǠSU`bGD@f�B��`0�<o���c�\0��!�S$9��Iu��gb5Qb֜P��DLHf�j*&2�y����,�䨒�@̒��Q��$H$��@��i�y�j�7[������%d2��DQ��)]!0=�D�y��;�o�0�fnAB�!����SX���Bq;#ӫ�6{�H�K�<�z�	j� ��wK�������(P:VD1K9G3B�ª����63&��Tb6Ø2f\0��G��bɡ,�iQT��ٗ>+)�s�;vdI@!E`��rP
]�
{L�mA��m7�qz�	����x�)��ԁ��a�;O�	�����ف
���!66h�ﶭa�R�����/��`���\0���n��H�\0����!��R�����TŌ]�����2�9� ��S;�
fU\0F
��A@�ه��U��u��q����.���Cf������-��zT�m��!�v��l� `p��Qi�m���3��U�����A�H�3*��P!@Ffd�D���б\'�d��D$�(H��9���ݠ��G[0+�:��
�� v��q�
�Q�eg�PY������{�\0�.��\0\0 \0IDAT6�3�;<ڑmKa\0�ҮA 0�ǔ�q
�hr������DU%kΒRJYDŒ�ac���f7,7�1O��̕a\"l��������}�٫��o���Zƞ ��*�s΁�e�/j��g�-��j���*��rEp�`�����=\0�V�A�mKL�J���ݬ�}�>=~�G߿{��dg\"��8�.I2\\��.�\"3�P9@bL-u1��}n�����Q�#풡�5c(M����z�u���P�/��r��Y��֫%�u�;��a�7��*¬.f��TX�c0�A�f ��c�nPj��H
�P�F�шu���f�`��B��V\'AoΔ� �Ȏ�s>p(�y�:��5����ڜ\"�2�bݢ�C`�\0��d�F8��u_�$g5�;�}	m�<?�����Գ�|��6ݨ\"���%ɿS���Z�gtb�-���	���|�ރ/W�EF�W�\'���ݝYۃ��$���6��/��?}tz�E�\\��[��*�4gP�.c��E�eUM�2+t]�R������;&\'YS���*D��E@�l�sQ��{tr�X^��c0�=����pm��K�ˢ>09���!�ֆP�nF1�1�c�Hn�|D�l	�i�(�b9+�a61tʝ`@Q�jYm��f?��t��`@gl6k��C�M[0ǌ�@cp�S�*�T
.���޹��=�Pz���!ľ]_�ͺ	>�ӳ�x�h��� ���A�٣CGƦf�.�
��=_��8R5Z��\\��˶�H>%;�j1����Ռ��yɒsff&ʦ��.�9x.<3�cJ��ܖu�M�3ifM�3��u{[�^6>i�����bF�v�B�f�(�\'��Q�$I,%pQ�O��)� 9�C��\"���;��1�dR;��w����\0H��M�I=��$�
�\0���@D�o7�z�Եs9ޜ6�n���J�\'+xQ�L̏��������G���^�f�,����ž����/;-}M�J�pŴ髊�@&l����+م����>y�8mӊ��*�1���hyo�?k��9�\\����>Zo6)뺷U?�ѳ�)�z��1����k7]j����3�&M�n��z����e���|g��\"�H���2Rb���dDF+=myr8��.5�&f\"�KND�H�S^�6Y���\'m�tI�,1Y48_u�(C�������}0��CSe�̚jog�K}�)�eA*}���>��$��v�EU�gz~��MM
τr�浵�,���oT�,�
]�;HxڀmT�$s�O���yWA~�����gq3��l\03�2y�J��_P}�s�0T�dgn���-��±8W������ڎ<}�9[T��Ok+�Z.ڮk���*�(�?~��Ѧ�\'��k�oTUY��lR���.�
b�؛��3t)�1�{�|�����=9;�`��Ӧmױ���2E��xثݬtNi�
0�,�\0Ά0�~�_�.!Z[2�V�~ń
�T�/X��c�+�(~Q�=ВpD�
#�(gS�l�Ϸ�*d��u�nw6;�����r��Ӟ������4@������[�{����|wg�=K��rLIM�����b��=��e��t�U5v����1S=�@	��g1�v�YoڸZ;��N���Wռ��U1�¤����n����|��q��$��%�ܧE�h�-��I61�����&�>J�`1k�9�2����wl�(+���d6��g�b�w�I6dg�C5��TPY�T��HeiĊ.��}�]�(m̛^�(�?9;y�7�MųS��s�`��pp��`�^t�~QU�Ee�5|��;X:_-�71��b-�KS֖L=h�	�rG)q��$sᦍ�,�2�\"W��u}mg�^o�6u]��޻�]�0�.i�U������컻�BR�oכ��hnu�>],��b��ج��&Iώw�}��r�X�/6�j�{��9%�q:�\'u�\'M=�M��!����4v����?�C1o�����l2+��`�M�p<�)#�
!�a�\'do�]}�.�b�.�q����W듋�Ŧ��QUvf�z2ݹ�z��<]\\���\'���K�&2�\'�ɴ���wMS�\'��lZ8f@W��č@S�	%�X�$b�%�v��6�ޯ��_��+���7^�=~���������y�
����:?gr�I����eL\"1�$��/�]��{�,�?o��P1>��������GG�\\O\0BA�eBA�4����5:6D/�^�sa�]\"~c�}]=�O5����9[S��%tE��C�*Q�T��\"`�V�8}�Y��N,E�����{��ݛ���&L��I�\0u�&����t6]����L���ko��Z�lN�?�9:�g;�>?9��w�ܺ��k����������˿�7����f���y���ãk�G����/���:�������OESO��g�u�|�YrL)g	��
��o�����/�a+����ݗ����o�W�>g
~�LW\'\'��(��{*ꨰ颊T��yt&������n\"ߺ~���oT�Trz����G��W��O��G�/ݺy����u�M2\0P��l���u�t1��6��Oϳ��[��t}wZQ�\\����(RۮWK�!9d�YA�����̯o���W{��3��W�j�~�\'�n�+�0�)���uB�)/WdK�h�k������lr�����g�x�8����u���^��+/�<m�r_b���[/7);��{6�֯O=�U�����k�\'���aw|��~��������Y�{�z��[7���y��I������.���7n�
U.�;����\'1aNڮ�m��&7a2��	�P@�����㩪-W�O����~p�����ژ?=~�����>;>{h��M������b�|JL���<=)�%��EL��7�;�Z�BY߿w��?�S�8;{����}�ك���ǟ>������� ����lc2�ܬ�=9���ɢ�{��|�ַn_?���W�$7��.�3*8`Ĭ��1gن���?�J��eK�{�.��\0_:�:�Б�KÐ��/k+.,+��wul���{��[���p���7����_���d�L&�s�E5q{a�ӭW\'��Q�m��]�йFd}v�	_{�[/߼qzr��G�J�f���,�b<y������W_�~�8�~�<��nIlZ���wU=�(�b�\"���a�\'�dq����޸qkg���V��z�X��כ����O]�����;�y�`�������>>~z~���$���э�������=z�ӟ��n�D�߾�A�Ǫ,���oW���k��Ph���ӯ�2��6�4���;����ww�ܼ�\'?��\'�<���)���>6 WT�j��|Hf+K�kY�r���{�^.m�\"�ڶ�uCuXeɡ7$QRB�TA�k�f��b�<�����k��,��?��s�)2��*�M3��L���ӊ�,<��e�\"ɕ�kM���^�V�8y80AA
޵�6�)����U]U�W�����D�qX],�oo�M���l�|1�Ύ^}��pg�>}���bq�X,NNϤ�އ�]�d�XM�@ؖ���k���@��D������7+���I�W�z����\"�� ���,7H�\'�NQ�@$R{���׋��mS�u�W5�|��߼���w��1H�<���k7��$�����Yb��7����o�������Q5��)�+_�lg�ܽI$Z;_)���fg��ޫ{�oĦ���\0=�f����/��%f�z��J]�������sԁ�]e�rۈ�EgE]��D���Nq�\'2˹`�=,�=E��Yy�h��7^o��n����#��t�3*��<C(h��)�,cb�s��&%UEMY����i<}�I�G;���@{M�7�\\�6]ߗ���I1�8��Ƨ�^�IS��Z�\\06�PWu�KͶZu��¤�̄p�4����ݭ\'��<z����\'\'O����J���^�[����w��\"���{�vt�D9���7n����#�_���{�qz|�p�`>�GD���!x���\\��?(&�_��]��͡jf{�G���+��;>~���??�v@��db3G��I�GG�wn��ْ�UM�H��*:29�d�?\0�
�qΚ�ʖ5ה����KU�!߁�*�A`BG2��ʺ��ܬn��D
g��(��)Ŭ슦����j��j2se���$i:k��4�sl%�n�ү�~�1t��d:�YS�Ť,ڔ�}��lv�6��.�_��\"�
��֟~�ᓏ>�L��_y�_�����Og �]���5:�fR�]�=�v�by�O?�e��U�\0`o:O.���i�*�ݬ���׻�^�����Y���$_�U���3k��cSzG��n���,H΅\"�����}�,9�� ��:��tZ�����/ݙ�&���˪��PG;��ÆX�7��۷W��,��Ҩ�ǁc.\0|Iy�{��8;��+�o�F��L���}Շ�	S$n3��MSi��,�e��Z��m0*��R�gMq���/�����ַ;���\"�p�ix
��2�5��Ft1��(�\0AS�./���Λ�~뭷޸w�\0,g˩�^�w�Gb2`7��7���ι�)�9�1\"8����;_ٛ�h��U�m��?\\Y���,P�z���+��疪=k��\'�N01RU��!�!�`�I�#�h{��Q�8�9�;��������lNN����)^�)`]�:4v�%�8�u��#��J���ݵ\0W(��G=�X6�������|��/�����|�[�fME�BB6����I���F�z�\\�z���;o�ۋ��Ο>��;�m���:\'F6G�)3C�o��¥�Rv���1����e��P��yn꠆���5\"���
m��6F���IU����<8������_�\'��ƭ[}�n�s�
TMѲ�C�!������#��9+\0���W�bԉ%3(ˣ��}�����W�����������7�f��&�BL�{v>z0���P ;�ܟ~ﻏ?}O��O����w��+L�M�Q�FȄ@D+ݝB�C�j��eդ�3
���D�f���ThT�

w����&�	
(0��\0;W���!`ۧ���Ib�1Ƭ���`B��������꽿���y���l�$V<iFС�0T���hf1��wg;�u��ko�]�����Ӌ�:Jh\\+@EElQ��O�x��G�M��JNa@��} v�l��^) y�B	����)�\"9_q�\\�>��g?����ٝ���	$�
�%\014tF�J�خu]=Zw�P����7I(��z�����LMQu@���i���K��ڞ��z:���	8F�k��������CT�>K�.#g Q�d�$�C�ᕜ�S9�\\�)�9F�޸�������y-=�\0\0 \0IDAT����_�%k<ܛ_���;mj�d��4�I�h�1��>i�ŀ`�٬�����������>y��<:n��?�Λ�y���Q^-4uB��
f�Dߚ���@I�Bٔe�
lhW_Ng�qs�� ��~>�pX��UzY�_`���s�������
XvE�&}l#qUVPձ?O@����xJdƄ�[K�r���rށ���l�Y,E&TI���������fݶ�����b�����!�C⬖RN9�e&r�L$�do�&5��;#Q��ه�4uL�LČΑsF�DC�@��1¬*V��*�6���[��ݙ��7�7���[��~w��߼vpxp���1nQTA���A��}��{_u���\0\"������o���CI��k�^�}әP����d�9��B�i���&�
H.8�`�#W��y��fB@@ 3&1IٔК2�/�@���Bb\"�F\"�%�Y����fٶ�t�D��o�����`��3�\"��l����aώ��7�`~���%���f�r��z�q�7�|�����{?���u7�;�}�����Is��.
���R�ِ�LDɹ�����>==={r|r����ǋ��;�o����k�ٴ[�Rl�� 6�VՀI�:q57����K9=K���;2� 	�7����q[�v��>��#^��
_!���1n�|�C z��9@�&���0�!-\0A@;Bf�W���^Z\'+����������7���z�Y�������/7�n�{x�eY�����`�
�#�Y,^�^h�	�5�.5�v���+�~W����K�E���
đ�뙜s�,m�!F�l�f2` #ڔ�!)LLā�JCX0�)�0b�D�,��s�u]�Z�NO�.�N4��t:۩C�W+�P7�c���آ�1�Ɛ�����82BdD25�JrK���JG�b3��k{eQ�Yc����IՌXUc�
8D)��@b�|Q��d2��g���i��ݨ���b*f@�lh��P�f�hܣ���B.�f���i��qd�99�b�Gn�6y�s���}�9#3>�}}A��V��AT4cNʽi�����N�EVR#3!�`óf�+���d`h��
N@�̶�p&�JD4�=�Yɂ��XO��t�ެs�>n��-+�͚��Lk.co��y����\" ����p�`ǎ%���:&���T@h˪2��P2l[��8�:W�\\O��I�r�\0�9@FCT����]y��Ò���l�_������Q�d�r\'�G�pU�/X�P�e�����\0�JܾD�8��hL�1UI�ES�]�M�u�f�-�����r�\\..���ڵ����YYz�g��Hv�y�w��@�!R�!dH�!���c�
���m�����hU#R����G�����f�S���_�6���j�Z��.Ƅ.��ܸu��`�92��GcF#�#����
�7��dC�9���λP!���v�N}\'9�d�(�Z֍C\0�te��O�6���r�vE,�9e�;�0��x�W+\\�./�������)���jFSQͪ�(#%�V�5�ɫ��P�#��\\&v�
#�:b�i��}+���@��
��^�/L(A���W�`K4EDbCʆ�w�����j�8��rJ����q+�����C�fYr�)�$9�s�>ۺ����|�v-r���f�`�l�F!��Gݛ=�u�w��vν�Y+\0.EJ�$Ka�=����DO�����4��=cw�-��d��Hq(PKf�{���y87���(rȎ��
� ��y��o�-\0L�R\'\"���΍��`�O&`�\0k�<���)��\0w@a&Q�x�XƨS�)��5����D��0��U=@șER���U$�}\04��%�N���\0kN\'�����E�M�c`E�
��+��$Q���\0�PЉb�G����+������ge�ϣ��\\s������l�6k��gsq\0�f��vS���;u���D�[Dy���Z<1D���ꥺ�G72�Zt��jt]^�V�w+����$q�Db\"Dn�Jww/��H�,,���K0�\01���0\'��}�VA�k������I6��z�aqpt���X��!QZ,V)/$c�u�����A��Pk�Yބ�,@	��G�$R1����\"=��Axm6�$FF�Pp@jO�ux����ϥ���>��@;q;�e�4��q�{3 ����@�hv?k6�sE�\\�po��&�-4�X(3G��8�e{�r�Nꎹ��Jh�$V\'�\"B�A�X%b� 3K8���6-�J���C15\'&��/�������x�\\�$D�Rt���z�����.���д=���\'����)q��\0�nR��T���2fafj�`����Yj��W�c��v���砘B�%
�O�So%t@�L{�fA��E�(@#���k��9�!���(�+�Ťqz�OO/��bĒ�<�Z�������f�Є�Z�}
�8���f��N�<pvguw��/ި���H�q����z6n�o	�c���,�,�qΦD�6����q!6b�?y�g�b�U&wp
s�y�6)e��a�� 8�5�����	%>���r=��S|���^�e������1���y�;�0�˽=`�P�eх&z��������w������g��`ѓ�+��Z��B\0y��l��d��Ӡ��HО��j�2�0��9�����%&pw���Ќ��{�{��=��i����e�}6�E������Y���������$uY$IJ(	��L�������̶���g�=~���v}}pp������k�03������NӰޘ�iQD��[D�J��	�� ��K2���1U
w�D�s���0G��#6��v�;JMC���#	�0��~e���
fV�8�Y�}\')!��x�vnd\0Q�5�
@�,�RJf�ݪ�E!���2MSJ��A$�(Z݃Sץ%\'1��=���
��@t@l��Yݠ�;�7�z��H�yS�cDtD27sC�R�8��4�\"��y\' 	�ܧ���>3�[
DA0���\'W����X�H���l����j��_�5�adN���� �o�,�z�\0G�����m������Q ��T��1���eL�N���߿������/љ�4�q3���e�|�U�xv����, !�`�n
�D�B�(D���Pm��AJ�88��kl���4�a�q��NĪV5�I(%u��d\"i�\0����%N�\0��
i�Zc�	KN��i�8��>�Lu}���p��KJL�DH\"�p���BE��7U�f@DĎ�Q���{8a㘀�c
\'�00���eb9��$�T}��e���`4Ft
\0/j�eQ!AS�CqD�,Dj6��8���VE�,\"`���]G��\"�%�H ���\'���ȥ#ĸ[<�YX�7�\'@J9/z�)\"�Er��@$�q���X��\0ĝ�9<#X��oU\"!Ŭ^C�`�HmD2�D��yx8��*V�X&īq��ʓ�g=@I`��)@\"�N����˟u����oO���WWl�$	�cGi�\0������T�h��у����f$A�Ե�q�=�
/��?��������a���q{Gr�\0�LDf�S
�G��fP�9����
Q�&������wo��t�4Me�]ʒ��A��Ǜ�˟��?ݻ{��w�sg<O�v<�9L?+6�����W?��ψQ2o�[�h�`j��hcOst�LL��M��ʴ�e���Eƺ�B����gg�}�7��ُ/���d�%���a=��\\U1���4���������p:>�e]�H�3*�y��<�E��3�sCj`jPJ�U��
��7s\\�@q�Y�2,Z�3��\0nPT�AP��S�1b�/7�{�c����|g�KL������?$z���V��r�����Hs��\0&�fzq���y����4 ��Ў_�<fi��Pw����N��MZ8��Q	��S8��11`�krL\0�%��\'p�Iד
��9w�E([��;/d�
�3�t��\\��^�����ںa&��v�I8\'&���a\0�eNeز�J��X��\']\'��fs}������˧WgO��_L۱n���ڇ�.��:4%G۱�p�yŭEb\08a\0! � ��E��y`ͳk�����$��l  ��l6�dV�\0\0 \0IDAT۪e�Z.�Qx�2\\�4n�h!!
KJ)\' �ĜsUS\"� �Z�2311@-��LV������[�s�BDM��=��z��x�����������F�a^.��5e���Đ|\'��0��,�~Q\0���RW#>|��[������/�g�VBn�N9uJ�T]T��^�o��M�I��D�\0��Pp�c���N�6A`P�Ļ�b�ȟ�ǣ�柘�HV�i,���٭��Z`�y��:&���JZ6Ϟ�����G]�=�x����Cum;�U����{�S��P͢|�B̈́=t��Or������(\\]U����Z�!�\"����Z�7�0�\0kj�eR\'�p3MC-�
)5^.��S�������1zI�)�B+6)\"X_� �%r���N�E:Hm�ӨE�0�mV��3���ł�Y�ܶ��ӳ3U==9�r�pU��0F��Vg�ܶ>k��M�ܫ:�L\"�Q�
}�Xt]b�/5Z�D�a�3#�!����[��T` >?{��;<|�(�F.�j�zIBL��1��da:J��t������Ͽ\0�?Y�Cg�n�ksO\"9��hh>��m�f����Fm9KH�����B�uۯw��.J/V��O��>y�޻���G�3]>_fY��ǡl֡e%Y����e9���Zk
��*��1m�����, �=��k��-��f||v��ძˋ�A��w�����.e&N)��BT�6�f=��A��a��A��Y�v��5�R�T+e��037SpkK�i��i�0N��S��4FD��0/C��qm�}!��)<���=v|yp�p�\0s4\'V�2{rv~������;<v`���@ \"$a F�2\\����~i������ۧg/|���^\\C�+Q�w��n��̑�`���6*�U��@�H>3Jg���Y�q��Jfl.�������x��R�?[e^�t$\\���b@�����X���[��*s��cL������pFS
���̣(��S�3��	{:��z�)��������Yb���:�s&\0/e��0p�X���9<>��f���bypx����Z�b���h�єQ4���ֹ	@�5�C�8�\0��ZE�c��Ο��?e�w��=9:\\.W�EA��N��&.��l�e�l}��8�;r
xqwd$$
&��䌳]�����_�?���w|�!l�CI�8�P5�
�z�t��ZE�e��<y����,�㣣�r�,��ת~rt�R�A_�w���???�;>>>8<\\��4�y���|���\0T��CS�Z�b��H��ؐNa���P3���l\'͋�f�Ο]�Ee�3%@�\0oJ��an8k�*!�C�@&\",� 
�n7[�9��V˃.WՏ�|�����g�~�[_{�[G/�|��=Z-�R�Jq��ѱ����pI�>�)32�P�7���=�����Z|*�晤kj0�wp��r���G�4G넚Z!�b���7\\�&�Ta��$j?�Т��bW\'����@��Q�3#�RQw��׳�1���<C���bT�MY!KvS�Z�t�\\�9\\^\\�:��\'/���ѽ��;wO�_~��׾�->>q������?:9��S�����\'����z���GO�>�Zk-}���k���Y��E��r}%Y�����������z=]_�D����]���@�EӰ���1�N6*8�L6�����Z�(e8�2wXP��q����	DC�	us�f��%�������~v�^��w^�˿��ꫫ._�E�� I�r�e��գm�{�����L���3�\"�Zck
���#��U\'\'��e��fPb	�6�h�r�i�ϴc�V�F8�AꎁfռbX�,#Yc�����܋���쭧����o�����7��/��^O�v�,%Hِ<\"K><XLժڞ*ߦ��W���|*z9��G@Z��f����g�3̧\"g��=\'�v�|�{��6�؍ɀ�q�ã1��8D\0:8Fk��B
�-�Fm` MZ����0\0	:���S��7r#Ml	cF[b�P�yL�Hh�:�hc1뗫W�n���wo<��;��x�[?�˯�;�;���x�0(r��Q\0&B�3�.���~!�����V	���K�6ӕ# �(�ISh�h��A\0��ț�*��b�X7��uh���5��Z�C�\"̣�S R�Z
2�\0b�y\0y��h��-�������njf}��aX��vsz���ɝ�rե.����R��=udHmH5]�fcf��0�ggs[���p�]�9qN�D��M�4N㦪��H� �`�$wIͼjB�(��G0�{�F�G�)�c��h
jP�
��f��n��/��?����_����G���G/��+.Rׁ��(�yل1|Ϛ����iW��/�2g��Ä&E뾓BF�]�0\01	K��]���,@�[��VP�lޟ�<h���~1
�0�f�>a\'�IJ��$�L�k�����E��3�L̄܄� 1�p۱�0%&&���P�yGq����H��j�)�Ų_,��1��$DY��rqt�8:�W���SΜ8J-øơ���a�-�j���#�i-����D������Uw�0wm�VQ̊j1��\0��z[>:{�����))��;A�@BF�vb ���S�s�JD3~������̝	�����ۀ��Z�1�>��c��E>腦������_��/������K@�ɝ ܬ���\\�V���ceq����a�w���h��;���Pw	rƠ�_g$.	�M���u�s�g5�Hʜni>\'H�����	�*�#3f�rN}b%uB��a��A�mJ�Ȁؘ>���25��ަ������91\'D�7/U��h80�g��8`\09\'
� �D�%�e���E��K�r �{�e6��z�^o6�q(<ܠIy�aU4g23��M��\"� ̽�����P�jZT�����rR<{~y���W��B�P!�=+��1ϟx�l�	��e��x�Z�[��#԰@ ��t��4��0���eۡ�=X�$?xv��r}��w��_�{�(�:��<8��7:m�B\"$\'�d��X\0�Ţ���/~[���ƺ�T�\'��[�O{z�,A�\'�c���C�5�\"hV�ǔ��)���;a7a����b�����F��Z��$-U�,����;\0�j���7��Z�4�����j-��R�Y�P���܄~�-�I�9��O�4��f�^o�6��as=M�j�0�0pWpm��mmھZ��c�&#�֤�[�/jS��S�믷����=|��j�6\0��Y`�4�DDL�my�&��Q�m�{O����mȀ��pM�y�aՄ��P������\'g|����.����
�!\\�p\'��R�P��Z��xq聾��>��Yn!�l�?��\0�<J�c��Zk����1I^��a�����Y0!IGI2!RD��|Y�J�N����-��Jum�40�>��˃�rJy&�C\0�p�$j#\0�y��\"2)���T��:Mc��:MZk��l&-5�1��KǾ���Po��ꡭ�-��Z�p ��\"�d��������\'���H�0Ik�����Nd��ߊH�\'_��̜R����\'��\\06Ivaw�q���#�nsu�p=<���?��k���w��;�����܅+�4M�&)\'����A��3hK���я�}�\0E\0�y	�-����a�V�NS)��.��̀�6Y������ay��y)c\'lj�M�;�0��� �M�P �{Ω��]ݫ�c܁���b�/V�î�Y�
�#�����_��������������^y����V4O9eFA�Od�O���u�z��5!�v��[c�g]�բj���F}\'�\\��q\"��r%��fSÚ�=1s��[_�>��;�Զ��6=c�,JL\"�����u�U͐(I���S�Y��GU%�&�S�9 ��y��hFx�R�����,�:��n�ьD ��
�Չ��,H���I����G�oA���hvO؟j�ԉ��!��℈�&����j�`��^�J)��ƴnx�L��c�I�c��6c9����ɳgW��脻
�1c��S�\"C����n�����+xa�C�<Ϟ�?A���)���1�\'�B?���5�4�������֝�\0�[�d n����4ME�4�V��Qh6�զXR�@`��ԩn�c��A^8<�NZ���ѥ�.�����%j;�6�3%v���� ��T�]���4�R�tsyi
�������y6D(@�Qݚ��������ǐ�j���<��龊�y	�ۣOSUq�R��
�������(_�I�0{D  �;�L=@Gn�����v�fP�:M�j:��%�D�%��:!��n}~���LFɑ�yt�s�U������\"���k>�7	�v���k�Vh !E��B�
%!ϩ9=���	��HꜼ������[�Ӫb��do�[e�nhana;��f�8���[5+u��Z�iJiTvdj3NIs�Ϳ.��m�[��q-� �̪������v7bwnOO=2�iK$��\0��)Jv�܌}�j�������9������?����B|AI3�Q�>56��__��-��o�ש�-W;��v��	����Ǉk��(�&&�* c���~�������d
�9����������_r�����w1�9�vlS����^V����Ā��\"��C��N�3�B\0��Dm
��
 �� B$
�IչUh�=��S0��@��E��%�9�D�<C
]5]/:�����J�@��Y�ϋ�:��\'��(V��q1[�W�,	\0�c.�<�T&G3LD
��S��jx�_�K可ej����t@�E
 �\0Y���)˜�%�%I6SB>M��2MS v�Zt��k�׬�l��?���|�\\��QP T�٪�x���+��i�ld��Y�ڰ�
!�p��)D7O���K�_H����Z���M?��C�͹&��I4e?��7�c�10M10������,��.�����Ƿ�����eV$ ̪����]���b۹�S�2߃�=B��ж�=�߀�u���F@��=gہ�xX�)^�.��t�5���T��5Y�=C��d5p15����3#�1��o��8(��*��u6�2QdB1f&��)~}�B�ϿB��՗Fe_�|p�:��͒???�!W\0 �\"q�!&S\0��1#62QKYϗ���?�����~|,�����Z����[����+�������v��Ev0�财S��MN}*DuMh��������p�����3�_ϣ�I�hX�HlȆ�D��F�ȿ̼�=�0�BZ]� %�ӂH�B(H˺W�S�חKS��0�\'��光�{l�D�Fw��O)�df\"�e� �ۏ���H^Օѫ�%�(\\��v������o�??�K�S�l,jbh������0�ug7��:�V���|&$��b�ꤾe4�W��Y��4b��RJv���Ȣ��Y�h2!�\0$10	��ā��1�1\0���fe��x�N>_�	��pHa���IP�/ϖ����KmL�(u��kmu5��񈐘9�i*ٳ8+�DDF�UuNծy��v���������5+a8I6�f
$���>�yt�&��ۓsLݰ���]����ID��쮿18�e�-Md����5�y�O=��FY4eMIQ�؀�lN钮�_N�\"b*811������vXV��Υ��IR�\"��o
�@hHHdDFT�`^�Sb���T!��������-�0M�t:M1���T��t
�.��d�
�s����Ƿ�~{_�!N�i����\0����h�7�(�P��4<�$rK�����bG\\*�B������j�ŧ�ur�]���QO\"
!t���c�0 Ɛ
�.�VN������fHr��tYMrb$��
*�d�e:�E��f�+��z���df&<�\05�kJ!�����ش�(�����Z���2����<������������㒯� 
 �-�D�Ps��D���{�g�k��_!����`��:���g�0��%jR�5�Z���׀��[���\0�
�
���)rx��y�)���o?!\0ֲ*}Cm�����K9b�b�L(N��+�.�����
��V����s����>���~|��v�y^.2�Vi�u}���5cz�����m0�6Զ�A��W�9o�O*V��*���� �AΫ[,�1Q�Դq�ְۍTZgP��t���J1lJ_N(�jKaj����6�u��+�CM���)��O_BLY���(1s�N1���j7��6�IMs�9g1a��i:�� 	NStxUE�d�9a&*�o������u����oo���yMBx��˜*�B�0b��1e��;*:��a�߆�ޢ�6f:�{�}���\0
�-䶮A��m�*��8�!֞���o�\"�,I>Η���S�lu�Uc��o����N�s2D�@�!�-�$\"�/��	M������A �\0��C�B�QLl$�̯��Ή6T�:�*b��\"�(̋|\\���˟�?������u��//��T�E|�N�K`\\!��Xb��k���aBm�/c���yۦ��N�}`���ME:h�_�K�+i�|/]�[�D]5�P{]ڞ�~�M�m�\'�zִ��7��D��-��y\"s�{FT�N A\\�;�@1Ɉ�]���$`Td��PE4\'ɑ����G��Yf&)eS%İ^hf
�612��t`$����B6P+|<�);��j�������?.��>Η��!DCNY�������Q	�����N%:f0�oI����/Wm<�>�7��6@���
�Y�_��@ۇ�y���~��n64k���]��^hG��ٽ�(��������.`����I����r�N/\'F3�����Dܭ��ib�b$���QcE3�4��4��<_����z�n(�z�M;�ILL�#fa���v��光��A���\0@fd���R�%��2��|��������e��%C`�`y�}��W?���븺0ݎG��#8��W�#n��]\"\\S�>�7:��M�-	�}<REd����ǣ�~��1A�����BnoX���D�Xv:�͌,�Z&\"E�f�9D�����%�o�s���&��LCH(j��5KA�>�ލ�9�iΚ� �d�I���Ʌ��6�(�J.	��f\"��X,���\0��h��Đ�>��}��~������9+�q0.
m���p��P�J	ۛ�J��v[�Ly�!+�3����%�x�M.���1�k�v[�n��&�?V\\G��U/x�BP�y�}a\\U�_\\A�����6OO�So	���
�٩�^�F��\0��yS!���*9���PYD���O�=@�Н����ɚ/\0-祐�\\2�h2 ��vN������������j�\\ض�w�*�V�ž����{�����
$`$\\��P�ȝ!f���l��\"9�͈�Y�%��/��������2fK�Nm�C�O���%��v�Y�ڌa�6��]o��1��c���%+�j�\\�����ݏ;8�.{|�g�[3s1�\"����j�
�6/��*��922E\"����L���k0�h���e��Q*q��̸n��;u�RETE$\0t���lY�ݒ��|�G\0C6�d}�.�?.��/�?�ל���8����{����8���-l���\'�}(ߘx{�k�xWI���j��q����a���vϚ-DD4d�<)�����q���R�A�)P8�x�&��o����n��\"quw,�9�J��I�ܵ\\�\0P�9�������Y�Ϥo������o���9kR
V���0��\0mih�q-W*E�6���v�~�k.m���z���@pT����Xד�xGrr��\"��o�s�j�#������פ`�j�ȑ#M��ˉu
L���-g��I�E�D,��sB���&ź����w�7�\"���>�r�O3��z�$��q�qY�\\���]��X2d�{s6�䶪�]�<���$�&Ԩx��R�/U%$��#L`e���
�a��%U�����d�ubUu��fT\0�RR�\"�Ex�u�:���b�2��������y����׫�U��k������[��T/f̴��R^��]�D���i�1Q�:X��-��@����]�l����H�\"V�<5����x��ĞZ��h�[4)ˉIЊ�<U\"Ri��x%�[�V\\����Lr��$�)�\"�!�|����N����|�T�\'
���Qr���V�}�^�2}���� +h[��߲ͩ8�3דpĒ�$!a�r��p;����y�V���#�����X�q�HD`Z��˔�����U��&�K6�&S�,o���ߗ%K�/ӗ�*����.���E���Ј��
t:�n����$b`�񹜯����>.��5β
#[rZT��8~\0�l�iVU<6w���2|��6(��zչ�;�[���Q�~ǯ}�CH����]���ŋ
�\0
�8؊\0L\0\\:�ےu�
@VH@�@Ԓ��Q���	�2�BpAq�01�CX�$ж��T����Al��ӯ��V)��\'i��v�����ߦ0��X���\\��j�ձ�E�z]M�qY|�\'<�����C�Ԙ�^Į�\0��9=�HkWۍ\0�����(n�76Z�Pb��#
�ȭl-����e��v��}%\0B R�,\")��b8-Y�lK֔u]��Y�Y?/�%�k�s�l`��Ȃ���a2Wcp��`��,����̌�\0ܟ~TķO�3<��%�Z����vuxowH~��m�4[Lm7
aJY�$eXDY�:/rbd����}����:���B�b��u���C`�Ċ&j��h��\\�SNb9˒�dd�1\0t,��	\0�K�J��Rd&�J�½��vԾw���;��J�T���S�v�ݿ��_���hʺ����� �)���cS������g��s\'d�.B�(��jJ��}J�\0\"aҔL
�����RcQ�$��h���u��eY�du�(���ĆA��ɣٻ6+$�j�Y!��=���wvC���QK;~�Q���}�w���m��z���RH{��HM��AWA�-/vv��S�ֶ�!�~�m����2B��#/��y�Ь�u��]��})%yyy��?�B�|~�|{�9d�)��]��DT�,9�-��)[dcr�1#����b6g�9�뒖$��g�j�>�k�hH�����*i��vᬣiC@%�I�����������nG��z�r�U����2wk	>�`�P�H%,5���|[��:Y.3�a�=�d�������8�9g�ԭz���4�7�ۃ��ܯ���9!\"0#�@C<�`��i�,	\\43J `BB`���3`�uIiɒ�
�`H�|�v�ֈ�bp�+\0\"�j*�BcA�X� �)��	�唴|wy+S�s	�nɽuvlɖ�2���溍�0\0��V������ao�kH��F�p(\0���g�zk��\"	=�ɉ��|^����5+X63����r
��Ӊ�T��uU2@�0�V}T\0A��B���5CC���Qn�Q�,���<7we�6�7��Ր��OD5��a�޹>�9`W+�Z>���ݪ�^!�*ǋG��.����6���$�KY\\�y�����؎��Tסt[�԰����7B:��.�������UD>>>����G4رw��^�Րv*i	�ˈ���ɕu�\"��t�ƨ�h�`F�D`�e-vN\0J(N�4?��Y_b.2��e�)�5v�\0�6[Շj�?A@��*����I�s�S��U�-���/�8IK���m޹+!����ՓX�^�?���1p5�j\'�{��{�2���s��[��G�+<X��v�H�d
\0������s#9%B$����)�A$���9���g� ��E}gu�-] $X3��t�[X�]�nOT�*bޒ�Z��!Y[���q�0�wq�,K��o�Dè8^�yx�c����c�a{�I=�Z[�8�h��L��O�\"b1F����rr�\"��hc7Hkt�������� ���|C2d`��YD�db
EI��:\0�\"�Ks�F���l�[���t�>��>UyI\'����M��.�i%�w
5�o9D���#��,�R{�m0���~l�+x����(�)|�|��j[�2�[�+��?���I9�pUecM�\0�s:��E��{�&W��L�����[���R\\���{#c[U���V#n���m�\0uU�v��P�M���	G�Q�q���$hGt���&�}��j�����{���� ��Ml�T�AT8ȝ��v��r����\0���g�ٵ���j���.����_��߷H�fn!�������yOs�҂�h`G鯱[;�F�6�V]���EZ����W{+k��Sâ��O�`��̇���?z����J�m��Vx�я��S����#���)b��O�%u<����E�z�����\"ۚ��~k�P�`+��R(��}��/�k-�9\'��I�������u�9�q�f��>u~����@�6wVk~����T\\��Po?y�������ʖw/���i;�Cw�����m׌������9��Z�0f*�e��hf}=z��н�~�6��ѽ�=.CoF��yt(�s�+����Qn������ɢ�cc7$E�F�@�i���-\\�I�����9�A�����1����6:j���ѓ3ۿY
�{����=�{�]�������I��=b�o�͟��Gǂ�)�ކX�C:yC��֜�m��
�p��3�1�v�[����9L��L�Zݔ�������[�P�X��!��gðs��QS-��
��q*���>wm�H�{��q�����!�z���c�B�TY��|SP��]L�Vܤ��sa����	C}�c��-ki+���5�V`���kḕ�FgՀ���p{�61�x��R=���ْ; �d�Ljm�\\u�6�������WT����![5�m�ߛ]�Lu���<	ɰޘ�
-�w��)ެ�Tܴ8#ܓF9���I=�ʠ�M\\���_�h
�H�Uu�R9Se:B �sq��Vf���xP�>�U����4Ӕ��i�|X�YY�;]�ktC��33�����E4B��P	\0~u���}i��V$w$R?�:�g﯒.����]���}������e��3$M�*���G�>+����@���o�v���o�a��z؁N�����}zXJ
�������J[�> 35.rwb�������;
kHV7
 6�ۮ��l��X�h�׿)��]�c˷���\\{�9Э�;%�G�붺�vk�]膑�j�ƯQ��!L�TO���\0�w`�Ҭ���U%\'d�Ҩ���01G�*C�p���
��a�J���w9���y�2���#��3�$��|��⡓U�U-��N�$\"��K��90\"&�9q`HK
�
��̦�&��\\���)�ݥ�����j�j�1��.i�vfDi�?�+�S*�D�2OD�Nm ����֪O������Ȍ�9h���:��u��9*t�& PP1 �kZ�C�k�<w��/��5���Dc�e��L�}-4����V+��,�FJ���0L�(��\'�����m��ID�QU#q��H$Y�W�� ��\0\"�2�S�;n�HVnkW�_�9X�����0!��˷��l?;���܊���h��B�q�B���^K
]5��
#߇�r�h����e��PrF��B��}\0\0E�����D�Y�9aG�fK�k��dݡѦ\0��h��j�_U���lmZڻS�&��\\�v�&�����\'\'$��4�\0\0\0\0IEND�B`�","Male","Approved","12/26/2018","79191204");
INSERT INTO student VALUES("KICTC-CER-004-2020","Baraka","Justice","Nnko","ITT","BT-ICT","2018","4","kweka4@gmail.com","�PNG

\0\0\0
�ʟ����߂�����������z�������s����׏�������{�������R����~?��7޸����X�w�?����=��ٻ	��;.~�4���/�t�L/���N�%���j�-���l�V���wz���\'wb�	o�U�����w|�۩s�x�%.��
A����zO)�R���u���e(r��w��\'����߿��Kq�Dпm�<�����ӯ�R�/Й7:_j-���l�v�2���O5�f�Rb;�\\�S�Ar��*�Ҩ����ϴ����~^����y���?�trhz���՛w>k��z��U��l��歶�zm��K�^{�=��簑Gu���sr�ɕ\'?=yÜ�V^e�����ƚ���e����������8����8�K*�r���n���G�����W_{��7�D-�������}����)����?���K$��+fD�J\"�M �M1�=�bA�S��0�U��s�\"F�M�/����D�/q����f�#�������D���/�v�6;��EHe�M���s���d_��}�^6�����w��6?�罽���ʺ�ı>�>�K鋿�Q<6v��|�4�.���]���O��R>\\0��s9��E}Z�6����E@��b>�����q:w�����rr��pl���l�]���k%_m_v��:\'���j��k�:��a�;�ȝjdL�6�����8}�s�U]����v������~��y�y�i�r�0\0w;>�o&���k9ݲ�i�+ճ�6��p�(�|�Jw��gd����[7�5�<T�|Y��7�ꉿ9Y��Ef��5����#֞Y]HsN7������)u�;1/\"�Nt�Cղ��9��C��:5ţu���ν��e��j�����K�k�X�9@eS���a�^��f��}���;7p�l��퍕.��.�n?;�qo<喸[\"�}Q���|7\\vr��Y\"�j�M���^�����׿lڗ��C*��죯M���`y�aF���]ӐSV�&j5�M��}�!�v�~�*S��`���|:��2àx�[\\m�E�f���ȓ�\'>�_�yS<C>���������$�Pk�ݭ՜�
���\\�@~�v6�|�������s��:1�w�d\"��U*�[�\'l��o�[|��
˵\"a�˃:��g�@Y��s���@���T(Hx�Eqg��<����KM_*�\\ߩeJ��nH��Jc+��������d��آRg�~���R�n��O[�~m
��[i��`��a�B\"��)�,�!��}�n�;jG�����Z�w�D���\0��-\0~�V�CP��k��rc�c�5��Ӥ��.Vd�������)�������*��w[Qs0����I��W�5<���_��A8���ȣ$��0��������<,<#q�C=�����:��E��8W��U쁝�p�}�:���o��g��5�p,�wdV�]��� t�i#�7Q�@XS7�F����G���n����Ya]F$��wl�zG#��ΥV���ϡ �2Ќo!��s��&h�\0~��H������(�ȝ!@2���3��O�6��)��T	c�`�~U�����t�m(�5�>����C7S�4)4j�4V�G$G!�{;�>�,����4��z_E��=�\0�����.�xАp8|.Z\'�Ν�bWd�f�T:\\��yyi�	�J_��\0�6�e�7
D�
r܅QЁ^���(��Z���C,��0=�����.H��g˖*\"�$1��(c[�_X�X�D�j�*x	d�x�����`���]������!��&H<BG?��xf�����ۗ#z���%�N.�>Q5����H�.�R�ͬ�$T�!�9�w*�3	��U	q���l��W�\0U�,�@i�AB��.���ڑ�Q�U�� jhe0?G��i�`��@��P��5/�Nh��>ɐCF�h�����
��܅���U@h��7�j�	+J��Ɛ�Q\"
��H��gXB/,%P������$�H��MK��ĉ���-��cnml������P��qԗ\\ zo��eL0�\0b��9�_�,h��Ész2���P���#��%�S��Y�N�P�$_q���(5��ya(g�tC�
|�];�4��2ҵ��m\\e�O�	JM�.�H��`�~x\0��u�i����sx
�Y�n�.\0���*Q�=XBi\'ґ����Apx*P�Ɠ	Nɉx2n���ȴ�Ƭ�3XV�
ܪ_�:�`G��HO���n��se
L
�v\\ۆ�<��
;�2Eg@�+#p��Ġ�%P�Ё�+ã��bh\'�\0��RF��\09�}vZ�,����Ʃb��L����ǁX����k���!�\'�x�[]�=0�U�[��V�L�,�/|d�!A3��+�|^P�s����{�Q�Pj���9M2U}\0y	.�`+sr��9�N��F(�#�mKm����ʏX
A7���3�>KeZ~����S\"�	��f�]kUJS|x���L��A�+�<ev
��8:��^�u�xe���M�=��~�eC�5T.�|!H\\u���z+iD$�L�[��R#��hM�|!�?l�L(R#��WU�U��\\�\0v#�ຝk(O��ſ{���&8b�A�����Z�x���n�?E8R��>�F�
�&�U,���{ET�Z����ʞ��0�����AQ]�����m���\"b?���_����lPA!􀖥��&�R���mj�`ty�(2L\"�b�-�/�$�%B�P�8�,g�ۂ�Kd�ܨJ�4�QJ]
��e���\0R�hx�������,́�C��q�j�ͳ���p���!��ϣ>��#A;�%�%q:T�sL2��]aZ��H%���I���KDRV͖x����(�t�s><Ӗ�� ,��(?V�7D�����8s�����0G	��`+�*{)j�}��h�m5tZdW��`>@�\'�W,A{�\"���f:�V�MR_���U�ȡs[����oRa���r�c?��>dX=�����&��*R�GL[؉F��q#j�5�M\"H��n�\"rM0GIc���>�\0�6���������.u�awd�3j�H�-�뎰\0�jސ�W��AQ��Ç���aF@��IZ9��ca*o���k�\"h��ۚ�\"7_=ڢ��S�����r�2.�H�A]V]A󬺯�L� 	!���)���@��L�ɤc�t4��K��������^I��!L��^������A�
Hܢ�؈
	���q��#�t�Z�]])TA8�i��J����(��&?�,j�����Izx0�m%�K��u���/c���:$,1	�oE�Hv�P�P����`��T*��
��,�ٖ.I)�
K�MVK�G�▗<�h�j���lGUu������⬓5�\"�Im��b���t�̶�\\\'�A��
�h���w���m_Y���A��,���Q����X�,�%䤂>U2..M���\"�T����ut�g�98��\'+I����
�����S�!0�X�@�1(�Q��)&%$V*�~!��R�`��\"MWi�5�\0U��
i:lb�?��`ÁN0@O�D��G� �5���@w����j�����
����=��϶\"�������+\"$�<;y̦TQ��!Y]H�������O1�ڬ�$&����RX�lD����!YA�I�RYBvǊ�T�i)�K��@݂D.�M�!�p*t�\0I�t,R󂵖�%��\'�_�4��-~:⎒�O;�=Y8tɅ*�;�n�A�\'�������.�&���YXs.�Y2E���Xbi�Z:ʡA�,�=�nG}�8\\��ȼ���+T��˽J\"R0�FD��h-��[�(��g���R[r�[�<n�]\"�6� ����>�6,�U�&5���V#ٴx��X ����BCv�X�3�p��ƞ�!;�#숫pDN��a��Hu�@J4�D[��8��
t��QF�;S@d4�rH�
\\$7�X*���Y}!���u� _����Ӡ�l9蜪��)�l2�:N���GE�R�G���B2$08�	L���z$h�IHȊo�T��[���y��1d����#%[:���\\�(�.̈́F�(��E��.M�]K-��u\"����Gmz0�H�F\0L�p۟&�}
_���	٭(���j�ΤtH��8|�ׁ����ڈ�>\'Գ��rb�Y�֨>a�&��F1�}ae�ta�k�!D���f���r�BcT�S\"�x�m��Va��C�]���cx`�M߼����\0�P����|g�S��~��W	Ș�u�r�pK��,PP]�-��c�j�?�$$��M���,rtu�g��D<d2��#�D#��+!�˭#<8�Q�VíC^�I0#j�Ul�\\���,	\'��d�t
��[xxh�􋴉G�*�
�B��Z40�!$ԛNd^�d�@�j�MrH�qd�0������&O��(�C��#I��\0�����BVL}z����Q�p�V�Cl�U��.=.v�I\'El},��Ԅ�W���$��Y�
�߸,�I�p���D�\\�ĖN	���?�GD��4����� �[C���i\\F\"29�����V�r#��F�s�d�c�\\�^g�Gۇ`�o��N���U˂�P�\\^K�C�_���&|7M�B/�cS毸�M:�МF!��_��(j�*��������)*?}&*�ǹ4Ƌ�x�@�+�|�4$vlHpF���6d�
��P�YXZ��Vk��G��u�ı2�򷤑$�:M�/c`��\"��mw��\0�Uc�s/M>�EsB���~���t�1�M�l�?�#l�E�2� �\"�\\�2P�ȅ#�&2A���	0$c��s凒GR�Z�\\��X@Ѐ#7��f��5P���!�VC�槏��-�\"~�R���c���4��A\0
g�=�0�h����+@�Qc�YG����>���_6�KO�a��`�`�jY��a4�	-⎃�=$�����D%�f�R��6Z�F}n���
�������E�:~�9���c{�[�0I�Jպ��J�@C젔1Wg��>��F��7�φ-��O�@����P׀�>�B�#N�I����Kq�������uBeB�K5�X�����ST�4�8��T���ǷѠj
td��/)>�@^��j�zW�1���F~#a����!玲i��	��#h��@6����>�@��ĲƋ���5��*�c�rEz�;Yz��KC���#�
�;����w6���1�@��#6v�ʣ����N�0d�
���]s)qT/��x4�Vh�$}t���N:b�Du�-�F��k&B\\���/��A�e�?
1Y��	��z;%\'�,��4���Q��g��}2��s{�.1�֗��>�6zF&K=�1��63��h<M���,}NhԔ���U�i��s�$u�P�8���n�dv�ɭ/+��<FG1s��B\0��5�D2�Y�d�eC[W���V.T��I�>)Q{���\'�S��B���Q�A�4rj�_;����P��
v�␡:Yq�*�B�Zu0����G�����b���YWWA�\0qrtRt���Z�xp܏w�w�\0�Qe��5h�mfRI1�_C�#�B藙e�JR�����%x���?G�Z��g�a����S���y�8�ʲJ|N<j����x�ƹ��3�f63G%K�t0+��$q\\�t�r���8k�kݓ�0RЗ��Ns),`D(���*l$h�I������?��%r)䪀�c� �~�?�ݭU���\"I���q>���.Ь;����4O��3p���
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:2b614325-d326-4fb1-ad1c-97958f0ff039\"
   xmpMM:InstanceID=\"xmp.iid:30a8d5c6-d941-4a29-b29b-5cc93bfbb741\"
   xmpMM:OriginalDocumentID=\"xmp.did:6892ddb3-e48d-40a2-b5c1-469c5651ea0d\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1603715089162287\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:86794acb-c383-4740-afe9-d617eef11620\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?>\\%�\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�
0��
H\0�PbJ^�7~�<��4����k��v�nz8�����Z�]����8(����d  $!A���DZ�^�UE伟��F����������/_�|����g��ߨ�j(�@
-S-�Lf��g�2Az!HeF���T���2�|�ꕹ�����L �lG\0af�U-CUd�[�������n{}����~�Ƀ�l���\"�65�e�@�aV��Ŧn-5�S+I����j���,�����^$}hC�����ԕ~�ɐ|�s4���Y��W_>�D�W�n�~��fNR�,��YN0������A�3�D!�P��GϿ���ӧ���ge\0���fGܺO�ʋIJH([&�ȖQ�gdz-$#B�n��R��K�d��q�O-��e)eG��l����!v7�חW��>Y]�����z8��|��_�����~�Gh�Z�չ��&���zA��ZL��#z\\������j�����^����$��ju�֓K��-��x�>���f�N�Vg��fc������?}S�0y�1e����Qv`�b����v����l�}���o��n��\\��C1mw�~�F�`���@R�49�Z%55�^k��ED�R� ��닳���L���I��,Z��S��0���ef�ؽzs��ES�8���1��8_���� mq�����u�A_����r�R����EON�]i��9�Ӹo\0@��(���f��Y��R���2�$%C�x=�@we۫��8�ː�wW�/�<}�����[nwq^��x���~�5r3��T*)�L!���qku	��>��~�G& H堙;���\0f�<ϒ�h$�\"v��4��4⼯$��r�`��|������W_��7�~��l��]c������-�$/�]�����+����ó�7�7�}~��c�щ-�o��
���]_]=����_<~���1Y����~����̓���w�<�[�i���nt7w\'�ε�P����\\���kK)���d@���{\\�ZJ�\")���^
�A��L�G��b�`�;Dw��`2E,��A��枙��``ggmw}�om�
�$l�����\'�|w��U�옲�L`�b�Mu��\"���	@TP��J�6ϳQ^J-f���ѹ���9����:u�\0��r*��T6	TZf��f4k������q(�H�l
��J���.u_��
݋EFD@��a�O��>J�Sn���w����>[�hn.�;M�i~�{$���Ye(>��	��eU�7W����O������5�@kL #J�0�9���ȈLD*ۧ�<�iv��8�[���tc\0�`Fg�!��N�����)�9��*�\0����mY���G�5ss3�yf*Z�
�-\"�\\�]p/�R�J���B
�|���w�}�ͻW/�8�J�Ҡ��
�,+��B���XJ�nj�^��ӿ�����0�F���O�>�%��BI3+�ju|��\0��dY���j|�Z������voF*Y\"��b3 �	
���5�ґ2@0*��!R0Agq����M-Z�s�·Մ���Z����`��m���
0�ޥZ����v�G�|\\�Mϟ>{ss�����_���������j�)н�m���w%�@�&�s�n�݉F�4M�ֿ���f�X6��Qrn=��
h)���ҭ��\0bjW�W/�<}����]]^>X�U/sK��qw�U$��+�y�S���HKe&�m�]�^_2bU ��j�qU͕M1�\\$܋��s�ir�i��f�Vhi���W��\0+^���mD����c��т�;�&���)$-�%� �U��ï~����ݴ�E�\"c���j��?~�����o>|�+��h�A��/ֲ��S3�3��֋�ĽM�cb���\"P`DC�:ãt�IfG`����<�w~~j��<O��fV|P�$ܽ�FDL������������v��m5��X���#�A��n�Kr��I	�+�Z�`��Xm��aܬփ�~������,��T���4��ݧN$� [�H����
���hif���+fQ������C��Zk�̼8�L-[kf���Y���<���p����N�f3���n�����i�Z���>R���)���M�� ����q
B1	��2�$�R�H2�d�5~fv��]s��\"�H��!O�;G��Q\0Q�YТ�@3�zf�.������Ƥ��-�1���I\'��C�!ʦL��B`�i^m�]__���~us�����O�=y�{���0�T��;F�ǡ���4���3��AT��P����|�;�c��q��em��:�jmh7��Xy���LX����\0�aX�[�����E�;
! <w��/>�4�}����V�yv���qBN�s�����͆���YH�R�:��5��}��8�⡼��qe�=�����ݗ���\'_~�u��]mA�ce���0�Rv�],��.$��[o�%�CxO\"���\0m�@�Z\0��Adg.v�2�
��A�C1�\0�$m�>��v�����/�����,`�4+��P��P-���Ͼ���O��Ns;Vg�0M�^�mH4R�ۂd
9M�f4s�����P��Ħ���\0��
p�#�����g��IzwB$q;�@��}6А�p.��؛h�F��ܭ�Q�1&�b*���f�����Y��Q�<��DDd
�C)��m���1��v����P
$�Z#i�7���h�v�?�[k�;�;�y���0��>�\0�1>�����@���@%7�u�(�D��U���?}���x���Y����!+��cCZ&4d��y8pw���2�W�b��@��s\0jZ��Kʐ�������%�D�/���L�\07}t�4���Er�Ȃ쐿��&dKk��ػf�����Sj�H�\'5��U�H�ր4��//_�0�m֪e�ko=�ݼ~����a��^2s�\0`���σ1\'t��K4��B�߇�Qޣ;��i8�h�?��O�<�/�N�[��k�T ��^1�߾x��7߾|�l\0����W7�(zK�!��1&(V��������X��y�g�,Ҁ
[�b���!\',��=�	���.�\"�v	��C�y[n0.L@��3Z ]�h��f2��1Q�8�f����P�.c;�vn�<g*k	�93B�f%~��gﶻ���zڿx���}���n6������m?Ͻ_��ED�.�:����w�\'��p��o�C�=֩í��7��II	���Ȕ�4�֫\"{������WO�`���/jb�`˵an3 s�dR�EX�,�#��롺��]P��j�6���ژV W�A7h�g�]�_Q�O�A�7�zSg��}�_�iO�:��P
�3�Y����i3<���fe�,�-��!�Np�)��<D�����̌�����(�^�W�ͪ�>���������=
�Z諱����=x��ً?������cL��f�)�I��Pg`�Tq�̓��PW�*4\0���lt/�3.�:F��9�	��Z\\͈\"Y������
e\"�)�����m�
�qUj@�l�堀��LSN�:l��tʠ>��ag�$tI�>Ӕ\'�y8�p��S�a��
%e�D(4]F%��܈{�C6�3�QN�X��3���5g!բ���!%P%Y
)���^>}�d8[�zD��\"B��m�9��<��c���V���#��M-3\"e.i���<�ߪ>C�&���룙2��n�jS�����o����.߭�G�)rj�^
J0:m&+93�����v@K/m.żEQ6���.\"���dB�,Ő������vsv���k���v� Ki�9Xh�ݶ��G,�G�����鯞�[?Qۡt�J\'�H�l�X��Oʹ���۸��d`������/�>i7���|<�e(BƔ�)�ֵ�±�`V�����Y̪4�#P�*bH���%A�(J��ӡ4�1)�3d���ama�ӒAY@�
2���̥�2�+v���G
��J�B�V:ݽ�=���\0�� ��N
���d������s��WCp�����9:�y�!~jFA[�޵y�)����6��A.�r�SH\'��|�&e���\\�Y
@�\\F�����Đ��e*�Z���z�he0
�^����.�<�C���y?��\'���{\'���j��L?j!ewo3Cj��i�Ǻ�:0?����?\"��Yi.@����,�r}s�����jU��
������푁lP���Ӈ�Z+�3F�E��b.��Y
T[�#�\\�-{�\'\0�Et�\'�u�=�#��8-�-���j��n�.k�%t��A�Δ�`�*
(�B(�;Ҷ�(K���Y�앟Ӝd��{X��>.}�
����4i��������~��W�^y�0��Z�4�����TA�t)m9���\'���T���蘌r)+�a�-��_��T�c�̈��8�j��ϔ��:ƣ�����q����2���4A���zu���mVk���n�>�v����^��^�ݜe�w���9eLc������|~wy�#2d%YK)��&*V�����jm�>���%
�`ާ�g\0\0 \0IDAT@!g�`��W�>��^O����������
6�KqG���a���~8�7èoc����ܬl���/w������	���o�	��턣ą٩�D((�0�0t���\0�Q��
ٻ�*)WV��p���̂�)��O�{�Yǘ�]�\'���2M�A��2M;�x����}���=���J�TÒ��$QE�`�CY�]�	2Wf0kd_ײj(��=��.њ�Fk�{w�����l�O&ѐ�#�X�N��c8�h��4l��P\0�cn˟�QF?�)8��~�]���;��~�(�{�@
�\0W�`���0��X��	Z�J��)P�CƯ^��j������p֏��>�~�_�~��u��4���E��)��S`�x䮵�}Z��F+�w�/�<�z�(4Dd)#�ʳa����b����t�\"�1�=��ʒwʨ
T��b(��NXז���������G������_nǀ��\"��p�O���h�����F��ZD����ddCːY��(K��o��\"6�K���@k�[2]R -����_
���?�Kl�@����hGj�e�ŃvK�N�Cj�հ�����O/_�^{-��h�载4p5����lXQ�3F�r��D�h����B�ыz��T\0�1�K�	��u�՛���\'O��\\XJ���IW�dL���� ��\"���P�� �H����X�i)�a�R��4@���g�
���nQKDIh�r&������eR$������\'����G��/!�},��y�>?�������~��?��$t�E��JGt9�<�u{y���sL͍j��⃳�Ƽ�l��ъ	lY�֥Z�u+4�%�2e�9Py�Q�[\"��%�zѭS�\0K���<yn)�]�B2��Ƿ��M�4�h� �Y:e��\0��L[Ta@XP\0E
�$��f�F�N�i�re��L��\"ث�n?%�T
��`y襚Z<�������E�q���ؾ1��}?%�q���=�N-Տ%�O��쾯��BD�qd�6��y{u����-�T�z��<�l�@�aU\\��q=����䒋ľ��������xb���O�kɃ5�-Q�%�w~��4�	���L�c�U�4J&�i2Av۲�2�����s������2���y�Qn��Xܳ8�m�:X����z=�n>�.߼A
������x��њ�4L�n80{�7�p���
�v��*�])�>S��
I�2�8��
\0ꄑ����?��@��H���\\��H눺hf�L�ӝM�fŬ:%1	����L�����w�n��,�)��7��l�g=��%���v\\�Lw2\"޽�t�̦iB�y���u_Y�$�M��w��o��\"՝����Góޣ�sEdY�S��,��X7���ޒdw�/E��1�윏�Hwr�}�t��ұ���>�LZpe��f�iv��i�ZѧS�4��/};&�H�l��Y1��RtS���ꭕ��IP�\'�T7{�������ó���|(-����gۨ�DuB�`�>��܉#$����n/l��a�(u��f�Z��Dǖ.m^�$1����Ь싮����+��gX�X��?�{�VW�k�plĲQ�aG/�B5O�X��B�i��$�(!b��v�x�I�\"��b&D�,�@g�с�H9}���uP��^XJ)%斘������Ә����/_��6(��V�O�����=�~OL�$70��Ar�݆��ZBJ9�sJ���Q�/����[\"��(��-�;���b����d�c��d�O����ٽi�G#�\"��q[D6<X�󰭙�)u��TU�ilA&�4�̬��]-%:)��Tڂ:\'
8�7D���N����Z�T_�ă2(�Nsj0޴�w��4��!Nj&����i�7��͞��n٢V(���֩��ߡe�v������H����]F�F/�\\�:HB�����J-�B��;gh)�t,�#��u>��i�1��wh��6�J=_�6�a0���VWzW]��eIԬ�J!*�V*�0*��qrQ-d��V��eZB}!)sv<܍�4G�<ب��H�x��7���𱏊��AD�Ҏ��iN3S�LY��#\"\"# e\"2ٛBP�MF2�
CqW\"B.����n�X�Sȗi����Ͼq�	E�i�f�\'�㈙�0-�v��a2O���P�j�.77�w���5
�l��w���8l)e����ܴ֊8��[vf�1m?�W�)߃ĦŖ�Ԗ{/��S��H(�Ҕ��¤��K��&Z\'���aft�%w�?;��u}*���X��uv��)o�$�Z(Ff&?D������P��e�\0�p�t�;B��]+`AUa7�7���u6���y��2�C��ZӁ��n���3M�x�>@�����Nr@]b��f>~W�b}&䉼���q����v{��]k
N����\'�b1M-0��ju�W��~�V�V5SKf�8�����a�?���xS;�	p���!�^�˅_�<<n��Q3/��u~��b�yW�g�����l��u�l���1MŬԥ�����?��I���{�%ɒ�JS3���cɵVTq�4����y�yޑ���fK����
��/������v=<r��*�3)\0$�R�n�LM��� �N:L��a\'��� ���v��=|is�lULu�$�^;�C&\"��5*�t4`!����������y1߇BTz_�WȲ�������PDXYO������IəD�C�*=ģ?jL��lĻPek��
p��\\�/וH����_��-N.�D�oap�;��P�aM�����]�g�>��/
bx0v$�v�6�H)���i:̼�l�0@$�31��a���)>tֿ�X�>��-zjy���mGk-塚��~\\4|ҙ��,{�����-���Nz,��՛�Bč�b\"Z�׫��5���D;�!n���\0(,���`�F$�Q��J͚�hLܩYk��j�sq�<5�j%�Fc���\"9KN��N�6��Od˯�
��r[SJ�N��&0�� �J���p\"�k\"�4\'eh�`I�u���NB,��H�)H%�5ٻ�)�N@P<��\0��\'�O�4��\\�ު������^�}���� �����v�g���fAC��/-���2��HD��Xn����<��PJ)�,I�б����K�wgm����Z?������ӿ�>q�e
=��-��>�@�GacN��2�ֱ~��6̭1̬V��ij
wvS6��C�yC$|�d�5����Csw���3���v��f�0��/_ݦ��2eP���4Ms����L�s8)Q�������=�\\R.���ΒX��~nSSM\"�h��(�HdS�3�Z_���c�*��p���&3gN:([k�+��\'v�؈Չ�{⇞�G�yG������?�2��n#_�ͥ� Ic@��4դ(IS��ݭ�Q��H�i]$�������^YR�cS*,����Ȉ)唄��i��
��S�}[�f���IL� c05�ļ�\"y�����>�3����ͨ9���Yͽ�T�E���=�����M�9{�9���Ysk�Fj���1���̅C���lp�̈́��J�`gk�c-Gsx\0�C��G:
7�Fn�,�5�@�`=l��졿�	C��E���ơ䤽:R�[�V�\\��bp\'��Jl���U۠5��1I)Isk�Z#*��ϐY��+�d��i�������<U
5��wPÑ�o�Lr�Un���7v�f\0ȝ��
h1�o�IHY
s��ȝsCL��J�A����K�%��\"�H �Z���w؂Q/5�
ԋ�e������|�ȏ
�_�����q�Ǟ�j�B>�nf���D�Y�s\'��̕YT��AeL:��\"Pqe_~�:��z�H��Q���24\'����u�|8��\0X<i0af���bJ�a���4�\"��z���F���h�+,-�ؐT����ʉTR�a��bl�B,B�IM��.g}�:5�|g���-�&���
H�J ����٘��d��s5�6S)���	w� ̥cm񬨄��%9�Hлb��[���;ӃH����?�ǻ�����^��������H�N.qǔCLVMх���
^��4�I�H!KB����-yϨQJ��eV���\\��)��f�Dh\\�-���R�ninJ�&uQvfWML`q�Y��;�)�w}R�Q�����
M�
Q֬�0\'qwg�hB��E��]�O\0PAB��n�uDK��W\"g9ߙo�܈���h�Z\'�;�����)g�a�0�Rbsd�JH�����9�\0z7W��>҇5J��3}�>z����3z@1�bskƊ@0,�w�H$��y�&���^�Z���H����73��8��D^���hII���$k��L�5圊�F��4�ݘ�����ad X�V�I�L�Vq�- R^8�1p�
IvM�B�����٣Ũ�j#�̬G��e
\"w1\'��`�eHi�l ������$�\"_/�6�\\���l#�h�N��wp�����_W|����ȃ5O�a�FSL�mC���oߙ�v�GR��\"���r�)�ɛ�[s���V3�̩��W\'B\"�c�`���L�s��UZ�\0���܈fGmth�6�������f�a��$.µ9Ł��,���Lf�Y�O,$ $��pNgýM��2��YB�G�.̚�I5C.�r�x�̄��)\"n�̽�YW̬$�D���#4��$�.N0roi���=H�^}X�72��;�Y�U�=��+�Ǜ>�C�eB��A�l�&�0P!Qh1Q�D���F�o�3�������,�R�.�U:&q������&����0�iJ��`R�W�Wؼ�ތY��
�3����&�p�J&�3����9͓jRM���gr�f�Ƥڌ]�S6�v�\'�Y���nw��J���\\�>��~{G)U�o�w�u���ꬔ��aU���f=�5&�q�B��7�D\\X�5c5X�Fu�)�q�(����1jsk���`F7�����G\"���\0����������7���v����0�jNi�vw��նrιrVu�Q���I3���**i��I\"i61@il�ItG��y_�Yr!�\"*eȩp.D2W���uY�D]\\�FFDe�Dn��\0�cN~�$�+�j{�>��uBpen��M�U��McI��\\6Mt��D�
�7\'Bb�*�81�eܚI�V���T��|X���<;����wB�C���۷��~���g�\'O�p���� ��QK�Ӂ�*��Q�Ȉ\02���G�i���&ؒ��8g�is���j#f��n�����~\'ex��������O~�����&�������jS����w�w
�ᮝ5[�U����l
1K`u�ԳI�@f�ӳ�����l=\"3 ��ҟ�?���;}r?.(��X���Q&�c�M�{��OFl\'r�#����/A�v�!|̎n�Ɣ�5�Z�(ɮ�{&��(ȠĈ�Z�A@��hJ=@<��f�TlOs;�a{�>��˿��7�W�����������o��知�/?9�x�������4M�[��Zr�Y�)+3��\\�Hp�hw�ޓ���Q���x�2h-�gs`7�����vt�yW�׫��_}��J���_��������k�����������f�n��P�\\DS���-@B}�@=�&�`UR#Ur�����iCF*��;C�M��D%��������}��=������I�S��|t
����g�S�v|����~N�y	s�P6��ջ���t]`-��YMI��1��B��0\'&]0f7������U#������������/nnn\"�����/�毿���_��<��i�����O��b3���:���TǱ$�yo%>na$ �_Y�C�e卍��jffnn��j�T |s�k��\'/������LYU�f���������v�7ޑ�pv�?�����v|rq~�9��&�c�^{��5`����-�j%N`!N�ifv�@jJ����u��j99�v�I\0��[�����J�㹣+c=����\"���\"��cX�[Ɨ��G�9�B\09͓��fLs��^��ռ?��o��{��$V*Aᙨ�F��JD�~�����vH�x~~�?��/?�4\'�����߭�rqq>���|���Ӌ�y���ݭ�j���O����L�~����0j.I���8�\"���hļ0��3}7=��z]�6)���P��D4�����n�_~�ٿ��u7M�|�-mV��ݫ�q������O?��������?����o�Ó�O������o7W\0·!3�0
y�)M*f�&Jhަ9)�����G_|����U)`�\\��W������<���_��W��}��b���6O�|��g�qTU��J)���g/_P�m>��^%��D�R*J.@a�C���M�m�i���[�\'��D�ެ��JY[�Z������~?�����g��?=X�ژ�������������u�LR���ӧ��x����_��g7W����?��?}��b�R&3���&RDtU��d����lM��Qd�j�6��Ĥz���!�I��o�(S
k-Q�����<%w����C[�D�4��WW��ϟ;������>y���������Y󆛫��w����\"�b=��O����s������۫������0�>�ކī�r_R�xq�)��٘�Ew��1���7k���yXˆ]J>���T�� c�e&��#\0�wa�g	.n��z�x����O�P�-�aʉ���8t��o^��
��,��k_�h�����K�G�3Km��.9��n�y����?����
��������WŦr�H�k%v_ea)�3��\'�O�΀��h��I��*��*]����6H���)i���h�de�>��\\]>9Vw$J�����\'bgbRg�¬�!��?�GO�$��N�!z�_�00J�H��
,{f��d���@\'�{&��*KV�NLC˫,Dv8��y{�P�H��;�����.��k�9��g��Ͷ��m���lX
���kV�:3s��1ʘ<Û7wj�4ijs
뽟$ןܱ�7DODD��-�Ð͜0��6	w8-�d]<S�(FX�4�~�e.�$r�[,��n�$g.:
`�j�yUW�8�&��pض�tp���H��1j���Q\'oP͒X,Z�EƊD�|1W��C[Ì+��䀮���ԄȂ�,��Jʉ@�h��ab�$!�f8ȃ|���.ɖm�!G~%��w-F̼���כ1Vts#7�Mۻ�T�\0\0 \0IDAT��MJ�ٓ�)��a{�����&�<m�	wab�p���z@�CE����F�rp>��`@�&v\'6W��T�!rv
c�S�U�Tt9��da�	Gֻ�A�K��C�w����AM|t�<*%9��\\�q�\"�VdQ��IЦ9��e�d����~�no}��3a3m@!ZK���W���,*�8�[s.t!13��Jq.�(IE�F�P\\4ks�!���y:��ipweɢB�̬�����!���A��䑮��VH�7�T��[���Ҳ��7�u������=v�0L�]b)q�%
�~�x�����c���$)�KͥH�Z�;��޺SI)��z3���y�4]�)��E8iI�k��J5r�@U��pLI�$LK���f�!%2?0�|�\"�T?(O~\0�~���G��1���`*�uQ�Rx�%Kg�<|�a-���C�I��n7M�M�Ęk�Ee?OD�slȅ��x�I��6���┟�\"��uB���h׽sRVa�p��\\RJ����~?��l�&%N*YTY̍�U��\"�7ߑb	,`�C�<���i�U\0��Ɯ3�E� ��������U*�..�v[3�q�4TQ�i
�j�����!XGJH���.@����Hk��v�Y3ޓXx�G�R�G�p\'�)|�-��t1+��g�(�5]oI���ps��7�唋&�����{7f3k��yތy��rwd&���(�$ɸ���N��]E��/�~���}TDEY�D ���m^����]��H�c�,����GSsO�yJ��sBt��g�ڼ^�Oͦ6O���v���l�r��ɼ�{k�D��g����\0��ŏ\08��!����Df&�\'3�F�Hy���q�*����3=�G���[�o��~mN��ǧ���X���§�v���4)!��m�����eN9�!�9��ޚ�O�g{����1tX�t1���Km\"2om
�n��@r�Y�I�y$(\"��DB�F�zysr��db~����2����c+r#k�!�V+�~{�Lg�&Hdp�������V�c���`D��%3\'e1G��(	�d�Jh�Y�[���v�����8|����>z���xc]C����r�(�k��G3��Y��r \'bǐӠ\"�M��<ѕ��7��T�<�:��j���``�94�f��$ �q�D����r߱�*�D�r���X���j�4Uk=7��9)K��{��ؙ�A���;��qHsT\"f��t��0ԩ墑�~{{���0���e�u�^k��i��fF��=>���;c��I3j.�ʀ�I�y���lm;͘����LǷ�1�^I?&�;��VG$�Ë�X����y��[�xq�0�����yPM#y�\\���p�����o�J��^�~���Y.募|5��oQ�DX�V����[ouHə	ֻ�K�{d�E�2G(�r7�v\\T4���3������d!�^圇Cvv��B��vZ��D�hz��9ܽYs���ϲ�G�1���=����RDęV��]������gf��\")k�X%�,Mf�~CBD�(��;�wm�K�ͻ��J�|(�¾Y�w�4�>��W7��F�ۻa}���\"A���`��x߮|Z3}V����T��I��\\F�HE��գ���G�o���AL^����g�3�[��0�$��ը�\0�a(�dk4�3��eN*T�#[o��}i���p,ɂ�^\"w�,�z�RQ��\"�j�҄Yc?���E��,�c:���N�y�J�v�Aع)K	-D$�9IN��V\"RNIŌ�����4��C��N�k$Gq�{�\'��A|j��I�aUX�RR�j�P}r�{������{V�q���t)O�
��ƃ��;���{8��%m�}w1K_���}�d��������f��Ӷ��Z����Zy�l&��*��&��>2K_��ؤz�i����yI��m���Z�8I�.����DT��8Tk�ap�
�$%^��2�I:K̉�8,�N��ZUu(9gw�ʔ�H]�\\�kTL$�v±��*q���󷽧�����
��LӁVe3���Z[������ᰕ<��qz3[�8%��p���?�{\'��F�x��������[�,������7���
a=6J����s����jc�$���~�8�`G\'u�[�ބ�M��n�>�IY�T�>��N\"�/��Ӽ�N��֙!K��ٛ�8u����k�7�2�An��z�(Go�O�����1�	�Jϼ�����U(�rJVU�4�KV���ں����8pY��!�TQf՞LKJBp��]4�P�sM�_�޴I�$9�����=��:{�{v�\0� ���pA
�����^�r��\0b	`�sTWב�ᇙ���YGz���飺2=��LU��y�5�ĩ0Ru�&&j�����*z�0�EZ�Z���#���!�R�\\8�hܕ��4N0�h9S�s�ȯx��~d��Y[�_EM`��z����ѯ������R�mMМ\05xy��ֲ,�Ӊrn�H��
s3[�H�QUΫܯ��a��궈6Ss��*^���އ<p\\�W
��ݝ�sI9��)��%�Vm��v�s~��Ev���yzU���l�R6�j;��#J���*.ͥ�3ZBJ���-\0�� \0x�rLו�833\'���;c��j�6p4\'Qx��pxu[sQ��l��U��Jɉ3��qO��+0��w�VM�[�m��4�\\�Rk�Z}%S2�n�մ-���.�=:7\0��Y��� �&�
h5ZӦ5	��_��@�}}K�]��舨hM�Μ`ku���C�T{;8��s�}r�������Kh�*U5��rs��8�i�����s\"t��E��-92���ӻ���T�Э�]�s�8!$�3M��9pJD������®�V��LUE�̈ s&�������`��n��-i>���0�U��:Je�����5羔BM5�.ٙ9tn�^����DM�E{�j���\0!F���,g��N��j�.K��*�qĦ+��հ5>�Հ����2p����s7\0a�V���
ԸFh�c�!�L����R��M��Dl�䠠\0��T��Q�!����*h���
niU�;����w�
���Z
�sSY1}�K��JN���y�\\�}Zf̝ ̵-��u�ت����7�WWO�=u��GO���ѫ|1�o�pN����s�A錟�s3X��6-�P�f@:]������K��FV�$��T����$�Xhݺ?���ah5���?A�5\0#@0e]ݖyID}�
���K��-�M��b�ZCלsZwO\\b�$n�5��i9�����T�T�f��W�
��H��ּI�LE�x���Z��8�@%W��SJ���l*�d
�Q{���Ji7X\'����;�I�����֡�Ӣ��������8O@�;���p����E�k4��7\"mu/��{��G�	�ׯkv�?�>��\\bG�5�t��� �~�O��t��m�?}||��D������@	1����\0D]4����O>t����֦l�̺R�cUXQݚ5hm�9JKW\0����{NeDE�Z����u�Z�@���&dJ����r�*2m*�T�=~�4:A�{f�3e�Z�Fg4cq7�����
#�\"5E
xz���;�Fa腟�eC�����z�\'��-:��xO�����5�
�\"�(�%���Kc7t�m��x���˯�x���?�n�����\'�>����+U����Χ�?}rj˳g����YTO1\0\0 \0IDAT�a�|���ͣ�O�<q1W�H} wWuW3G
��=h�H`��.-@� 
^?��@ \00qC@��@�\'��a�F�`��)�\0@u�����;Qf�f�J�̢�������-�x�wG#̉��AB�un�Ʌy���#�kY!�8��	���?/+T�ݢ���`	V+1]#�z�B���hU��+?C6֘Ft��dd@f�^�AV�P�w��i���n�i������.�]��,î��x��x�>y��tw���������N{�O��?��o��������ݧϿ~8���q�&m�h��S���)��Y�	I�P�	�Df
n[��ͤ5�P��VKTFp��k��wo�F�B8��0�T|�����23Mӄ����B##`�R����T\\����Z���(2p\"2@��ۻ���HŚ��M]R��
�\04Ėy�j�ͫ���j)y�y3tt��o~����?��O��w���_��O�)�z�2v��RT�`�ZoP	<Ǆ�-����ȸjyBƻj����y���h3_eF�ܧ&Sk�q^m|Hy �tё�����z�+a�d?_�D�d�d����V
�|%D�.��ǎՠN�g�����?Bf��Hh�@0��l��;
�\0	�$rJ��\0Sx��}�n��ϻ�������>{��/~��n����B9AaG��7���N�!h�j��}r]@X���=��rs\\�-���kN�Gj����:6Hu |��z�2��,1����s���R[��1�Z[4w�q�qJ)��lv��t�kcp <�N�ӧ�r��w�R������?���n�ٯ>������׾U��~����kXT�|��:�J�7( �xF73@�؝��n�h�*�����{\\%2ѯ�?
	!Hlg:K�u�8q��=k��-�D���&\0_F<�}=���#���rCuU�Yn�u����zw������̜��͈��g��p�u;�\"�]�>�������������7\0�f�_�wÆ9�����{�����C|?1�\"ы��\"?hxv�^�+a�a����`�nk���{?ϳ�#��y:�J�R�m�̩�R��xj�fSWps����mUA�ԕ�o���Y;���4/|qw����d�\'G��8U���
��$<��ԿR��@휡�� \0��
���h	�$֬uS�۾|}[U�|�O��^����A����Oo6\"J�u]V��3��/��I�\0߇imI_9W����>�3��VA\\��
��������֪����J�UUd��\\��l��\\���k�.�4�]�ۜ��W�����|����q�f�]w���E�ݾ!���\\K�o�4!�iq`��檡�Y9vF-;atǢ��0�q��\0\0W$����Am��C#BЬMUQ��\"�#[6^������)!!������Z����ӝb��7�u*��%~�y��Ž�k45�
�\0\0�5��vh:�6��cF2��E)�����?��7��O��go^�9w�]I91��
S_D��eF����T��:ے�:@i�HU���N~���\\�G�n��
�<K+�o�<N��vs:ܦ�<���g�<5�_�x��r)R�8�L���V)��̈́� ~����f_���t-Rp�ڑ�!$b?��Wӫ�:��G�Y1\0vW����jtQ���u�J�
��o��(
~V1�!(`3o��P�CsU�&es���>y����Ҫ������Ǉ�=zt����\\+��tET.^��&������H�k���-�J��qRJ���z�/2��IZ�&�S�u	����fo��۷h����Z��z{{�tw�w����7�7��e�~����מ-\'�]_�|�z\'G:�ӣ~L�ۛ�?{�_�ѷ�����O��_�z�d�c��f����o��������Z�m;m5����\\�z\\�MRr`@�����k�
r\'��wUdY�Ҫ�a�L	s�?H�cG�癙�<yVJ�=�h�ߣ��v���yN9w}/��:���q$fNH\0�x������q��5�.���z���1�Yso
���0�H�o�!���Jț~l��������ϟ���WIO6�:*��ѓ7?�A�y���u�rN�x�\'G�����=բG���B\0U�_\'�k*Rt\'��h��<D��RU�TuQ��()�n�̀�n���ψ���/}yL�0%B0�&�θ̭�f\"�{r��M�;��Gkf���f�
�\\��yn��$H�H� qL�
������!�i���Ɂ��Ԯ��?��>���7����~�_�}����׷w���~���ϟ�η����������|�;��U�
�f��)p�a�Xj}/�*�����}���[�+��P�ŉS0m��O�,D��w����e�\0��{��y�G\0Ș�;����j������Y@�Uu5��J^�)���lI� V�!��th���n��q5b��y����n��9������o���G���{�6���rWIU�y��zA/v�U����&�\0y���\00���3����ܻ�ȸ�ѽ�-ޤimc��	�u�I0���m�L)��4Y��ݝ��PLչ�6WLM|^t�����-Ҿ�G�
����9
�#Ƽ[͇a�}9����h�Hn������G?��f��Ʒ���O??o�lR��+�Q�/Ƅ*U���Qd���h��z�7�����@���Q�ty��fbP(�P��DEę�V��t�ZM%��p��R�Cg�R���|Y&qq�Z�y�J)Qmǥ-�y0�곯֖�/_w�Ͽ�/>����߶֎�����o������Gw����r�o�B-1bW�5ȳ+��ah���!вn�z^&U�UDD݈��T��̴�*�,��٬�g���R��[����S���x��9��\"\"�D�3�R�����w�����������8���A̅P��ɑUu����cӡ�o}�7w�/^�]�������w�?������k~�T}(���eWwM���x0\'���>�~@����g[�i����T�w�w�5���/�\0��H�9�8���ZM#I�T\0���i:\":Vi�8�sк���ئ/f&F�w\'�y�2�_�}����O��Z{��M�[鷷7�a�7妠���La:���%\0dD3D2$5��lSYwM�q����3�)SN�6����#ƉoM���{w��L���նT>3u�q^* �a�V�MR�.O�ِ.���cҪ���ԿVLn�����d�p�___�N�d��n��g������7on~E�����4̿|���?��n�r?w�]�+Ĺ��\"0J�ܚ����}��5��.W���,��ďTk%�B+>�C��e�@UeD�	��֖�\"nDx\'�D�K�-�\\Eȭ���Ӳ��p�eYJ)�d�F�f@�*�u%{�������i��\"m�َ��nwW�~��ů�(�&��x�Q�iͬ1ţ�����	�����,u�!b��-@ɔ���x%BS*��.圣��Gfn� b�����$�S]���`S9���3wq�u����7=�^��Y�)�䙙���b2�9$qPCAW��\0}����=I�p<�����������\'O�����/^~��;
������&��UgJ��b]�k˃��Ǣ�^7/�u<�`��a�\'�.~|���)! q��&&*�9�Т�
�X��bJ�)%0o
F\0C���a��=���gf)Z�/�$����]�%S�\0�^�v֫CmmGD\0�4�a������]Ǐv����y��z����G_��I3�.��w���DT�T��ݡυ2no��X��})e���8m�����i��dP͖ր�4V������4��M�\\�+	�V\"�t�M<�skl̅r�%�FWWWO����w���(5��bf�F��=�$�!*9�}�s����e�\\R*f��%�f�4YJ�UZkMTgBB.��T�2���G3[����-��N��9��tPsw0s�(nD\"f����O\"��vm7ǻïn߼�n\0ʒ�aW�Lː`�M׏d[r��ڳ�fv�Դ�f+LЂ�ΐ=柆n���pu�c8�m�:��Y��zo}DC8N���r)�F��-QEp
�4р�# \'\"���<眷����RJ�5�Xt���9���Mc��$�(\0��Iۡ��,�`*���j	򖷛n(�z��]�DZ�\0i��%ou��Yٔ�v_��[�Y���t��az��0Db�����8BVrػ�y�,F��5`�9�����\0&43kk��h��E	�dw��u�$k-����^�QN�dSgE;�Z�KP���T�R:�N�R�����b���<�!U�Lf�4b�*��9?W�=@���})%�e_b�sq����a> pW.=!]|1.E¾/��F���=jDWm�3_u���
r�t/�]�sVG�p8{�p�d^��n�߃&�-��O�a�����:�E��PLE%e��R͈����x7�J̐XD���\"qu��U������р��ð����?z�(�e����K��I�d�zCs����#m�\"Q�m�v��#/v^��礉�Skz����_��Jt@#\"7����Ϟr9�EDD�����Hk�im�{g0OӪ��u���\0�h�-)dԠ/����E0z�R�����	L���������4N��9\'Ȝ����U���<�.WW�~k]�iZLԍ��S6NJ��=�{�ݻ�Ə��ϲ��Z�>8�)*:���L܅�,9\'����n3��o�_�x\"��{��(/:�橩RqCwc4�k>ɲ�,L9N ����z*T%�:�f�Up������Ǐ7�-&N%����7���p�華�\0f&��\0�	<9�<(s3%sPlg�ti�9� bF�X\"\0�Ь9�:��$�G�g���)}��\\�{� R�5&F4��q�у�+E����Kd\0U�)㺞�nkn(@eXEO`�a�PŖe�u��DʘR��x�c����j��5I9`b�d����E>�����Y�H⇲�s�4\"�ר�w���JrÇ��T��`ɢ�Y6�|0�Ǡ#1�\\��8*�$nL)��RN��Tq��2IE�EZk
��b30�$Jgh�ooߜN\'5K�2���B��}�X	æ��sS��@
��s\"!����K:���&�Ϋꜜ<���&�P���tk&\"6�v�M9CbGYfw|���/���*�^��\\:�h_\\��Lh}��.�\"U��*�9�_�J���r(�\")�\"Jh���p8����cڔT�i����+���M����IA�\"A_�A�5�_v�����z�>�x��}�5�ʕ̝��`�Q��Upiv:M7w���Gq˥s����n�ܜ6)C��p��}ɧ���Ѽ��bp?sBUm����ެ��$�ҔMՖ�p�%\"#��B7�u�ͼ�?��<0@w�LgE��������\"\"�v��Ȫ�	8�t��z�TD����R���D�����c��������Ix��#Ĝ���UM�/
x�̝tL4���#�bT�bnZ�A������x	!�w��������
�d�t
&`$@#\0Al��5O$\0Fj���M�����t<?}�ḦX�U�jل @_*%�R_rh���b՝���]�j��G�njP�*�c[�
�NX�8��ϧ)-\"\"�c��!\'�l+\0�Y�Y+Ԝ����C�Z�)7�)���/��6���׊�/YN퓮�Z�4��Ȉ/��s\0���(���^�/�w`�րk��\093�}���
<�Z𪎶�6__�?�e��+j����)5�]�1��zD	V<͉�u6AB�c/]d�۵�9��,����f��w]ץ�.糙�ð�l�>?���I�ȡ�%�� ��e�9�nX�9#�+�3�6A�Z)\"�Q�-AK� ��Ġ3�=z{�Ml������I���+?1x��없2���h��kނ�z�B�V�Z�V����:1�0�H�����y����������u�q��Ǎ�����c��������w��]Z.��g�6��ם�������k�7��s��_e6�(}��j!@cP7R��>���=�����[�!%n�X�.��c7� H���e�Ŗ%yJb#P�!Į�\0�}�������r�Z��J����o�[3��N��ab�)%U�cׅȡ=���	��n6[w��)-�p�hejAgNz}�	I�\"�:�+u���aSquƲ�6k=��?rr�b����[h�������.�֝ъ5�Uj��VQ��)@q�6�n[��/m�ㄎ0�������9�|3nq��f� dJfPT��WD$�DM%�Q����f����)!���,V.�iBzuF��f]�!\"�W�����Ve�J)F@�j����R��R�
D��!t���:�)3B5c�E�ގ��+������s:}x�Mo�
5i�7�|{�.8��- �e���W�̱Z�K]LI��Zj`Ke�<%�|��7�}|*�:�bD4�#���ص-$�2�V�]�W� ��^s�������p�-�UO�e���
e�4�!P\0=MS��ǧ����|<�y�1�CJ��o�7�}��~���s-&��99KD�\\��(�$��!`b�MQ=
��P�dZǧ��
��>�χ�%��\\1OE\"�]�H�PMЬ\"\02�Q�Z��^uT�.��[��\\N\'� ��LV\0���L����zrچ��L�W�nK��k\0µ\"\0m�y{��T��
�2�D@M��sI)�e9]\"j�.�^N�������$J��T��a*�t}x��������6>���f�x<��{!pP��H�U�pb_Qb��K���B�3[�q �/��,����8nc�̭#�6�tb�+����qM�U2@���KK�r��E��+��f��j�~}NѾ`����#��#P�꘭*�\"f�jU����2�i����T��L���.v����%\0���;�_�MJ\\J���K��U�(����Kz>�D	����܍�m�n�n���:���������W�y�zj��W�)+*
i��2������!vQ����xpU!.�j�Z+��C���͛����ے���]�r-��ޡ��
V�ټ�;��7	9�Q��!*8x�2�n��m>O���|>c�E\0��k�s5�XS�����kQCu8���K}q�����֭5j�������v�Wk��|���?S�
����%��<��Y�wc��m�>�ƻ���~{�C�5��\0�b
�m
j����p!���.��{DT�&a��c�
���E��F5i��i��u��=�W3��D�����@\\�֪���Vp���O����؅X�v�\0�R��r\\�L��n�4;8�r$�M?l������r{%֔��aĔ�%MJ \"�m�kD䈥��:���w�;���RY��!`��7�)�ϗ�����S���8U$\\� ��P�h���)\0�9��)���M�y����
�\\��0SU@����YU���+�\"�\"�[���k���6W���ZX}�Me�ʭ�@��JUGG�. �H#Κ2rV-�|���O>����o߾�.&����������y�A��Rj-�v����ݷ�y�p%L�C����W���6yh94�uQ������y�/�
l�F�PK��r�.j-�H1��~x؎\0�s����7ܤ$�iꘘБ�Z�.(�)�\09�\"��Z\03\"5����x
��vw7�Q�BTM���\"DQ��\\���v{��lY?��}�8�C�\\)pi� �6�f���(@4lpDҒ_���e�����գx��7�l�]�k2�<g��g�iI����O�s�:�ps�{{���Z�Tj`\0�n3͟?^������� C��m��$DX$�V�9�ú�� m�f���xz���!~<����M���d���с�,��П�Կ+	E����W�����Ex1N��^oE�V1����rxzz���p8@1\'\'��ӹ������>?-O�m��4��̿����߽�{���ԅ0��\\+�e��jQ-\0��ZZ�D`��-��iR� �u��ѽj�U�������v>�w[S%f�\\�L��cO�-��!�=N��G7x��Gwϵ�RUP��Ȑ؈!�a���jjͭ�@_5L@5�Ttl���nA�� �-ZK��qR���`Q��t�\\N�sJ������������f�H�j���C��p��y�Z�য়>0�Ǯb��1vC�|��D،\\��7�����@+Ĝ�����|������l��3�l��BD�fUKm�?�ħ�ȳ~�&|��M�2��Q�8�i���>����\0Q��芟��`��V�B��r��!��L�����w����w��*;:�\0��H(�h���\0Ā���+v�Y�
�`
���nfN�^�VFN`�l�9�Q2*�Ӽ<��ϧ�<ϥ�����v����n���Z�j
�%���x���6�������4G{����)!FruR���MJ��Q��ڸt���<]_`k�U�P��\0V�*R[��tq�ݟ�e6���|��i���m��ۻ��IUKv�mA0J?[�l����wo�<��?����i�R�)�He��k�KZԍ��}��,�Z�%/�����Q��p
VܒYq��
3x@�0iIZ�����d�M�����0�#f*�.K-�@$��13#4����##v}g���]8�*�z�E��M��\'fn��hN�d�C+��
��(-�w/__A��>��?��W!\'�l�YS��}��!��(kХY�5 9��a\0D\"t�b@Xɜ	�ϧ�O�R��H��h��\\=��PM��` D�s�F��lN/�XW���4U��ɽV��h��i��q��.�
�,���w��won�U
�PrOơCޅ��O�����2�i��,KJeb`d���|T���Cl�Gj4���b��
��;
�-����aô���������lY�2�֑5C*�Y����	<���2����}͆�j-�Q���z@�����`���S_M�A��\0�w1 @U���Ĉ��p�3ng����������wr��}ׄ@s�����Jǰ6|Es ���W��5 ��/ ����ܪ33����>��<<��ܤe��ӏ�?��1t�l�n#,3-��7��
��l�`H4�]�i������BLjP�OUM��@l<8B�.Ƭ���n� �̡��D�p�>U�⩪Z>׊�������%3Į��5N����6a��5���O�T�F\0p3D@`v{s�s�psLu�l$a��%�j�\\�fJ0_2b��������(�/��R[�81�;���K�b\0�\\�pAT�
	�����u`J
��9t]B�����RtW�
��c_�ή�?DD�2����
`pf�N���~F��+N��Y}����I%\"so�.�nv��
-��Z���܄?!\"4T�9��WEw����kk��za0\'�F��)Y4�bHP�3bes\0x�f���lV��\\u솾� �@ff\0t9��3��]#�i�9g-�]� &�*WӾ�����_����H+��YK�Ϗ��ۓ���?�ݚ؉��*6�!A\0b3& ���	׌s47l�@j�kX�k�X˵D$t�\0�S�B��\\�r\\��9�5���>t=��6�<�&����Wc�m����&R.�~�G�O��t<�9lc�i�T%�N+�ĝ)�Y��n�(�D�d�͵��~�����\'M/G��W_>\'bk�°&9���c+-\'���ņ=%jr��]��f�{��Y�G\"���P��By��`�U-����h�\"p��� \0���{m�V��F
�-vS��	K�1�\0���-x��ḹL����L����Hc�1F���C���ؕ�h}�3�{0dgQ@�1CkAz]S��Zՠ��[\0E�]���R20n�b��4O�e�7�o��Q��1��Q\\������
�N�D@^�+��W��!�tnc4#U_��7Ј]���V���ڲ\0�\0��]B\'�-�f��#��#��;���]@�$P\0r+!�������[���@l�q9�X��]*�ȱF��Zj�X\"o���
@+�@��
�f8�*UPU0�Ή���g�c�R@��V��t��9b+5T5��W��2�_viоW\"@Fe%�n�����bkDEs3���AkhK�50_�*7�-�5x2\"��iFGӥjYfs%�
 3\"��L�,�]M
���n�ٷ���S�ŏJJ�z~�B*�����������ٖiYtYU
~Pc��ю���@�����An����ɩշ
�TK�b�c�5ژV�{�ew�J��ND��26���#^h�?���)���	��5&���uͺv�꾨�Z�{1UF1\"[]$�:$�:݋����>]�ȝ�m��U\\���<������4�ó�-\\j��(�2��w7����$$\"!Cá닣�RK1�3sJB�t��HQ���ɵsOK��V�$?���AB-���fe�W��� )�:�,� �m9��j�R�v~O��G���3*L��T���RRh�ұ�LfN\"]J�V�2K!���6���v:�N���0���R>�\0Z�-;7w�G[��,�b[���A\"�n�V��^�?�1`G(��X�M����@5���b���q!jqM��Dn6��0�?~��i�]����
�7���\"Ȅ���9l��m6�W̌~Y��;�̵*%�٩���w�W㰨��R���D�	]�bDD]΁6N>~�����j:\\{Y�[>��e�GS�n5�ɸ8�6I>q3;�=sYv�\'��:�h�?-C/k-:2JXf��J;�g�[բ�[u���L�f`a��s���E�M߾{����_^]�׿��/��\0�[�%��
�.�=���Ps�	_
��|vp\"g+�#���ғ/���y|O�ue�Ap3f���?~��f�RJZ���ĥ�&��R\"����K|����GɝRJP�f�K�|��׿�-;��j����pQ�U���lI�m^m�=�⋻��~nһUC�
H-��!G�� z���=(D��j�phI��?=�%=jx��
��\0ۿ�� ��u�5KbX�4�YR6P��	��Y�OY�KU�K�K++��S� �n�����m��5$��S�5jA�
����c���k)<�UN+���-�8���7���W������ͺ��\\�m�=k����ReہP�$cA�XG\\փ���EM<���v���z<T�e>�c�_c5+�Os��>u�g��Y6����
��Ě��L�M1(Z�TЈ�\0\0�IDAT��k]�|:�ڇ������U,O��ͬ���@���DL�� 1��Y��zf�x��E�1޾�a�8�P-s�F��sJ�P\"�h�f�l���j������?���W�������?z���� ����
RC%U�
7P��4J,��\'o�ogk��sf�vn������\"2MS��$���՛��>�;=(,��&b��vd��d{^�N��l���^�
_s\0}��9{ȹ��8fmJ^�)n��I
vC�p��\"�Mh��A��DК���0��࠳0�z)EK!��aT�t���dQO��,���G�g;�$�Pn�U䗐�mg:��qm=��NJl��8��l�8^ku\'�6�o�D��� 	Jd�it>�K�t�g�.Il)ː�������k���(���9R�I��|��]^O�%�>\0��]�G+�޿�4�q��̮P-�svS�.a�&���K��S%ӈ�]ר��J ���+,$)Y)\"�ut�UݝDJ�Ow����0/��w����wPmc6[d���̲[��n����+���aLc���)�I��03I2zJ4 W����_���o��_��աg�?~�2��\"W�ɩ�RJqJJ��ޠ[Eؙ�b����؎��eV����v��[�yd����M
C;��T�מ���]��:����t�e�$��y���]�;\"@\0u_}=�����R�I\'�]άF������HN)y(p�����m�#I�ܒI�j�6�X|tqi���#`Z�pr����U\0$Ĝ$@\\��B6=L����p8��{�\0*e^O,\"�Er�T�|{\'\")%�9�*̢�	ݠmc)_�T(�EQys�{�Ot�R�s�ѱ;9�	r��ܥ�t��)���ڥ��\\��ǡ/�h]ơ;��-�;8=�l �9�q.��Du=
�]\"�����,d�;��[��x��WGmا���X,�c�3Y�MJ�&	\\�&$�8\0��]ȝ ����o~����m]J�E�k9��An��A�V���ý�+L���D)�+���ڗ�O���G�]S#�d�\001ĩB��H�
-�̴ŎY�.�s<�w��Y���뫫��+�����|����~D$K�\0�^���y�>�����Z�YC$,�v���͇�$r�.�9h�y��<��<�����R�0��olf���_X�ۙ�LGtꫧ$�t�x���
�v�ߨ�(kYb��Q�b̴%,��2�Z?�p��.���#*�Z��g�eY�l��nW\'�UU%��
:���2S���O�Ķ=f?g~�y(��S�ߣX�x�1����#����`��x��݇ah�h�O�>}����^�,����Z���M���,B�f��k;���?�)?�Ryu�twUs%@=�ߏ�K�4I$��`�r�sW������y`I9_]]��+j�Ug�/p�n��{�=_
K���r�=ș$�Jq���$�U�X��
��ª����yst�d0`�z�y���<�;cx��} s�@��Vk�M�>5��1�1��;Z�%Wy#}�J�e@D�K�����@����\'!�yh�٨	�û\"sӢ�9�+�>e�F�#w2z�굪��������R�)nG���oq�7�	Rr�G\\X	�����U����h���Gc��RJ�p��e��DIg�O��o����x����$����b���e����([��7��)������W���>I�`!�)7s(@�Ki���P�����M�t�@H�BC�^��n�
I.�������٪2(��5�䜻��ÛmZ����ad\'�`n $v�n�R��\'=�[�䁦U:��8:���d�6�o��Bd��LK���EX�p\'m򗘅؈���h�t��������]_]MӤ�;���F7�Dq�OU�����|��M;��/�L�}�c]Ɔ�?��9_J~����}_�qt[� L̒�7oTuY�l.%�l��Q��i��Lr�DTJ)�Q)%ԕ����GۂT�9eNA7	��-q�n�5�N�$YD���ݽp~��ͧO����noo�6>������.˲L��]Z�X�ށ�[b�9�(��Qd7T�Քpw��ܻ>�j�g#x�Q�jV�b��*\",D�SJ���a����-��w]\'i�N���p��w_�y����b���pM9k�Ci�ZhD�6�SJ�2���N���b�f�{8���e����[��f���Q��X�ׯ�v��\\�n�6��gs�Y�?�e��)
`o�+N�t��E�u�����:WO9WYx�	|QW=E3�c�{zjL��;�C6�MV&\\|���g}CukP5�I��ID5�fỈ�4M�<ץ��O�ww��	7T2����u��T!&ϹG��<-�4UJy8�|�:�����ҥ�+���
}��(�(�֖Έ�I�	�I�z}���f��j�_��\\�2M�4M0���p�Q�@$Mq@�{��j�p5���W�|!�8f#ZɑX:�.����i�� ���Z�d�0��;���}������ �pNd�\",RkeU���t�`��CDHi���N)z!��%�m)�2!��+U�\0�h�y�2u�?RaF<Q-#>�SG��fw���߿ϹKı��1� ���O�δ�h��U�Ͱ,�<��K4��ƁG�*BH�Y�0=��kLn�I���Jß�ic�NP�U��Qy@����Sہ�e�ʲ,K��t{
0	�y�j�>���!ra����Y�E�I�%Vn���D|�%k/u�A�������n}}3y��M0	\'�$�N�Զ�-@*�=@����j�8�~ys{{�����/�L�D�*7t]^�m�ؖH�l������E�)6������z���g\"���x<��<f����K�u��R�R��V���ԭ�]Ř����Kf�S��]J����T��߾��0�/o^�z�����8�$&g�+��FC��np�ȴ3kT �8M��7�ifF�����s&#\'\'��0��;Mz�>�]��:M�����\'���:�R䋆��*�v��3v���
�f��M�F��8�IX$�sΔ�p�f��k��*5�z�D���ӧ������Jm��L�sbu��}J�@{#:���hU���S1��
fb5�Z��bK����������~ȯ��/�ʻ�?2���I��1�!D$]�+�cY�F-Y�\\��+S�˝s�@�a1w���Z+�CDO��zm��v\\���
INSERT INTO student VALUES("KICTC-CER-005-2020","Amani","Ivan","Dayo","ITT","BT-ICT","2018","4","kweka5@gmail.com","�PNG

\0\0\0
7Z�i�F��M��%�����ށ+c�fA����?���7�W%�o?bŸ���a(s��U$$��:*/��_��Q^,/̍	??��%|Ֆ�(�D\'.,�~z-���!�م��D(�TB
md���A�2�F�Xn��(��RJ-VZ�e�Ts-�V��aɲ�f֬�h��VZm֚k��{K��z뽏�Cw|zp�3�4�,�N�m�9��*�.[ͭ�Ǝ;mpb�m����	�R:��S��v��R���[n�v��w��Zp����ןg-|g-�L�B��5>j�}� 8)��9�qS(訜�r�N�S�|�tE���(9;(cd0��
�O�B%�d)�^-�F��c�@*�uM�����k)�jjmǹ(��Ξ����N��纔e�tv�h�����VH}�|�E�ݛ��Ըi�Dz��k\\����
Y3`��[*\0m�]�aӞp:	�XpJ�����!vm�[F�w����<C@{� �*���H ��EpN�7��е������M
|h�1}�D��ƌ�[���q�ȕ�i+PlF�s�E@\0�;D�Г��Jj�CP�Nba�@*��:��ZP8x����2]��A�EQ9L\'\\.od�30��{\'@||�Ee�ۨA`��)&��i�g𫃸�au\0^܅a�kܓ�opa7��p#��|U(�%$�H�~�b6��.	`�N��Z�<j����0��[��\0}\\b��*o�N�(����U0*������_Pi}���w����\'�r���B����ݖR���	u�\"ńJ�j0����Q	d���4y#�
o�7����F@H�6���HX5=��&�����\'�o7,���Z�Ú�����<d�^��ߔ��7?Z�p�W����q�F#Pɭ컵��n�5�)x&�Xȗ��p2�	�2A~�B��f������і����h���C�7U�@�n�����ď(��7��e*B�b�A(��%��I�4~���L���2�$�r��<@0
# F(W�{_��x Ԥ�t�R�XȂ�;D��M���mzVPơv���_F�)�\0�R�;oH�dF���1P:\'Q=�_�4U�%j��O.Ig�p�#I�<g�U@x
�E��&F����Ċ����r�Q9��Ӗ��d@!�E�����>ģu��	j�F�	,r]��N��zD�1���s�~���R�&�\0а��J��K+�3B�;���o�n�����
f���~�G��<�e�l��2�v!*�*��^�>��xt	���QY���N���Ġ��f��_f�İ�2��T��1DR\0_1�8����Z��n�֦��-������A�\0��q�ټ�`�(�L�l�AӖJ�F� ;��c�;6�Ι���2�̩Z�����I�\03����V�f5�l�I�i=�n��AK@dpf��%����I�`�b�r����C(ѯ˃�]��$e�G��1��
UFo�p��S�>�{:�j���0|��hK�A�/-��>�P�\0N�2 ���I2��)�IKc�b��Ԝ��\'ĎG�zH˼�\0��)0�m�Au/�G�b��C^�	hh!6�l��ڢE��x�hg{�^�J�����_�������&�Y^�Z;Fy婵�J��D�A�!tM��\0�0y�t��\\p[��j��N�-��T��@љ�~�-�-�Ĺ(�PI]����U��P�Bq�c�:D���i�[[:��|ƾ;kt�AZ.����ư:��0�n�8$��z��w�\\��������~���I9�8�;R=p�%0���<�1POv|����s�ǐtU�i�9L�9BԴv&��z��т��Ժ\0si��c���@b�+o��X�.01?:o��e�s	�J\\�\0�؀4-�o�a#P�5r��=�a��q��1<(9��`2��5��5�����@�T�iq>H�ѷ�3L	=���$����!At(��@�\'�!�Tk/��$�x0\0��s���[t+w����Ț	P�E����b0B8��\'1B�4�x
<���\\� ���G1(ZN�lQQ&\'����0���?�f��V
�4�b\"�Q��	ԅ��~�#�2M��@���Ȇ���A*�C�X�;ь�Q��\\����.�����;a48��s�[�Nhto�%�:��4EĈQ�`D?̡IM[W�H��E��`\0��%+ׁ\0H1���xF�8�\'�8Q�s�x@�L��H�1HJgISc��%ti�����ͪU}$S���6je�]����!fHJ�!8�Y?J�J}4�v��>�G�ަy�`dNK؇P%���X���y{A|������=4~p
Y�頤��v�:���jQ��dWxV�hk�L���
	s9ڜ��3%.lr
u⇢c�R1 ߦ�6��ZŘ��\'d@���zZ7C����XH�}�</�V���eȑ�L@ㅉ�[�ô1�v\06�K����{+�&\\�h�N���IȄ������	�K3l���D;�M���5KC:\"�\0�k��`E�pHuFzÅa����hT ���.��\"v��uP#�6}�ld�h嶁Z��jN��,}��F?�Ǩը*@
�[����0���h!�D|�����W�Jd��8O���Ց���L~T��+�%��|2m�+�th�w�?�4�2:���q�������Re��V��
47���,��1P��]e�@�Q��_Qͻ��.�	��#4E�֬����U��� 	 =�`F������KJ��E�w,�*48x��=��a\\m�W,��En�j��c/�?�	��!����U�lZ������C��h	S������P�����z��-�1�i��#Z/���-�q�!�����&Y�m�G�C�@:����#�c�J�i����ؘ:|F���>�꘎�P�<M�&� ?�0}&��ԩ<P��:� CX��uNկ0���ή�;�[;$��9��33p�y��uNw�c�[KyG�?�?�7��*�xi�	�JS����,�s�m?)¦�jD��x;�s	�1Y+�8���o4\"�ҕG{�/�}dM�~7\0��k�W��x,W��!��K��\\�V��\'�Zt�VϷ�2%��]�H�1h�ΑkD�PaZ������۹���v�8��~�F������b,�]�F\0f�LR��]*�����/�N(^k#8�ݔ���\"D�h��C�/�}Ɇ�8[�C�ޣ��K��;A���7�
��P�9ߦ�k��;Z/-���]�T��MڠvIP�}��8��Gƿ�WԖI ,`4�Ng��;���|1,�R�x�>���]�ʣ��F\0\0�iCCPICC profile\0\0x�}�=H�@�_S�R*
v�␡:Yq�*�B�Zu0����G�����b���YWWA�\0qrtRt���Z�xp܏w�w�\0�Qe��5h�mfRI1�_C�#�B藙e�JR�����%x���?G�Z��g�a����S���y�8�ʲJ|N<j����x�ƹ��3�f63G%K�t0+��$q\\�t�r���8k�kݓ�0RЗ��Ns),`D(���*l$h�I������?��%r)䪀�c� �~�?�ݭU���\"I���q>���.Ь;����4O��3p���
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:67fdf4a2-fdf1-4682-a65e-898f936203fa\"
   xmpMM:InstanceID=\"xmp.iid:f22840a6-c4b9-4a0c-bb4f-650a2a0b10b7\"
   xmpMM:OriginalDocumentID=\"xmp.did:af97f6dd-9fc6-4e2f-8a1d-6163c41075a7\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1603715194012001\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:407640d6-3e3c-410b-9d51-60edd176697d\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?>�ؚ�\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�
!�KO�\0\0 \0IDATx��ْ$Ir-v����GD.U�=K�0 �����|���W�K\\�����p֞޻�*�X��T���U��\"S�N��̨��ψ�j�G��?��_�s8Q�\0P� $ ��A8=� H�$���;�h������������pH {�I�p0�O$B�)mO˨���Hx:��f�$\0A�S\0�CЃ�� (� d�,�;z�W!�\0� �������h�d���!?8�>���\0A��-��;�
�1���|�p��G�����y	`5 �΁�_���	�?�bc��ՠ��L�z��r���ŜH�3>�Ç��8�(	��Y��S��������#�[lyg�t�QT;`H������;$r��)�\'B�#��F�M4�������ЀTA�\0��/H���!��1������_[�قt+ ��2��?�8��g��I	!G��\04L����
��G�HGE��:,p�Dˆ��:(>�p?��Ud��*��`��C��}����9��s@���8c��\\Ą��B���@@��ڃ�#	g8��]$A��[�pDs��`�C���!x}��wX��G��(@�D�� \"�q���!V���~!7� ��
IR07�E�*N�h	p�Q��#��	�?\0����n6w
�T9����Y����D�E\0�pCd�ns�Ir?HV-N��=���r��!��xP���?��:!��n�ϳ��G
�\"�ɑ<Kh[���\'�*����Z�!�4MC�������
5t]�V�~��-�.�����d9,��i���W_}q����������?��g�~4d�C�!�0e��Φ�������8�=� ��oI���()�֓��N�I��jx0�-��q�ժ�t�^_޾����>��&6W�J�Z�(S\"�a��tFD���yJ=D&���0�FQ�e\\,�\'��R���P鲎�Z,�8.�~�&ɩ���ò���2�j�����������gy���\\���ոe���Hi�07SU
,3�e�u	�Xj)��-ۂ�:�
�ӰD�����������?��Ջ�i��JR_,�[�0�0P�VB������8�g�h@f��>���-�!��1��r{]o>��������������]�����I�*͢TJ\0n^Q��II�eP��I�}���V���	Q�`�AJ��ITj��F)E�NÆ܍뒴C��ժ[-�h˄�Vk)S���RQn�m��l3^�}����N���g?~Z�WQ�Ő���q��~� \0{�G�̵�!B���A�~	�Qզ�5�i�������Շ���xu�p��0�Mk-��<:�033��vQ�)���S�B�|r����r03�[�N�\"LT��]����6m��VǤ@��n�DR�g��qJ�$Y5V�E���;[�b������|�9�ˋ��o:��\"��K�AE�b�р��Bx8���<����>���Tg6�`�=@;�ڮ���7y���>���ww��毟矝

Kt�%$J�AJ$��\0�������FA�
���s��4�&Gk\0�}��i� � �����A� �H�f���4+�N�T3�Wg˗����O_���S���,N�9U�f��\'��+���;��O���߇�٦��eO�
u����?|����WqޯԖئ@7�E���e G�D����\")�Kר
�F�APB�!��������i�Z��~H�
,ڝ�Q��p����\0F%��5%��G�0#X���W���n�[XR�DO����L���W�[���p�����|aX���-\0�G
����b#B��٫��;#(���.��(�����/�xU���ߝv�/K���@-f5���4f�O��H}l&���)�fF\'�;��˯>���O�<�竁��j\'�e\'PCTD�e��F;BA�c��4lh�
RHd�v.��[+�㸻|Y~������/v�N�NOs꧲��65sv���w
�Fx�Dk����\"4o1>\"��|�TE���Nq��.�ȯ�|u��z=�����b�j���d�e���%F��;��O��*߬�bo�lfI�Q��Vn_~��_�����
�f�M,мu��:HD�⨙���DYv9	�샡^]|x���?�z����(c�û|HA�բ�]$�ژ���jX�=���u�����ǿ{�m��\\ק)�Iac��uIo�t�FhXBUھ��9�΍L?
���ώy~�#�|���Q�ێC:ˣ#H��^�2�L��.�Br?_J8a��B#�F�ǭ��*���2M�Jٽ��i�ՋO�_|���i/=c}}�l�O������5��커u�,�D��6��Ͽ��>��GC:�vY���M�J�7:݀�ᵱ�T���H)��&IR[y
��.\'!-�	,B�
�T:�RUU�ڴ��*@[�ژ\"�i��0H#�{��(:�G����\"I��u]y��>����s)�7�=����a���w`�	4xsO$)-w��
�1K�\0h�5K�ۻ����߭�?�?X��3����IT�晰\'�~C���P�+,����Wt��G�r�f��ӕP !ghZd���JJ̬����7�J<9��̃M5��~9Ҁc��Q:D����e�<\"S[�b�Ǵ�4v����/��{�a�s����D���Y�X7닏ן?��_�b�R��9$,G�g��F��T&`S��\\|�Il.��q�6;Q�t*!l�GxB\0�
`�|�3R�\0�
��7!UYE�q}��������]��,))�\"���%�~4�B�����Oc��v��u3d�\"Q�@�CB���;�C��9���I����3�u�[1
I�y�O��R,�s/\"��\0���Y<߲R�~�@�&����\"�NB.��ɾ�\\azG3
�\"�M]j��/f����	�Eڤ���9���>���W��b��Zv*ٟ��w�i�F�I%��|{=h�\"�+I3��������Zヲ	�+���7�{
Er`�|ys���*������T���{>*�
�G�H�[�6��^���Zk�03�i��(A�	2����9a�M`�ǚ����EH���:g�LݰT��~�����d���T!n��H�`���Qs�~���5Rv��\"�z�T{�vCAwoJ��Ԗ
��*\'	���7�?����T|��X���a���\'AP���;��OR6�6+�$��:�Qk�g��QXho���)HJ|��[�L!�0Ǟ�ߕIUs�A��������b�x�4��Sz�\"
Umkz�9����QUaj�RUє��,��EM)��?�j���9��I�//�ar�n}w{{+\"�|T\"\"0����2�y��eƵNs4�6����s�E�nn�b�ہ9�����@w�`\0�\'��|������j�\"\"�����E�Z�i�`�bc�c���GHP�����9Z;��vR��*��7���(�������Q\'����c��A(�_@�VO)��TUk��7i��<Ir����~��-�vN#��6��}�m����hi;N J�)��l5*೏�0��m�dxk2���g���f7?Σ�PK�ă��`7\"ݻ�>�j~�Z/�}�BH}��zQ��oz�H)Es_,�,�<���K��}x���V��}x��~퍹�\\�0����豟�g(L�zZ7�UyM������h\0�b�{X�6ꥣ%��
5������`8�H	׹�(���7��u��[����)����l�q4%�֪���y��ߪ
�[�^��������2,\"���Gx`����4�jv���J����akd���{O
%�frMX�Q55�~�aYc�ݡ)G���A�G���v�kz^�q\'^U�4DA
��s~���SJ�l!߶�;��vf=�Q\'�z�ZG��GL����#��	i��A��<���2�\'��w	��)�{��$aE�&��E�~���˂��u�%��pP3ߎ9��ほ���:��3`�R�瓀8n���ݽw�>zH&;�F�F���C�A��{�φ]
fI��)�ր
���͛tңY�{����`��D�ϩ��J)��u�<ɀ8LAU��B��< o�+�Fc��h��1���>�����
-��E�4MQjDhN����e�3Ib�7i\"����_BI(I8M�A\'DD!Y�
A�F����L\"B�[J)A�ꫯ�����v�۸,������������Ü�k� �x��w�����	��7�����X��.�Mq�t�wJ�q��ʣ{�4��3|_o�BB��� ��\0���M�G9�kx��FSC��j�E�xP�J8�駜ap�~\0�	��Я����޺��B{cD���6��7W�G�����d�f�t~���z����=|�Rj�i�t����֞�Ubo��X-#«�Y���a?W�ث�ڬ��Q��\\��3���tn6
k���-��9}�g�0�]�ģ�:�m(G�����a@�l	BQe�$m\'ů��q�}8 ����͊�w>|i�5����*s�9gU
XBU�SI�5��{u�U�5�ݱ�M���ZEhjV�i�LI��h�	Mu�Gy+D�享M� �.%�+�B��,nP�S8=T�`x8���QR�ɼ�Z����T�[�\'�6;���O��{���T�4�\0\\̺a����73T4k�@��l��@��P!!�-�ی��j�p�Gج�~����>�X#�Eo�V��B�6�4���4�`�=町�Şq7�^��<==A�u��W��������ղ[-��r�X,���뫗�fkf��&�֟������8�Ξ����]��?;�l6�!M�-�O\'�n��zI]�f3֊�\\]��c�^���s�i7�m@\'+�^_�e���;��\\[��zw���|ݺ��i�Z-�-�n�������
u#b���q��pP=B�.�i�U�É�S�p�`-2Nۛ���_���Oq�[¨�þJ�Љ@4\\�]4�Z)>����c��2�m[�t}�s�v����uiXgK�m.���m\'�����q����\\��m__\\v]W�~U��5�i���T�]�:zM�7w��%
 ���vכMuO�+����^^^{�_��l6�4��ު�b��֛;U���rʪ-�4���Z�T��4,�����:\"���k��%sfT���2\'\0�h>�+�;��W3�M���V�o��[��nכ�f��o��X�t�Z�$�&�q����v��d���ɠ�U��a6S�~����g2N�l����i�n�q@�$�9�q������Vw��^�4�r�n��\0\0u���
U@�g��J���-��u��)kb�f�\"�h����1��{-�T��]�E������u�*�}ְƳ��:�׻�n{{[���䵌����6�~}{�����:����Y�U�e_ǝ�Q�ND�g�������i��U�^�+�VJ�jٮ�j������엧W�R��.\'�i�����2�j;7�H��)��;�nn�q����e���[�ה�`�m�[F�+�
��0VsO�$�� �	����%�Ҳ���51�����MoQk���.���p[,\'\'\'��K�J���s�~4�.۳!M�	�KM^������Y7����z\\�)r���{ݩ��]+�O�U��������V���Q$�^R{wW�ţ����<�:nw�ipsu���K�;]t�i�{}c�!��,��g\'�Z��!$�y�X��\'���\'��o��ͦ�#</t�ʼ�]f��6�LC0
�΂H�
��9�䘾7u+}�wս,NV=����W���b��,kE\0�j�x͚��>e�\"��f�Y_���g\'�?vr�RJ)�֩z �#-��*s�&w����������EwS�AC|��ū�����ۗ�}�����8_�}�������Ӥ�n�����OO�W�ϩ\'��f�L^&�)�!l�]W�$���˫2������dB�d�*6�i�T��o������������tX$�۹��X���{�*-;x�u7�n����:U�ʅ�W��r��:$�y)9��i�^,�ɸ�\'��;@�J)b��nf5\0j�@���
T��4%��NNOO��8����z����t9�E�u����Ț�<�1�t�$yZ���b�p������V����$������w�,;���Xk���%3+������&��eF��ؐ,l���0��3�\'��\'À�\'cF�fH�\"9M����yn��VD�a�s2���襛��du��u���q���+(EIp��s���ד��H�\"0@PJ�jZJ����B���z۶��j�\\6MS���S�����J�1Â��� :��]�0\\�*	�������`�u7K�T������	B3wsj:j�L�Nf4G��z�D̲���(�q�J�]Ӥ��4\0L��TF��lc��;;�TM�O>�A�|p�2��+R�8_u���5�J	B]ۖq
�%�U����H��=WKgc��\02u52�����}V
 3Us
��&�aRŐ����jE��T&��Y/W�Xi��dwUL0�.���:iKJ1
�[�\\��j�X,RJ�9��gW۬��A�)R���!�.H#��O~���b�n��Z��&�>:E;
����*�x(lS�vQ�h�T�Ԯ�LM��$D&���dD�`\'6:yL�7?F����G�¬ PIfp2u�6�%	��\"��k����|x����Wӫ�nb�ޗ�+��`rW�����SS� �a�09�y��O�~��l��׏��^.R`
ͫ����f�����?����z�-��{��&�7�~ks}�\\�x�b|��gO�#���Hl�\"�X��Ic@���q��m�jE@-:�~����B��9��L��ӫ��^{muv�X�-��j�jR�����O$�ϟ��ơ��Wג�b���f٤�}�IӤ��Z-���E�8�o�?��2�v��M��kDbx�D���J
�	&�i�z(k��/�������C�|k�=���2ֽ��X��6���e���g��W/��U�z��9X�e6�2\"
�\0�V%o/�,>�i�tc��}q&[_P��[����a\\&&Sv\"*F���#S9�c?M�7s�^���O�<I�o��v�MV�����~�nM��B������-��u�|�`ss�hϻ��G�4?��?����/_Z�$��O������% J()�f78�7�m`�y�<�ڌ�������P��.������z��������~����_��_Sn�����;�?^�����g�����o����?���R���i��e���<{vy~���7�?C�!�$f���j�.HȂx�Bp28�\"5������8,6[+
W;
CA�Q�bu�n\"���b9kVG�Bj�5�Tr�m���߼�����3Ok�d��#8X;���MG�_9>ZU��E�,9!�
�`c�!�Д�]Z^}��>4<n6W��?z�-�Z���bD�pa����l3\\����Ã.�Ϙny���m��w����׿�;���{/^���n��E �g��?������㏺�{�������7�������������������Ç�� 2�:�S��\\ș\\�\0k�i��m�1u-�@DU9ȋ/����.��ٳg�4�����8w�;����~o�ټ��+ڥ�`<�8;_��������?�x<l���\\���4fEmkJ��!J@�l2
�y����AٙMu��ʷ��Z�|&����q�+H�Ш�݊�:��&����Ѫ�R���ķ�V�G e�h9���y����\'��i�m�?��]�W���T���1�)
�R
RU��0fU��G������������a����7���;|Ǧ��O?�w7g����Y������\\�|y���gO����>�l6�0-��D����gϞ��[�c?t]#�&�E�mc��g/�`b�.5����0�1!0���~��U��/Y���q������~����~���v�\\�>��7�W/��ƓG/��W?��G���������l���AB#�d�e�H]�@A ^���P(&f�c�F8��Ї�*���pE�.kҹrR-D*|�zv�9�7=F��a�`g�����s��t\"�	���yuޠ�15|���W��ϟ������N�e�QR���9Q��b`�U\'�,��-��
����������/��?{�����[�g�_�ك_{��Ǐ��ǟ�����o�i`x��X���7�?z��8���Z��!H��n)�`a^�WĨ�\'��
�FnL��Ft��JLD��b%����yy!d00�jў��ԄE�5Ms������b�Ց<01K=G	���m�M��UH�＾Yl	�� M����̵�a�K����9���u:����&�)�M`���fW��9����Q��U������f��8�΂*��q\"N)u�\"Z7���$��P8����0�[=�
M)T�09A\0#�R��7�蚘sR\'Q�I�����O?�_{����C\"�a��a8�a����m
!�i)��C	p2�M�U�Ȥ�B�p*er��� F`Hl$b\01����gmsΟ�l\'&6��k����
^�fG�vv\"vL�Σs��	[�B�Iψ���v%�=C������f�X�]j��rf�u�?�\'���J�$��{\0[�xy\0��\"�*Q�D6S�������f�7W/ɹ�b�nѬ�KM�n�Z�;\\���n�y��^,��E
qV����8��2p)W�h51uMvGV�����z�R}�?~��bu��q���q�����i��x�b$5iԱ:x��H�ՙ�y\"D3`��hOV�x��%:�]�����cZ��o=�N?��$����SE֔��ċ����88�W�����`_xԜ�Ye��9ԺB������-:�9�&����Lk�̓k5l5#�DB\\�a�Af-��ĵF�iڱ��X̌,��<�J��]t5G�M[���/_����6M���Vm�X�^�nվAn���I��D��QeƙB�I��`Y1���!�W�^
bfWW��&��+����s�\"���\"�6o�Sn��մ��(�S��0%wa	1tc���U�ȧ��0r�-����oE�O�H�Z-arB\0�W��P)�Zv�H\0��)T���b᠛���~\'?~Ԅ�e�Coer��&p�WMG9�c�)KL\"1H��*3�` ��U݋餞�F�-�CBl��������BS)�ʁ��i}��ٍ<0N�=}�c�j^21Q�qkVk4�;A�#�������:w��^�3����	�cr�@2���Y�����9�����~�!�-$x�bi���q��v��\'�7)V��@=�m�\\��W/{\0�(!R��9͐\0b��q��+��6!�e�Cf��4��R��E���&�6�E�4��w㨥(�����;y�x�CI��H�su����J㏌6�(�D�����4	dݵ��܅��c�G�@�JB���+�fs�9(;̑A*�� (��/9�c�}L�����@y�J�J\\r?ia	S�!r�{A!b�ɲ��$�͉ȅ(&IBǁ��	B���g
��/�~y�<�x�|v}}5����(kS_,���L�dJ��d���J����zv��r!2v1b+�x�!c+���s�R�+���#�0�8��c�*4H89aV ���u�^�f�Ź	��e{��a[J)��:�s�$L0v8*$4돑�j�$�/�<�/�B^���͘ Ā͵���Y0f8�(0�`C�3��q6�z�Gp���Y9�X��`w��[%T�F�V��S#kT��L�T@A�b��t���w�N���x��b���㣕�Pyp�׻DNJ��n��mr�R�U��գR���}��8��6w��+��%����]���i:��|4���Q��k�	�!\\
����W%Bw? ��@J�n�E#�|;?�Ό��;yG�U3�WA�/i������\\�	�HJ�
�k+�`&r�c!��r���N`	���t���Y3�j]~��k�	X����6�F��������ʋ�۶�U^j��/���<z���(�v��NVؕ�Z	 ���>5OF�:!P��l����o�s���/YפU�m۞Jm
����q+����|[�(Y������9��:�8�nw����,��lw�!+�iN6�n`��w�f��
u\0�J=%�;��.?�(믣�<����2O�9�=�����|k�s�!�6�&��4iBLL�\'�a.�9+Ù���̝�יҌ����1j�KD\"L9���5ެ~7���Э1k>�J^�8��n[�
ߒֶ�Tg�A��E�0�c�69g	�ͣ�dDb�ǚՁ�wvA��$Oz��f�����4�������LV����@���
��fS\"��p����޿��/��7�@���v�u��T�\0\0!��1H���Z��6Kg7���Fҫ϶��?T��h�J!357Wq-��y��k3sSr�Db�%c�S@^����x��j����\0�M�K]�q��f}�_�|�sN)�#�b�ߝ��W�)q����\0չ @��Q}0�`�v������fy~�u]�+���H	;���A�N����a��c,K�ݠ�]�	2��7MA=��P���v�u�Y�)\"��WMK6U�S_A�y�l͓m�pHb!�Ǭ�����$zl�	�_<��|�3�ɩ��?��P�EB0��	3���Z�w��&��X,�������oo��K%?�F�$F�ڞQ�Y��SX,������˗��!3J�_��N����=�Ŷ��m��d;\0����6�É�y7�VP�z��aFr���T��Y���RJQ���Ӕa*�9s C��0�c��R���8T��CL!�X��24��A���\\o���V�,�mk��x��͵���|v��/�[>υ��pg35�����ݫ��4���
����[^���D��G$��A`�`��FnXVg͹4���F_���Iꉣ)��Y6�̀�Zݬ2��d�I�O��1��ӽ�\\iT�z#���)��\0fVwS7�<d3%��4{�,a�A�V�~�m�~7
6��^�^�l�]�����ף[Ę����8�V���f��M�d*C�YUbb�<d\"	�lv�RJ?��05M�:�躮��.�����ZjE��|J]�:��5+jVw
r8��
�VӌT�{6b�|�>�VJ�q���f7X37�b�!
���{)e��s!�RO+9���b�fw�\\Z�E
�B��e��1��7��0�l7�M+!q.�C!L)%u#Fl�������M7�91U�:�^fAO���xn��܈��TSi�K��v�ދ��N�7v\"gq
Fc�Ԙ-5.<4�2x&�z��`xU+�:�G��=����8�8�L�y���	IȎI�F�
A]�C��\"~���Ũ<R&���\'�#&��#6^T��dz�x&#si���C1�Le��0yt4!� S��D���H%#.��}��nc�N��eh�E$����1�$-!t]�u]�Z\0�á��w����K�����;H�\\�Hr1bsV�����+��3bA,��mې�d)�@)�\'�3@2{6ϸ��W���]�m��#38D�V���3h�6e͎�X�R�͉�햟kpv��=�Ε��ÜU��5{||�uV�y,AD����c�3�j�a���67�]�j�>�X߿X�X�&�}?�m�ފ5�X�0�aۿ���m����L�gkw
�CZ$14�8��Hb�����|���~x�݉H�>S������4M��b�]ׅj�!���n%?�3�|��p���
.<�j˵\"�:�sQ��ĠB\0q���3�{�N�s�u;~�&sN��/��Q�R�d�j\\�,.��r�!A�
��ڍnU���!���1���C����l?���áx�r�Z�î.3C�i��ٳO���
������J��>��D�n{��?��N�\'$!����!eל3jWV�!n
�s%�:�	J.$���reUh�ʑ��G���N��=��v[^am`c��m����R̨����l���i����6�bND�����l�X0��ƪA�w��:1��N��8���Gvͧ.F�N����ԓT\'vTmWG!��=u���I٤ު^f����fH�xd���^��ŕ)��nL&^j�7������k�q�/uK�E�\\���%��kEd��0�Px�pp��P�(�(��}�t���z_\'�[��xr$����Yիk��<kA���lLM��kk#b��bӈ�=v����z���c5u�����e�b_�;�[k�����^\\{=1�%W��[���G�������{��0)5E����QDR���쉮������#��؅����2�����0���5�6��L^���.?F9D�U���&v�q���#�i�|�pW&�1J$>[�; ���*&����OyT�ٔ�P�
u!��[��\"1��!�/.��5��v��21Y�B��Dd\'n��N��h[ǥƬ��s]���wu+�;X	xw���UJ��xg�zw��2657���O^b��\\�{sO!u��Wr��>��<�3EG�V�P\\�&���YDj������ُ���ΐ�8�
����6�&/ża��/�2,�*�J�r;���i����1Teu�ʮu&ps��<����4Ov���@B8ݜ�����EWu��a1@���a�Ji[-���4M�&ҝ�:w���ӓ��1���NO=3:�gFv{u}���u�&lS��+���sXx�J{�\\>n����P��G=�\'Cgi)H���)1�S���r)��۟G��n r���Yz#%�F}�+����WC��}�1R�����Xa����Q��p3;�9Np�|]��z#r��	 4��
+h�v7r��Yg8���
�$m�.��=��;Q��\"��`Rᖘa
7v;��)1+��[ �������c�e���\0���.�Ħ���r/�J:�m����89�*0��h�Wr�mEoKlq	�;�;�Pw�J>�Ի�QY�g�oM�Sɓ�ȡ�-�4uMLM�:��p��8��߹��ȗ��M�ԕ�o�f�~W��*��G�p��Q���M�f����ʈ*�UI��k��`\'��&
ll����Pg�\041�L
���+���䛮��S�Y�mްM$�D��2��0r�=և���U�\"�zoG�,,��a9�\':��C��B��n 8ͳT�����R-�L�UY��q�&J����t��7���J�+:-���n�7P���2P�����0\\i�V\'�J���qltb�[CD�Q����7k�����ְ���sr��0�A���R�2%�ܡ�v�#|�+_���\'�\'�ʾp�V��6-J\"E� �b����<�|��k�����II�#�D���(�
YUy�ok����S�`�+������v}�c�5�<��{��s��9P��E�61�>�^��_?����k5��>�u�aH�ߍ��D��?(/^Nױ���t��Q���᱙!��@��^ΐP��(b�g�Ce��1����ON�D����D��	\0�(���j��DXF�BD�8�+���c�b�m�!b	\0�N{˽�[����g@����E��	)��Kw�� 07S���1G5Qw5pG1U��r\"2ti #�!��у7���6cH�֋�bg� ���\\aԂ�o�~��.������y��3bSv�6�9D0���m)!;1ŀ���C����:�������a�wط ��1R\\���-d$d#v\0��(F\"d
( �;o��`���&��b�Mמ����Nj�����u2uu�G[-%`-��n(:�ʡ퀵��X
6��4�뛍��c.*��骨T������ד��X���\"q�qts�z�Ru����4.��=�����rs����\"��1B�n�gM{T<��7E\\\0���ϳ�:�gX��(��X��2��n������z%�#(\"/�ªɯ����u
@1�#)�R]��`VTN�\0��+>h�0S�w&7 5WX��Hl\0�X!dl������ƁKQ� Z�3�;�=��R����9V\\�Xl�j�\'lf�,J������kFM��,mQ�;�W��r���r���=�J��\0�8�\'���ɂ���R��ÞU\\4����$�h��D}qJA�:�~f�����\0PP�⠀խ���@�U<�e��^/RX�RZ��X��V�N��\0A�63u��a{��+B�%�(���˽�s_��z\0.4��VB}�<�N1D7s$���J��e5���0��0NDrt43#��3l�S������
\"1S1]��\0���(UCӴmB��y���s!�m�ٍ�0yw�d��PSE�ͩ���WF{��X���`��ս�i!e�>4D�IA��l2��̈́m�ߣ��8���4���¯{����>�_�\'}6��{��C�)��J�6��=@�U��\"��U��Ѯ�rX�E�.j�J�Y��9c���i��L�q�	L۶oۄf2L�A��L��L�t��.{ry4�y�w��M��};h��#R�1���0�x۶}����Y}>ܐ�RӴ]7��q�������/ 3!�:\"�a��}\'\"*�n�v���Ƀ���Ak
[=�,A�5W����Bw�+�<ݨU+��&3#��I_7�a6���8�y V̈�H�iI!@��i�g$jSG�Ed*�+o���TÙ+��>y��4M9g7g&p(Ӽv�ͦVg�5)%f�9�<�9d@K�A���j����sjTK\0@�\\\\�cڟ=���E[��`Fp{���F���ު����!pqTn�Y�fe�j�2(���ߏ\0��p:�x���
��|-
q�����ZR[���<�Q���q�r1pN��450��ĸ���Ң���(�פ�ffD�^�^j�:�\'O�l��H)���j�2]�OM��M�BwP���aIoT鹄���Eۦ��IĊ*\02sUHWi���-���n㊳�L2�qm�8-���^L��R�(���
$�@ȝa&/����;Q��o�n׀�jVާÒs��������Ф
��y������v�E��D�O1D�1�,B�̜b��bi7���R��;?�a�9������9�{�ZC����l7��v+�!\0��*�������#5�2
Rt�⠢eγ3��>?�+�8���B4HF¬�Z�y�p�1X�ݙ`\0�xݳ���a��nh�������J�7�vA��g��P�u�Vͱ7}�A���t�r����\0Gs<I�&��hx0W4�%��HUq�*����ĕ���n��Y�J\"��aP�R
��i,>.��M��T\0#w
���*��A���	���\"V�ju����Á���G��.�$���Q\0���DD�=Ȑ��Y���
_�����>�d)�i��s6�cJi�{a�î�1X��隵e����hn�l�@�DfeY��K)h�5U��\0��\\�U#\"���a\0�8��ݰ����y��\"sA\'��y��R��	���j�j?Y�M%g+R���
�Ao�O�;<c�D\0쫳
r�0�$��:�Xƙ-����5��J�ne+�	ݿ��?ߩa��y=P���T>	���n]���z����R��
|�q�܋��u�ID�\"[����rz�j^Z�Ta��ݮ��N*;�ڕ5�Bmf�2pss�ՀOT�OHK֌U_�U=�i7��R�J9�K)�Ͼ9���W�H�Z�-�D�) 1�lj_�I# g1�-�C�
�;:����%��~\'����41ķ����_��sw�B�� ��$S��+�/p���H^��V<Ҝ��Z�L���9��`��]7hQEĜ���4��OQU\'$�WJ����QK,�Y
�J�ׅP�w������\\�$��#,�����vsq�vm��߹��_o^�b�m�5C��ؗ{����ʺ`)�뚈�e ��c��K#�����\'
�\0���k�hY��k�3ru�Y͢]�H! �!�U)�ؐ��)09�v��V=������le�.�q�R�8Ms�ۍ�V�<!r���-Q�EU���y��7/�)�e��u������ݡL�Ջ6��֓7/wy��p]&\"PD���|Y���	~#�j\"K�O�m�E�W��Uc9ҍ�?�
���tߗ��Q�\0�Dę��0کy�k`�����C\0��i
!@��\"b�RCB�l79�[\0�7@�Cm�N�tu�:jbjbbNHĿ����i�)u{\"�g��A�C0�,�L�d�w��?/�����xr��Ov�^��
��
h1r��)?�o��/X�.�,�!F�U����O�>K����ƫO��Ou�\"P��
�প:�D1@-j(4M�+����ۂ�1�j��w \07w57��$3��q��l6�q�y�yf�ks.U��%7M��k�j�32w}S2wQ5�q///�?��ٳ/^����m6�ժmڮ���ob�\"Z���Vh����4\0\"ds\0��q��\0膵Y�Rf1�&�Bm��:�s�m���$x��7�y���N�����k4a���@�`S�/����YMB\0����M����������N7y�_�4�{�qo
��g*�VS���U�\'\"�x.�P�U�\\�q���R۶9��hݶm�/��<ϱI)Dw���|��իW����n�Y��\0!��i��	D��ն+��`*�b*��`���R3�+J�\\bJI��Z�����/�y��M�6E-��姟<�����~�^��y������
1�з�j�ѷ]��bd\0r��3�獉x�1-�R���I#�s�s�%�q�0�Tt2��j�������P�O��[��_=���\'�~����������Y�>�6]N�� ��^��0i�`h���qyz�|��{O��ß~�y��`x	Bޫhe���RJ}/���T]uot^��

�����i����,���2�L�6�㗟.,���^��߿߶���B�R�4��K�U쩈h���Z�\"fb^�j���}���[�RW�Ւo���B1F\"�<��5�<�O.�����o��������O?���|�4Z��6��p5j��d���V����GͻO��.����?��_]}�����M��T��o٩�P�H녷bP+��3ΈU~��T�h!r\0�l��s���j�uЎ�,���Q1����6[ �Y6�~�Rb@3;?=#�@\0Z�ޙ�H��R��ͪ�
��P�R���\0�4MMb�<b�\0\0 \0IDAT\"�\'Њ���u�m�h��2�\"jb+f�M������~��/>|�����[G7l_m���d@|����y�~�J�\0O�}�͓�������b����LC�=z��~;83#��0鐇[/M���y�IiE(װ��2��>�ʂg\"jC\0\"dz�s�j(w۶j�4�Rۥm�vM��2�i�x�}K�f����T���pL��Ԡ
�����*���F��鼈��B`��8y)%O[�9\"�\0Cq���>��~��/�_���\'��}h�W?x�ɰK�=)������L�n�Aj�[��\'.]t��\'��o�����\\u���m�̄�8$U�\"U/�̼�Ku��fV)
@^��1�����$Z��(P�cC�s��CLM��m߷=�����8OU����F���,j�R\\m;O�����>����P�̌LR����˼���*3���`�9�e	�J��Q���\0��?��?��W�y����Y�<�Kg���1 p�[U%���� �]���|��\'� {�zpml>I�xN��^�����\'�<h����+/����z�I9��SUaf�wX8���2�t�\\BFF@0��
���2������z��J~r���w�9N��>��\"�8P���r��\\������i�^�k�\0����s��ը�y@�P
`5\'�b%@�K��!�qΥ�������<^���)N�W/��#5�ɬCr70$Sϳ朝���Ԋ��r@2+�sl[(y`5����BHc���ǖ��d#LM�h�5Ir�K!%��C5�����\\M�\"���^�z]\0�0ƶ�m���͍�mov̜�2\0�m�y|���BJ!6i	�Dvwɹ\0�0q��3�d\"�4)G���9�MӤ6��0�<\0
��R�I�kW�
���v{��^u+nS�Q���Y8���afp�*Zq$D�p�������j<�(�\'V�򀰺CC�Uc�w��R5v����B{T���\"��<�b@�M��
�p]{���F@����rr|���z�-ܼ��Mw��ݯ����kN���M\0
����6*��A���K��Ě���5��q
�&�`H���9s�E�3U$�-4P���}�/܆�y��;�Y��M޼<��[o^��{���L�����$V�����$eve�EǾg���ϣj���Ձ#�����mq�W˛��^8\'\"�a�\'��Đg	��)��z��͹L��pv~r�;\"���zجI�m[�g3��R
�v�A�V���/S�s]�B���z�C\0��1CmӚ:���A���,�i��R2�s���ܑ�EK�s�9�m��?�o�_}�	�<m^\\�_���kO.�����~���}+�z��=R�������*�6m8H�؁áR�Y�x��~��z �H��\\�;+�Sm�Z�_TvVrh��
u&�Z�[��qj��bB��n.�զ,^r��b���7����6Rw\"4�l6�Dj@1�y]q��S[\0�B�l�wc��\\[�՚s.�$�S��I����yD[ �.�̠A��Ojf�ô����x��z�t�¸����������n���g�ǟ|���r��2!K��ID������agga���]�ő
�a�\"��N���f@p���\0�j�rp;�hzyy~�{_��o�ת���,�6��ڦ�M�6��fPU$��M���j�ݼ�\\�`u\\I�f��5
\0�;_GDu�\'\"\0����%���tm`�;��o�{$0�
�	lA��Q��\"��g�e�
A�Y���>��]���HSJ\'\'gy��ۭ{���*>:�Vs)M���a;Lb;9:�rN1y.@̄꺛���IMJ���|���<6M��u	c��:����f�tf\0L���OD@D�0�ܳ�0M��i�����@��,7��:OCtHM\\��}߶)!����4�m�����<���������,e��O_>|�����U
��kBev�H�TN�*^���_}����٫��P~��/�b��!vJ��f��[M��s.�m ���`�0��Q!������\"! �B-!�\0ۛ�<�>1���\'M����o���w}�>�EH��&��*`9QW�����eQa��*ыH�U101R�d�\0���}�׳z���k4x�������t���eUj�]D��+����̮̌RD�u?��CU]�m������˝�(���b��c�z��\\��U�J�<�i�vM�&r\"�cT�E���]�?� >M�g�\"X7F��\0��0�6�,�pѴ}���\'ݮt?��P��f����W����������)���AED�\\���!�uɫ&��G5v`.h@!������v����������=z���w��y�A,@uZX���1\0:�S���>k�E�Ģ!2\"\0b���9H�R4�<e�nuT}uO73\0W��\\g�!�Z�U��4�-���6ED��/e�j6M�g�83���2M�lf1�M��L��_B�s��se�90�s[`o�.bD2�#3u�<k��
����	yI5p�}���/a�W_����5ftCp�q?U��)��#d0��QG�=�8|����͘>y����槿z���>~�����v���YuG��;��l���p�v��Tw���;YG		��MMI�L����y��q���ݷ�������[� �^M�)&D�\0��]Zu�UH�tP�RJAϙc���� \0�y H��SU7�lf�O>�M����=������Q�˅�Mͭ�~ߢ��{*S)��ć�x�c-V
l*G���>\0 ��4ctz�>�2���+��������rW��o?�)��`Q��k��nw�Z�aU����r���(��d\" ��QH�\\ȧ8N4|������}��S`��v,j���!�������Ѻ#\"�-�V�\0��3��� r��ȉ�J����U,��U���]MUK�<U�E��DDeU
��Rꮔ�Ȱ�!���	���<���2V�3�m��R��M����AKC�V#�$&Z��)���QQ�� 2pr�\"eγɜ\"u}s��&1:;Ҳ�k��Uf��bE��T\'j`f/_�\\��n��!W@[d��G�ܝA�$�E\"��/[N]L+��y��}�y�����5��G�?x��e�㣳G�e�b�����w��4��DL3���$�Oϻ�����޽��}���v�F�Ft¦��-��0�[Ě�h��tݟ;0�n���v�L�d�ȁk?�	!��8�`��8g����Sa���>^u�XV���jM���8���u�[�*zX_#�3��Z︱oC����8�B1�ɠ��S��2;�����{Ӫo�W�����`FP����䈀r����ze܋�_�|Y���j5&��@��$ѝk�5�*���)�h!Zb\0�fw���㓓��\'ݿ�޻�>}��~��G����~�Wo��\"�c�n�����w4uJ�LF)�[N���p��\'-�����3x�A�}E���y>�����:4ΰ+bj��]�nbR֫�xݛ�@Lm�����T1h�dP���i\"��wof��0Hj��~߉1��s
s�\\>f�8�) ����о�<���\0u��c��b�/���U��dVUE��i��t�����,�U
5���-���|Gk��	�`0Gq(fnx� ��8Ldm�x�N�f�^|���K����O��g?>������`\\�֫a\0�?l�U�I�T�\"�?���t��7�]�+�]\\���d�=8[}���w߼xt�G:���Y��pu�sN��ӆ\"�e�g��=1r,^�!5]l:0g�Bƨ��T����x\0��.���	�\"�Q�d��8�3e��жm�X��{\\L�&�r���U��j^׶�8��4�s�*fv�=?�%O�ྔ�\\dQ~-�iD`@cN�Y��;n�È��m����)��2�ya�t�G�Ѫ��n\0д�{a����v\0p]�$�Jث��}�&���!�WCB���嫗�B�� 4������85:�<��.�12`�z����F���7�=z�\'_������{>��g���ًOn��Bj��ԮK��]���D��$�Ώ�� ��*0�#��\'\0���\"1r�6�4ϣ����ŃV�?8z���[�/�zxv��[(��@�s��,�(9C8:tV�#��QSJ����I6��]�rH)P�p}u��\'^�Q20ŖSdDS�U�	\0�R����;Gd��}�e���^��R���N�ЅU�4�?�w�:�DJ�b�ҵ-9t]N��
�<�y��6}�H
F��1������9Y5 s�zQt^5��Z����q�o<8����I��Ӭ�y��.��\"D\' �V�j ��Y�(P`���6�`&����\"&��y��c�WA�	1�YD#BdPc� `���������\"�E����3�!,ay��{֜\';��o��D�F�ʤi\"2c�4���Jk��!9���I�%̩���Ml5\"[ a\02���CJ`�����+V��g���D�Mp��-��=G��/.��Y��Y�qCm��ח}߷m�L��B��9r�:b������53��e��=:���O���|�r�x���d�:�ݴc�������US^��^���u�Ϧ�kj�f����]���S.�i��O0o}x���=���\'����w�yc�����\0\04���?t��D\'��s�u)E\0����.����W�w	E�hhU�쾼tH!dSw��5b�I�m7ͦ.\"�$5n� S��FGǚS_+��P�s\"\0#�C��-�Z�u�����ZJ��j��!0RtQ�R�\\JQ\0�H1�Q�J�MS
�x�(4�o�D�ܺ`����y�9q��Z�R��v��n?��7�xc�ZUSa�4;��u�\\\'\'\'�ժ���}�s��:]�O�;��?<y����Wϯ���/���Ƕ����J���1��#�S���
<,�&����a��yr��Q
!4l��_��z�����������q�t	�@�������n�n)�G���;�D�Pۓ}�3�ܻw���x����H�Y�\\B+(/�OG07Dbƈ�n�,����YV+Y%����]�jO̡n����%�`�?S����6�)\0ࠧ�����G\"$���Tɚ��QJ�MM�h�!R��\\Ů˶s{Cp���DtpusGf&NL���돵�\0��3i}���ۍ777?���j��}#��l�i2������U�mmDT����0��n�s	MO\"H��Q�}|����O������?������1v�Ni��\"Y\"
���7�;e���,\0�4��;�fm�D����;���z���.�����aK�#��\0
<-&RLr-��Ҫ�p��>�����V^Y�>�w��ځ��\\U̲(I��־�G�+��l�mU]�%�I�HQ�5#)�`�|���CA�\'ɇq @���8�e;3-��%���[U������y���$�d
B��
b�ʦ)��.�:������Kg�E ��YID��!����vvv�H5�Σ7�l9[�q�uQ�)�i~�y0�ց&�k�ReT@Cf
�#S��f�#��+s�����z$�^�|�����_r�OF�uL}���_Ů��C�6)*a,�4eUEA�>2�
��1����	�
@�
��r�r΍��e\0e!df ���Q�����+�\'oT�i��d�޾ �<CN�9F5N��4؊���ٌU$ZWe�f�	�@��lWꇪ���
e2JUU\0@�q��~�Y�������}��U�\\��RSbĒE��2B�pUU(!�BR1Zk��:�]<39�MU
!d$!�oMS%RR�d/G@UM/ffL�p um^���9f�PJ8TT4������xä��Ţ*ʪ���O��u8����,��4�̼�������ж=�V���������<p���Z\\+ΩF�5��\0cb��퐪�3��������?|�PQ���K�R5MU�9�>��nq�d[�U߭�^��~���|�y�\\o \0Pep�J
��иl*�G����ϗ�޹}��K�F�`<,!�HDB��Ӫd&X�ڪ�G��fv]���|>�1/˪�ʲDa4*B��e$�j�>2��
�C�6v0����Z@ B�	Ƚ�\\6��ͬ]-�B]J�`D)�\'G����m7X�k�O�E`W�dƀ̂�����L�0L�KX�\0�\\LmT��3|\0V��>C�����P�WM�nևW�3�������u���s𦾮��w�|��[q @�5$OJ\"b��J#�P�Hy�o^b��2:�AU���Ղ�J����d������u�[�v
@3Xa����-2��8��&�&tmBc�2p6TE�EG٭V+���x�}u��AG2�s˘iU!#�`I�1JA802#�[�ذ�ša@DTT��t)��
,�H���	����-eYVU�Ö��e�R�N\'��u�\'�/P����7�U\0�� ��ڐ#�����j�B��(T�[����NK��,�+u9/���ݿ}�6�Z�v�(���q�(59R%�
�Zt��y#�|���������A@6 �A6�?��Z�ġ�v]�����.�\0�ө�L��4MY|���_~{��������L�S����Tͫ@P�5���
!`�����$Ĉ��,BN\'���A��P�Z���9�B#�)�Җ4&TXg�W}��z��\"�Q]׏,����
�)ńBE��;�:0\"���6/�O���_ݭ~��͏�o��
g�x�<ZFbq�\\G�(0#3�s��`?���f �
�(�#�\0m(	.���\0SJ��«�+�۶m�&�ppp0������y�\\nmm>���o���ݻw����U���0����l(�,3/;	���3�
Z#	
�.b&�0�%����\\0���V�sP���<m�ϛ�n���˯�sW���MrZ�����*0�v^��ϖ����!pD���\'�l:
jn�jT�����}��\'׮��n�8�|�!yq�ͦ���eY�YRU%\"ܼy����w�=zt��-oWC�C1��R��@
�P�nI�߭��l�;/����_� vǧ��pR@]�g�N�n�y�].��Z�:;=Kʖ⤙Ŕ��<�@RN�,&)�Ͳ���d���.�A�B�\0?~<�l�)����<6�.��}[U�|�%B\0�ʍk��������/�ϗd0��L\'[}�\"�2%�M!a����|��2��4��GB0�,\0���TA�.�{p#_A�Bĥ�\"U%\'Xۑ�9�+�dCdDC\"p�G��
B%`b@#C�qF�5[W�Ęc�`9@v[Q?��.�����tU$���>�a��B)����\0Č���k����l�\"gg�����s\\%�Cj�z�SY�w�}��;�����k��I
2$M>]�DQU�ZBw����g�\0��u]���R��M��K���Tqr�`��F�ϻM���۷_~�e�Gွq�5F�n\01�õƬ�VG�I��F2�d��_�����W߹3}}v�=�T�U�T�
����B5���AB��i��t���u�sv܋�g����f�����G�w�����$��|_�uJ=3#�j���#r(�a��� ��B�88E0��S�!C^�v@
?(7^�po��JH�WBh�`����{B@FzV��!AeY�@�Bf�!F{ȹ�1h�R![���-c=�7��L뺞L&7n�p밮��ۮ���dR���._�u}W�UUV\0�rZ�V��?.�єR���̞�`�ӫ���Wo��y�ƽ��kS���m6���I�E�����Y���t����i���R�����Cy^}�e9ۚ@�xœl���s��޽7��}���ސ��`W(	��4�N	S����8\'�+�J�$�C��A����6�J�s�#vq֛��X4\0���a����.�Pi���(oqQ:���zP0
d��\"#b(Ls���9��)���e���>����hQN�2~旸Z�b��F��)����j�e����b�Ay��$�+�������*�R@zŘ$GB�-1����/V]���dc<9zztx0�Nf�����Gyul�������m�Ve�N��_�O:�[�Ç����������|�hUYrbS6�,\'��YQ@��߁���@0dB r�:��ML����t�a6���Z�y���#.���:oJ�	�O��1R��p8�\'�+�����f����F�ٺ���D}�|�VUU�4.7=�ͬ��-����/⦗��~	\\��\\Z�m~J������3_:�~�o��6�Ԧ>�S����^���{#������|նO��o�ϭ[�n޼�W3w]\0#z�g���ߚn�ڕ�g�k��Ѯ�ёn;~�f�w+y���O?��w�����#c	�� i�t�2�=�����\0Hh�4����`O����	��<:�M���D�~��8�*! �XK�(:7bԍ�@3ht�܂(
eD�je���EQ	YƷ��+ڿ�����(\\�g>���~�;����}I��nf��zL�����o\0ۅ��&X���
�$7�4�r��E��,��v����<z	��~��4����i�}Ύ@r���hǄ��%!���0�����$��Z�Fh$%�z
̈́��?�5�˟��뮋��sn�v�X,��������^N�rmAɚ�����=
�c��u�
��U�A5��%ٰL$D\"R\0B�A|x�@H��n���ǵ6�_|��oX���<ٜ�<K�Fн�,�n�J���:cIlo=x���o��_��\'��\"e�J�z�ٖ�ј2����^��z6��Hv��`�kVU�t:�	�8g��lR��|����I%�uЌ�
T�\"Z\"��f 4�l��ѡ��ؔ���3��
7_|QM�\0@����ѱ�΄�M �?J���=�X��s�T5�r>��fl����sB4pt`PP��H@�P��r^�y{�+Fk���g�8�3��\\S���ѷ�~����OEYg��jY��8]�ȴi��hٟN��_~�n^?[�>}�dy~��Qs>[����W���vy��~�1\'\0����R���d�9��1PN2��Y�spmEU]O��D��uL��B\0����:��b�?!6��e�i&�����5����o<|�ƭ���Ͽ����b�B�O��g��,\"�3�QeY�u�,�����C�;\'D�YGg�?�T-b�S�оSE�����sJY�&��0 @``]Kq�B�jry�v|����1}i�4f��(���ї_~��g����;{��Lզ̈́\0rL1F)�l��������������N���NN(���������{rt��G��Ϸ~���SJ)�KB� �d9v1A��^o^~lě��@

INSERT INTO student VALUES("KICTC-CER-006-2020","Antony","Juva","Mtui","ITT","TC-ICT","2018","5","kweka6@gmail.com","�PNG

\0\0\0
=p��v-����>J))3�JW����=�6������u��W-ѻ\\Z�V��+[�8�����x?�����:_������������g�_�����<~+?\\�����/X��~��B��4\"���.d_J��B����L�W���)��y���\'�w���۾���߹�]�O��<?c����ߥ��S�!��{?����_���0*�kV�����_����y�?�~���C���������;��|	���|�������ȕ�֯I}����7NB���*ߍ�����6���z)�~���
\"ѿ!�F���C����c��L蹞Z�������Í-Y��+�Ez���c	��n����;���XP)8��O|���Uɇ���X1��\"dʜ~�.�:*/�߾�R^,/̝	??��%|Ֆ�(�D\'�Xx��Zh����{��5�c�8v�3�P�)�I
B)q3ʘ��b��7�i�7��y�\"%��H��A�2�F��ܩ�QRɥ�ZZ��ʨ��Zj��
�FK-��jk�7k���{鵷�]�>,Z�Uk��ln:���Ӄ7�1�L3�2�l�O�cQ>+���j��ek��\'v�m�m{�p(��O9��ӏ�q)��n����n�v����I럾?k�[��˔�ؾg�����ApR�32s �M���r�{�9:�N9��eQrvP��`>!�������7�󿕷�-sN��Od�)u��?��/���6�\'�2�6TP}��xӈ�p�o<zU6�Y���P����K?q��n��̧�v�B�ށ���Y�z�i��0K�n
��Xi����
m����o��))�u��J��V)��7�z*w��1f�W������h-�jgֱ�9���2.D��%*�(o�G���dv)x��}���
�\\Ҝz�َ/-�T(�s1�DX\'o`I�u��sҔ�	������=T�]L���+��ĵ-��hSp��e���N34b`i�s� �w9}���xf��A��C8Ay��R��ܹ��\"Y3� ���Qn�Dt��1��ţ݅jџ��6�E��I�Q�bn��P�h�}���4_7B7�:�3�]g/9���4Pj�o`ˠ��qD=�)������rT-��\"J/�S�2|i�a���[7ﾱo�R��\0�^ܿY��~*�Ѧ�O��od�+J3w1��
v��3�
�=iZ9��u�E���\"O�Uz`�6$����!V4�I�h�!F@�V�
o\'���ݔP
����z�@D\0P8`eX��h<J����GRƲ����\'�h�����\"���
�Fs�
�5DJ�eP�P��?L���_�R�S��(�KI��ȅ,[P��vr[ц�����\0���+ww4�
�M�[3�jȧZ�������|Ɇ:�/f�6`��)� R�c�[9��j�zc���M�:Trk`����Ϩ��2;72�	M�@mW��Wj%6hGg�x\\���A.4B<F`(�u�0��Sv�F�d
��dط\"Д�¬
n�mu�ű���M0m(HHd�0	g/3�ƴκb�T��$\0�5*�3���qR�� Hgv�*FU@,t�N`×8GR���X����F
���Ǩ�q�o\0��j������m�Zd�D������K�4����.�FΠZ�v\0B�tWj�=n�ˆ���T!kf	��vب+�
Áz۾19�W���
a=���aJ?d�@~���*>�D���$hpe��}�6���ri\\L8��*A?`�F�m\"��B��{P�H�^�\0V+bC���ȷy�s�M\'E�R�G2
.�OP�(eH�	��R���Ԣ́t���3��Zx�E��:yC����Rk�=�~�\"�\0w7����Cߌ�>���������s�2��y�默U�Q�X�(�\"Wh�~�]D%���0(��bv\0#�����3ư��\\@��\'BN1�Z�x�,W�qZ5:�!t�$�@&x�!�=�G���I� &�Z�Ѐ���2Z�\"{��s��l��iAr��5\\���c!�+���@O��\0x9�ML�\',��T����n�2Y`)��s\0p�%iEN#
�1����,�vr������8@uT/� 5|�-�)7���R��«�	�����+=m�M-�I
���, l���#{�)�u�!ծ%��A�$X�,Uv;ݏ�&�GF�$Wv�b7I�貓:��>�m�=,Q��&��%8F�[���4\0
��[���=[�#�1�*T^Z���b��F
�{�[Y�w�t���fF��4%}�	vYrr��1q���Щ49�u=wA@{I
Z��\0��N����e�\"C�`x�h%m�`=��$ʄN��bi������
�0,1��ީ�t.��b
*�Tu�ԁc���Tlk \'<��7��D���a���Qr�^`<`R�[2B]�T6J�*&���t��5j��R��t4z��-FӞ(�K
\06�i�2l�P(�*��4#]���QG@D�\'d 
�Yڄ���#K�����V��ѮB���h�յֈ����Bh��To�6-��C��n�h�E�*�\"�o��Up��V���ׁ{7��F}��͋��1����om��	���>	
}�U�*�$�Z2�:���ڐ�� FZn�:%�*�O�;!T�f�&n�V��<�[Q U�5�gNA�/�V�N���(KD�ɋD���Q�O�e-�N`7����7*�JL�zLgjd�rQm�OU\\>��_+�bj#�ׯ���N�d�T\'!�\"�Z ;�����f���˘)mW��jF%��L�y������M�	�9�Mچ�\"��)遮� �y^*+ڵ%
�H�I���й�Gzs��c�ϥp`b#�	�HE^�N�x�e�����C���\\*��I�\0v�ڱAO�	��\' �5��g��D�S`E�Cb�Cgp�����P���\\�9��� �u��
3�i+;�б�\"d]Zb`0�A��
J���n�zt�!%�ԑ���7���+*�k�	K�� �X�g\"�I;�:Q��[��V	J�&�FF��@�
*h=&G�c��5}�a��X���6H]�iʺ���i�4r�R�O3D�����A�Z8	E�{1�SGO<�fd��W3?n<0��xu�%wѦ�a����.0��*�~J�wp�v��*�*������-(�Q?^���0�1#T�:MZ52{�
�l�G�n@1\\O�Wm�27���ǂC���l�7
^Ƞ=8z)�1W�_�&�0�
	���_�Ͱ�#���P��T]��\\��e�mۃ�Z��v��K#��:��S�P�(\'��ۡKբY�]�����L�g�Y\'�߹Ĺ��\0�n�񕔀Y�h�m_�j�nk*�y�\\�M�A\0�o
�O_���6�ݠ���kJG&wV;$4坴>�
�g�C��\'H}B�p�g��\0����h�(�CQCGvj�װ�\\�oOϩu^�nP�`{kݴi�;�Br:��
v�␡:Yq�*�B�Zu0����G�����b���YWWA�\0qrtRt���Z�xp܏w�w�\0�Qe��5h�mfRI1�_C�#�B藙e�JR�����%x���?G�Z��g�a����S���y�8�ʲJ|N<j����x�ƹ��3�f63G%K�t0+��$q\\�t�r���8k�kݓ�0RЗ��Ns),`D(���*l$h�I������?��%r)䪀�c� �~�?�ݭU���\"I���q>���.Ь;����4O��3p���
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:ec1dff48-2714-42fb-abe6-d394beea168f\"
   xmpMM:InstanceID=\"xmp.iid:a2107800-a6b4-45ae-a2c7-663f60f07402\"
   xmpMM:OriginalDocumentID=\"xmp.did:1ddad0b0-05b0-4b5d-9f98-b59464a82efd\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1603715304500762\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:9da1ac77-bb4c-41b3-89e4-67adc863f89b\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?>��
�\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�
�`\0\0 \0IDATx��k�G�%��=\"��[<6������d���2}��4�����n�\0 P��Ȍ���YU �==&
B�G���A�g���oz���?�9E��
��%d� -�I\0��`=툣�w����`U�D��5\"T���q��\0%��B]}��G!)�\0*�,�λ�e��D���@U$����\0H��#�蟎��A�r���Zk�8�*z|�֟�B\0�P(�o	!��E�
�hx,�X���GDJ金���G��� @��#�\"����d���%f
�lBU����0B��(�SXH�
@����G��k\0��jdd��5zP5�r��������>��4�Z��ܢ����![N��>y��O?���0��!�U@E
�,E�\0�l�o��W��}����/o�]�R M�ac�4�C���l��n�[)3�gggÐ[+�4�����������s>����)���!��5���GU�F�CDr�^��q�[\'�uK����?���O?}���.�=��A�i������
}\0V������~��Q�����!���xp�~ �\'e�f���7���z����u=���D�f0F�<�f�1�l�qǁ̖���)�((�!\'��\0q��n7�CE0��0\"R��,e�圇aH)�V�c��L9�<��p����}��W���ן��7O?����r�n�,��Sg��D��\'@�K�`�:�Q� �����C�I���C�4߼}{�滷�_�~�M=Mc�	z��i��6��&%uCS	��r�p���<M)% Z-dDD�U ��6籔:�sJ���H��r�yE��j�P�2�p\"LBI���Uo���p�:���H���ˏ^|��O�~��xq.����?��*���{O�~p\0��iS����Sxά�xss��wo�y���o���n����eRR��ʐNVH9� ���NGU��^�<G����yH�Ki��<ggg\0�#�qRzQO���Tap�g�!R�ϥε5\'Sl�\"hlw��\'O.�������]�������Y�����[╿.����-�է��ݛo�}����wQ�&��8d�Ӌ�td��H�L���Ma��{,�)\"f�s6EN�H`�BUk��,EP�i2USU�-�B���
�l�$�p4ǁ)��%�ID�{���r�����pd}��?z�7c��E$g@$������7�џw}~J�B�]4�����7/����W/��!����8@B�w�!�\\�yȦ�Zg��s�u���%Ks��sm��j���iJ)�T�Zk�y&e�٪js�,�B��
X�j�j	0�Dt�ޜ ��!�!�DA�u^�^uL��|������7�ϞY6�.<�j��@{
����1*�7E�E�GRKf	�����������x���7�p�ϷcR�V�o�%���z��tK\"B�X�&��a�f\'�UD\"�E�$PU���П\0�fTD
5
\0K))���j���TO���X����~�٧��������-}Ph���ښ@R�G�����\'�	�9DT�պ�����7�߾���j![��uVq3 \\��WF�h� K����\0��Bv:�?&@e9���$�P[^�
3�BMa8PEtk���f��>�l��)	TTE�\\LB�>�џ�3��rE<�����j}ӎG���,�LU�[m�T�Ĩ*!tF�pFc#���ă
m�/�����k��]3$H�*���\\�H��hYL�;�B:d͒	L�UU��
�R��$�\"�ڂ<���_����s���@�_x���}j��E�J%
Q۴?ܼ}w���m��
�p��8i�̡�����R���nǭ穞�ׯ^��.�=��F��}�k)��J���z|w�w�&Q�z�ӭH��jw�V�Uzc�D	et�\'I0�U��Ɛ,�Ba�%7]/��d��y�x�y��g�{�)0� �>�\0�DU�DUU�*]χ4�RNàf�r�6rjM�p�����g�O��8����T��h��_#@ED-M�7�o��o�p&B����
�\"���>Ϭn��5H�<�Z��ߕ�Z���O��FM#��sZʲG���(>�ͯ�C��4{)�`��y)ES����$��f���A=gT���9�; ��rZ+�E��U���x�Jn����7\'׻�3��	D�D��$B`A���A
��0$�󺇮�@�M�P\00����rQ�bq�P�
��y�HW71!�4�����{�-�wN�
FAho|
T`N��d�E��T-�UJ3
J�z�2�����^|�e�<#H��� b��П�Y��>���\"���ջ��/��V�+��٣h�W�D�x�#BBA�\"�p
b=���{o⮓)ڋz.�M߿���i,0���Pzs�c��>m*�k3_{Q\\2	,�\0�E�����0Aq������-%U��y�O�IS��v���_~q���>����Ot��!d�\\�a��g߅G�~��t\'e
\'C�-�q������i���*[o��V���Fw
,\0KA�G�>�
�@�G8a�Z�f�f�jTrF
�D��*����p�\")η�/��{����ǟ}�f�$�%��K��_F�n?̍��貿�}�ŗ��8d�G��6��L\"A	z
+I�KwU�\\\'8��wt��
K�����Xs�0\01SR|q1��-��ѵ�\\�� ���Z7��M,�k���\"p5�d��M�Ѽ%��f�|�dzy�{w{��~��l���O~%�0�K�r�R=�G��ʾK:z��T�=t��7���|s���I�Z���a/�Ψᅭ�;F��~�z��b.�IW�}�\\�6��ձ.X(u]͝V7�+����\'Z�|V Եt�E�ү�^��]eE���X�+� \\$D�Z�[X�e�ܝ����Ф�^��ٮ�������f�l���\'�*��G��|�/�iso��6[!ٚ8aID�i�����Ͽ�<?m�����^%2O�\"@�h��&lu����\\�.]����{�1���$�� �x���X��5��%BJ�\"*#�}�b[4o��.==[v���&����K�^+{R�)
D���i$��E��$¸h��?T
 jW`hgS����X�*�n���%@���[k�TP�H��B��=��r�/C&�B�#	4\"4���z֛̖0r��6���?��O�?�>}��\'��W�?FJ�QK�䍗������w�1�$�
<B�>BE��,Bq.B��Z���\\H����k�\0��TIa�R2u��\"�Z���J�*KZ�!$5::�\"Q
C�=�J��_��Y\'=:�!��A�H�Pehõl\"�P�AlQu1zPF���X��V[D�ꘇϟ����㧟}���e��3?��\'?\"F�unz�Q]��������?_�z5����r&�;1)1թ�\\@@z��wI[�8����5�{gx[�z!�X�q\0�\0@&k
UB)�H�
��@#�D`�DUV�Bd\"A#�umu�Ѫ+D{���(C$�
�H}�y��5(�e朗�\\S2K�͖�`T�B5���CĻ��RN��ɒ@m9!T�<Cq��ʴ��������ӧ�~�AɀB�3��x3O������B-g��믿���?|�n��&%@�щ��t&\"}(�B���Z8P���G��=jDSENJ�_
[\'�z��^GC��
T	[���X��\"�P�ށ�ݩ����$��V�I���|Y_dJT(C���}� �p4A,S��u�04\"A�X}��{�L#�(p?^߾~���ŋ��OQ�w����Oy�?�b�������ݷ�Y����l]�)�}܏�Z��>�.�
� �ֵ��hͽ�׈f
�F^��Ѿ\'�z�@��CY4�\'/k�i���v�]��;��\0��T��*�p�N��f�{�S�9-%޺yǽϤZ�pO9BD2����}����w��~D�G��\\�f\"_|��o�韺Q�ҕ[�M�<A�~�(��o��Ro�|���_����|�S��$���X:��nAB���\\���8�J��t��dC�#�Ng��w��<�g�
�����Xt�w,�]G~-�ًh,|��j�BT�r�y,��e�y	������+��T��(O� #���\'D��L j�Y~W�p)0�1$���y.�����<P���߾�����1�%��������<�H�O�|���������f�Z[)�(n���0z�\"��_\0�
�Az����r�A��O��5����L����V��\"����ۙ�/{
�i?,A�����~�N���8D�6y3�kDS1�s�\\&���]�Q��E��;�A6��t���*���d���}��L�M����G��9b�j��GWB��&օ��(��l�XpI*{!�@\\-kP�d�Dg\\��޿l\0ab�5Fw���$��D[��p��{4�D!0U� غ_yqqF�<M����h\"��/:�r�\'�Z t�庿��_�lR�$䤩�� ��֡��f��\0�5��X�X0��G�y��cI�)YJ��&CJf����g�\0z�Qч��\'������.F!�
B;�u
D��\"!\"�:ѕ邋�[�#� B�S	�F�nz�@��v�@ġ!iu�Vѐ�tw��d�i�Om���(�����k	����s��Z����_�6�f[N.��sJ:��b�L�5	Hec���yMBMmؠiC�Q�2���9�eS[/Q�R�ؠ6X$m��!�@x��\"C�G���!-�^��󗥤�7��M3��/�sMR�dx���T��o��t�G{��?MAø�l���a�Rk��d��M�!�m�6Q�)�t�Do�4o���޾y[�2\\^��G�~�8j
�b��vEPߕ�]���I�������ӏ�PU�n���\\D��|��Ez�vLD���f�xpQ\"#y�8E�L�\0�d���&YۋK�*����c�ԃ�{\'Hk��b]���ơ����y��ŽMs�:�&M2����QhfF�����%iiA	��d4iP��%C�{5 ]�t�X�VãO�ڴ?�i�Xw����1*=1z�� ���^S��=�2�w��{�E�bT��$Fwgpw�Ջ{%��	��K[�?c���w}	u9RmQ�K�z��Z�C� ��4�,�� �/`���
3����Ð�7U]8�xĨ��ݺ���49Y��R�����o�x袵�ՉH��z���{m��9�Z#������R[�h��P�P���ݎ�͸�nv�f���si]j�3����4Y컗�zBo�Zv��<���#���~���ݿ���=�RO���x<��֠�F`�ɵւ�-
t�w�c��4�d��z{O�)�_6F����љF�YJ���̂.-�e�h�F��NW�e��*�EX��ssΕ�!�y_���u.u�?���
��%Ze�ujE���զ0�
�\"\"^k`�۝��=y����b���j-�j(FJ�y�gk���%�V���M+�]�
Ő]��rΈfQUHg�>D�V�u2K9��q�Öi#�Y=�=i%�:�e.�k��qs��>����^���f�/�<`P�TM��r:�y�e	T�E\\���Z�l�4o�f��L-Q����(�6�a،��\0�bn�e��t��CiD�%Kie�����yK)�{���,%eT�:�ޝ�d�ڭ�R��~<���y�J�ͽ77
t�1���%S���\'��z�)g1>������\"!�1�(���\"��9����!.IhB���V���`�R��x�����6%|񐇪����Zʩ�a9o���RN�LUh�i�m�u::}�UM��A�B����)J6Ғ�����YBJ������Z���N��p�Os�S)���j+��ń*T�aΟ<y~~�Ikk��|�9�l/�ٸ�f�R��N�|�_O����49�}�m�٠�<�Z(lJ�a˦�YTA\"�T�b)\'�9�l��
u�.�H�K�O�,!\\\\�ާ��޼5wOԤ�ũu��7[�7�>��1���?M>*�M|@1�����f������/~\\����
ݽz�XV�7\',E��������x����I,�۞m��Ӱ�a��v;O��4��d��y8��w7Wﮟ<������	O�����WU��Z7�`a��m��F7D2��*MZ��e�yrW�c���-rrs�_]_���\'�4��q��v����]��9��L���Ȩ����(�4o�.�l7Ð��nwyq~v~�hm�O�[@Mԝ(���
jP�%���߈����.+��jx�/x������7X���E�r�l�/.�gg��+�y�r]dAg��VZ+��.��N�|8������Ӑkm��ɳ���6o���|v��/d�N.�T�����iv����f��<��q������|y���9��9�Ӟm�ӾU�e>A�4�E��h��l�daA�l*���,���ZN9��f��Y�n樧rt��֦r;�;M�7o�no
�����w���q����)唣�HY��^��a|���������[+�@��zs��SюQo���3ݣ�a��0�y����N��
`�f�,��GD<����.��;?�M�/E\0��\"�\'�U`�3ɂ�^�f���4��k��X��(����/_-�#�2߾}7MK\0J���=�݅����������t���}�\"u.�O.~��~
�/_�~�����7o�~�����.�λ�#�e�!@�Pݑ)�V���ժ�j�f֍C�u��81`@�֧���7�_�s�#ݸ��(�����qž��u��5ܼ�ZKYJYj����\\-8ebv���y��}>.�Ã��=.��/��.զy��{@��~�\'6��R�H��z8¦�u���\'�B�#109B/�.	Ǆ5s
3�B^��c���ZM��j�t\"����l?�o���0������O?���OP̿�����_��W�_�_��/��x<.���k�����?�_������~�����/��/^�x;O�4͟~��f3�WwsM�`��l�D5yU�ZK1+9K��˒8�c�^�͵�o�����F�}S\0\"$��7��d-H|���
]sS�Z��jU���և�^�0s�ʩ�Ǿ������o����<�K�/evp�>��v��9N/������?��Ӵ�я��68t���f��w)]�tF�%S:��7���B�d̙��D����
`D�x2�_�}�������v�7������{���ɓ\'O�}p������^�{�ҙ�j��g��G?�쇟m��G�}�᳧�.��_��o��������O?�n�\"bD�n����!Z͵�)��U��)	����\'\0�f��(�\'N��վ>��Wͻ\0y�}�����|�w�M�+�Xx������y��c �x�g|��)����y��~wss�?J7�<0�œ\'��������o��R��~����.�o^�~��ŋ�/�����]���r�v���X�zUKk�C�b�!��N��vc.lSG}G]\"��C�KD�Q\0�3Ep���\\�=9�`�W���GҺ�e��_����O�>����������m�������O�ðL����r���l;�,�Z_�z��0���=\0�� B\0j
��fZkvO�Z,���e�Z���JDq ��i�P7nZ]׶�~�H�q���=��o0gH(9�.�E\0lE~���r�Ŵ�U�Ŭ�iJ]��5�����y�����|���v���?����?���ūׯ������������\0س|���?��������?���/^<������_�|���td+q���?�<����
���u<3���d������<y��,p�]0���
�r�8 ,��[��0%Q���>#I�;I��p<��߽|����z3l�z8�6���$AC[������؞o����r�z���9��@���;�	���-It]�.��1�4�h%��8$�ČD�Y&\\Jp��}�a�,��I�A8�nH�p{{?�r�}���b�p����b^�߼��5gBB5��
�
�(�,Ka��c�NH��H��z5P�Z������:7�0�v?���s�uC��<n7$a)���y�]�����9;��q�E���$*bcw~��m�M�JD)Q?t��n<��\\��)C�:��L�3�N2<.\0\0 \0IDATK�,((`��]�*�e�Iʹ,��MU5�j
��C�������>����,D�ȉ$���%-��m��C�{0~���ͻwZ�n;|���X�J}x[�;�\'ᆘz?�c�[�3�?���\0&���_~}}=���B9	B��a��XY�@)�U�R�T
�$!�!:�#b�DD8A�Y�iU�Ŵ��xأ2N����d����,m6��ID�U�N^\\
�8���Z��-�OT_&Z�g+����\0����1��D��\0r\0��*l�Oa�>�ݾ~�j������L�B��
��p���F跨F��qn{��T���/����8��y�3�0\"PXX�e&�e1-Ό]N�wJ��%�6�M�W��1t)��ٍ�=ͰA��SN
g&�`b\"GG�LD���wir�w]�̉H��Ɂ����$Af u�Zͼ1w��4@ 5���_Q��P�bM�Y�卸O�]�\"�������z4D��wG�V��$�ȸ2yQP�XZ�����\"\"\'�9䜟>��c��<t}?&��v��6���w��������?.�p�R�_���o�����~���n�0����ȡ������R�bf��䕛
�\0#�7�94��HrG�PS3
��آ��I�e�!�I)�
�9����n~�&�ș,�U6U��D$��u}�w)\'f\0�a( � ���؃�����L(�]�{�rʜ2�.w)�$=KG��H�XY2��C\"BJd>7B�c�23�P2sp����b�����#��}+������=���nW4�*�E��r�����\"e&�f�f�q�	�!./.��!2��/7۳��5��޳��_y�t�Q�0�i�e���S��$���1��.�L�\"\0�Ø+C0!Q�l������D�ɝ!0sj��J)�0���ql}��h�f#\"\'bbg��S�;!�9�]\'Җ8,��<\"��Gf	��Ω��UQws����̽�z�8���$O�A�p��-�����T��B�`�*��y��	Q\0�W��+����1�7��V��A�m���l��\'��ӟ�ˣ��\'���EN�/�g��|_�ݣ���/w��q�����iZ������r��2	��	Ȫ�1�.1�	3��*�rDo�Ą�����[*,1�7���h)�m�)\"�K)�,���Ȍ���;���-�	[��4�X:���@�H�YW�!��n\0\0�y�U�L՛�TZe`{2#Bs��;�R/��Ry�p5��:L5Z�(`�c�2�p����cJ,�8%\"ɹ#fi�\'���S�H��&������U5N�H�\"��4Ax?���*�\'��jA\"
�m6�q��mG]��a�|�dǌ�e��p��΁\0	�)�2�#��9�cK/j��-0�=��@{�Q�jXN�8�T5�i^�� #�M�s
�\0��0�
X�z6%W[J�j����������H�y1
W�F�
Lkv!3\'!o�u�m��Rn����7�y;?ZD{\0�G�5B91P4�6�c�m�{#@͗FjP�&�$�������.��(�����#@E4�d��b-����sJI�:�TYT��n�e��-%`�\0����L�0\'�
������D��Ho^���k:)�8�����[9\"��l��0�+K����i���Ÿى�6thw��i*߫E\0\"��bz��	Br�d{v�%�yYơk9/���$\\�m5�kDq�Z���9�Z3���!\"��Z��\'�j�H�\0\0WCu
`�ĩ���٠1����0��e$���	\0Q\'52EUpwwd�$�	�J5��y>�$J@�@��*���{4�
k�^
R�pB&�0C��C,�F�j-7 ��n[E�G:�)��WQ�����L�;Mdd��Ak<$wðI�[�����9~z_^�~�Ic��>6�~��.�2��CzXBMK��ڃ�	��,��Cݭ�Z�檦f�n� a��F��x�o^)-ԃ־��[�O8\"�d�T	+8�Y6C�	#���R��T�#�<G.y�[� �����4��T�Rj���j��CI`AD��,��3���Ƶ\"�9z1\"NL	\0�\\�K�53[����Όq�\\����-�v�eY�q#\'���b�y7�݇Wu>.s}8��Ɠ\\\\\\�W�4���:cy�<��ǾG���>����Z��g@f��,u�AD�8���yDxK�j*�0ws�v|�;����Sr���=h��@�vt���|����#@�1��u]#�W]�t��[t�+@�}�j	1E��A\0��q.s�e)�ü,K��.6��.��s��T��
s)���1 I���)���Aռ��~bc���y�Ӏx匜�r��z��`�6�r333��\0��0��>����wo޼{��qw~��>z�mG`h� ��p��E_OH��M�=ێ�����a�v]����E2�.����>ܙ�(�:8u�\0n�Z�+�\"�yW�Z�P�~�Zk�U��f��w���M�- ��=̔2@�-Ea܌��g��������w7���~�31�9]�F
��T-���#I�P�
?�n�˱��Z�g���>|z���D�1̊���ͽ;��Β�cjK�)ly\0�[�S`�h��V�h�V�uM\0�f�H�\"W�.���XUA���9�
���o�K��9�&m����E�@�Hߑ��{����
����T���iW|���\"0�(�1�
Y����*��h����֕I�������S�����ݜ��p�eY�i6�����?�(4棚Ӻ,PP��ﭡ�{&F`�6g����z���H	���pw���LL�a��	��h��_#d�c��*up5\'n�
��Z��	�+aEP�
�A���w���x��<�����2-�0��v˛������R���!��=v�O5\0�*I��R�!�G�R����������i���7 X�x���\0��|8L�x��s��e5�:!���#*�����U�
:G`��W���\0�n�8n�+�q�z$w
`@R���aY&�����	��#P֬[�p�4�G�3��8ǰ��#l*�v2��Z�Z53m�t
�H���7�͛�}S�/������nx��3���|��6��	/�稿��{���	s�q.K,juzx�����M��I��tLln�϶N@�{�h���[�1>F��I[��� <A�@\"�����@50��9�\0�\00��U��=�؞�R�V�s�S-we��Y�G�*�B)ẻ��\0\\���\\����{-v�O28
qEJL���\"���<b��zc23�Sb�4��C�	���m( �?wX����v�01���v;*��眻a��!�=1�c��o���s��p��X��j	�
c��u)%�U�bF�,����3bѺ̮f*����ơ�r\0���cD@���C3\'3@�Y\0Y��yD����0pZ�����n����a���`jZu��d�=b�g�ृ�
�$�\"b�j����Ao�~4�Ʃ�����߮��O�\0�ِ��V�Z���T�K�����Z�2C@J2�y��n{�7]F!�r�59���W5�%D�M(��a�����\"��4`Q��6��ǩh�t]����)\"�a�D
���`(�	�]Į�c\0\0 \0IDAT�Ǫ:�š��ܝ������LA(�
/��Q�J�\"����a���+�{Yfu˩�yX�3q�]�:?��,)	\0��Rj��R����݁�Y���E�0��������H,�d2]2�����l���s��e^�(�8�.\\tr\0� �.%RW���W�����<��S�DȵT-��f��c���J�l���v��y)긩>�3h��oK�,�h��2363��V��&R���j��{��$W����-✓���F��3=3�%�k��W���\"��W#�pI�p��n�QU�yND��<NVu7��]g�Y����*t!+��#���>�v���a@�<�N8�w		h��\0�f;�g����O�S�\0h��� �����M�i8�����t���YM%�ֲ�6��(y%go�\0�$
O$QfT�k&\0N�J�ykk�.����T�ehnh��KӪ.
X���P���.%f�xc�
3Kl�<�^\\~>�������N�����!�Zy\0��bǓ����3�:M�����x��1IN!����fY�0��r*����[����H�L�����j���,q�3�e)�q�f��@b�6��W򣩝��������4r�D:wg��$eI������|�OM�9��a�0%a k�A8V���ڊC�颭jC��<#3���=����+\0��:��:�$+xx���cBC �����$2��`&\"P�u�<)����:��7��M.�����ڇ�S����yw}��I�ÀM��xJ��/_�����VjY�֚��+S�)���:wg�~�h����$L��ŗ�̧�,)o�ID�d$�pԶ������S;-�Ӕ@���,y�q�i�<pR�CF������ׯ_�ZE������z��i�0�6]�RKk����r\\��U��AY��R�����ꞇ)����0�8����qD&bqdr�Z;h��~^M�3���r\\P�e��4��8m6ye����H��p}�ДA��\"F[8V
�jU�s\"a�z��� �5�c}D�-�E�13#1bbF���T�l��tx}��~�?I���e���،���~7\\\\���i��)I�9��~3nU���������D�8m�M
���x�?��R=����N˩�լ��y��^���e����`�v��n�����t2a@L,,�ı��g���{�ܑjkD�L<�a�q7��� ����t����kZ�a������uh$�5oVD���fc�2��)�j6��!�\0B_�;3:#VD3/��51���)�c&r3�
8X�Z=�`��̛2�!9Am��ƈ��4��\\^�VKYj��&��xV�|D�晅��$வUO۾<�˾�h�4�#c�Í�̔D�./��=��-�\0����P�gz�����a~��h92\\ϰN21E`\"Ȭ�a;�pB��0��bM�ت��B���@�~�?8�k�	C9I����z���	_\"��/�=p&�|uyqu��l��6`w\"%�N��
�q����_
B��{��\0H)O���cCs���Z[k����j��խ�7��+Y�q�F}�4h���S|���7�n����kj)��8����6u����7W�4N`��1����oC�7���2��y7������7_�2s�1�8I�y4�X\"w���?#��(���~_ku��,`��\0`2DU-Ki���Tn��?7��Ss2ʖ�K��Og�.M�Z�,���L�@3pE�F���&\'�]�_C�����M[X[�;����l��4۴Zi�fW��#T5@���>�4M#��ّ��������1QNyo�==ݿ��c9ͭ-յ9�Ր�����܁������C$薐�^�2��j�l6)%3#\0+�`3qw\0_�eYD
��h�b�A���x�Z�*8� Q3+��3abb
���)�&�62q�D~��pTd$@6�7�\01b���yHM��Q���8�;8��:
/1:�-���ߵ����7<��)��fJ�cC�4F�jIiH�̴֢�̽�f��Y��#��7k�c����ĉ�
&�1nNI������h!�v�~��Ǒ��)���fa}�!w�b�H���
�9�ImjZ0t��U	��5���1�m��cN���͍e��q�$eaNI�a�$N����x:�1�p��jYJf!bz���$�B���ș�f�)��o��d�]�l�D�E	y�L�@��	Q̚��70\0ӥ��|��$\'6��*Bnfւ1��e~@DHY0�z��Z�\0�d� \0�N�RC7hڭ��Z�<�Qt�<r�y���k�L\0s��ͽ��fH�2�X��V؈��>���)���ת�ww�w���Ĥ��I����I�$rz\'��w)��(�s��P��0\"˸��͎G\0W3m*d(g\0F�n�jkj�IH�����I�P�zl�{�N�Ɯs��b������0�3L\0@�f�f�Rj)��j�ִ���\0&�#@r��bo\0��7��^Z�M�a.���$���gwj�S��{&�e)�����v)
6��n�#Fm�)\'�vwW_�����_#�0f$�6����8��_�f�M�ݐM�9�RUk�`��RJ9O̹�R�Ά���i�َ��Z�˲�N�R���ժ��r:O��v3$�Q!�+��2U��:/�TjQW��v?/��� /�}���/��q�
G�??n6K��#J��]Yj��[m����r:�܍��N�\\�*`9-@\\��p*�V�1a�Rl��L��9��S�
��\\��4���ʩު�f�.���m�-%��ZCBbB��:/�y�[�X4-LȌ���@�$u<5��.�|i:��T�S���\"�Kr�L��������p(��e��4w\"FC����GrDZ�;����s?߿s\"a��k��fZ�[c���o�~=)��8Q���/>����ꛯSNzG��pwX����?�a�S��Tm݄0\'�)m����c#58��
������Ӷ,J ��|:�Z�aH)�6ue�4$3;ֹh��Z���*ga3]J�d�Hǹ��Z݊����R� 1	���E��VfQӹ,��\'Fd��nH�\0�$㎾��D�W]_3�w�l��<:�|o:S/c��`>�Z�;��*��x�7��h֪��á�Vj=����X�d�.e>-KO���.Z
��HZ+V�\'U7����4��` ���8�l7M�����LM�qy4�c�O�l�jnJD�nj����e�Kk�E�T�\\�H�q���ء93^]_�,�r��s��)D�j����m�X�9#\"�׸����s(�o�����
\"i
����̃��b+�?��
��ШTU#Ȍ��aq��)�����RB��js�,�L�$ۭ·����gOs��q�[���j
�������Skͬ�jbq�v2����f\0~���;���!1�[�E�))	\"���l�///�AS>.��4WmN�Zhi���Ե�D���jv,-� �z\\�8an���š)�l���fZ�.�4�#xf�f�.cb8��/����_]�е2�����PV� �¬!)����Z����1i���o��3�����G}��bo����a���V[�VN�R��
�e�8#��:�b�Ab`:���n�	첻6=�޼�6W��ڵ��\'�a����944$\'���Mu�V`i�h�Yk��H���̖RJ��@9e
��{f�9�6��fs��\\_솜���x����\"�{<w>�{O������ܦi
X��;�C��>��t/57\"�f��9�c�v�������	��0�[k��ܒ�8m��n�l$���qHC�����KS]Ep���6U%@SC@rofVH�j���FM5�!h�Dd��|��̜7-�\"�rS�T���������b��S
e���f887籫���t7s���E��f#\"��7��ow��+1I�+8B������+5
����j3sp��
����#�`3#�j��6۫��(٭�W�i�m�91��6d8�,��*80ŗ%	�Λ^34�R�i�I\"�+�bE��ϣ��~ud�\'�*��aʧrTmy�8Ք�Ǆ�H����yX�ú���xEABFh�Nપm?��,���pt�� ���v}-j��9�xB�lF\0�R�)��v��0��fsrf�A��~��C-� 
8�1K�����Y��]km�����w���Z=|\"�O�O>���\'����k+��H:G*���it��zDps�u@$!$�6������ʰ[%u�.^��h��`�BJ,x2��)`�\0,\0��D�G�U�Y(7��5mA\\\"��$��Dn�L��RJ\"�L�g��)1��4��,@�i��9YS\0 D!`�hh:B`��l����g@�w�f1�B�n7yHa&w��z�G�5c����Б�/.�����%;0 ��J�$ D
�p�V�
�\"Ϟ~������?�ze��{��o����J$Gpu�>~]��\"1�\"uװ�1t��ƀL����]�\0������qI�d�cI�91z�N|���\0�!�J�W>��U�aO��L�Z�Z[i��>����k���}�7�@�Q����w.F{���S\"̹62/��W_~��_��_���ߐz�~Խ���0V���\0���>���ާ3�	��D\0�)��`k�@
T/�8���Շ}t��7`��\0��)���#SB�5}BO/���as�\0�b�E��
��w�EU�������Mɍ�ER &�z)&M�L�8�Ѽ�3��x&n�n���#�d2?s�m��\"!1�C�<�>�<䛛\'�4���n��?���Bx̪~���z~sG}�NB�DBN�U@6�vp�ş��׿�% ��uY���1ɀ	���)<���
A{HY��x���@���H$(�z
����g�֬�,�� O���\'/6ח4
������Z�-�Է����,�	����Ppڍ?��O�ti���n�լ��z��5�f�j����a�r6��c�O�.����g�&��R��;=֐����º�����|�57
�D<�����~����z�srb\0�E��6;Bs�#�V�8�#��jMM�4�t�\0b���}\':�\0�F�DPfa�ښ����-;\0j��i��v
����4:�N�D���+C�F˾�	9YĨ�Б
#1;��zvwv�Y?rʾi��v�T�+��)XET&g��R��I�����x���\02:���Y��T��H� �����f7�\\������������<�:4�q�{ss G7��Ѹ!4�����YFG����!����}Rl�!���1=ֻ{4�gS�\0)���+@#0&Ĝ�0��œ�?�����0F��	�?ų���\"����� �x��PX�o_�km�@D�DHͫ7t��@��n�Qϫx�W���Mլa���H�E�W��������G�����͌�Qk�ٻ* 1�s�a��O�>���\'O\\1`|��F�;����(3 R������_�\0�<���?_�����խ��\0D��u��DDT���w�6]h}.�Ld��y7��CϤ�}�Ь�o��$��R��\0�H!��TU >S)�8n�Q[kh�~���_~�o���9J�޿�ѷ��JL�q��B ����O7i������~����o�z鄼�\0X]P���\"����rȣ�96�a�o����JX��T�	�M���u���C+�RZ��na:��R��8
���=G[�:��W���q	�������t�����~g=���(l6 ��<L��2� FE|Q��l���]����z��ى8�Y\"��1(t���n?x�����3�BV���V�z�0�0��F	}��)w��\0Qc�c�j�1U�&�Z�>19:3=>3;5??��8>;�#M_\\]s����W>��u�x�\'\"k-������d���փ�~�y��B����rtbC�G:��c����)�@���!J�u�_���
c�9}okccS���������\\�l\"��8��\'��1
\0%�����՗�Jz~���ѓ��o<|t��rO!�dd(�\"Lʥ9b�G�j��B���`��B�} �Y�&�V�]\\h/�̬��ϵ\\?�3���!F?�#x��T���}Oi0#�\"t��gG��{{[;G��\"���{;d
ĵdla~s|l~yyw����{\'GǾ�\"�C^P�a
 ���zu��L�ι$A�!qdY��>�G`���+��D!��_�e�-!I�%���^�}�`��*ipm��hK����!FF�
;e���HT��Z&��y�k�i���OUD��_�\"��\"a@)��
!���i4�� ~W�A/��\'sIPҾD���s�q�����#y�r�i�h\0\0\0\0IEND�B`�","Male","Approved","12/22/2018","759191200");
INSERT INTO student VALUES("KICTC-CER-007-2020","Amani","Ivan","Dayo","ITT","TC-ICT","2018","5","kweka7@gmail.com","�PNG

\0\0\0
��{ǧ�u3�8��F�~�����7�����w��k0���?��o��н��䴾����>���t~��www���n�JH�פ~L��B#��}����Wx����;�w���7�V!�r�a�����b�9������S�#.e-���pcK#����\"��w��X�{�x�[����2nT
N��_{�{U�!��+��������HH�?꨼\0�������`ya�Lpz���J��-�Qz�N\\X������
B)q3ʘ��b�z6�i�]K��
-�M�_	�h�ا�v��6��n-�X��ޝ1�\\gq��,�3��aB��e*��y�T���$k��$�i3 :��r��ɴ6��G���n��[o?���[fVn�-g-��g�Շ/��J�0]&Bԃ�rc�TI&�yI�D�A��\0Z�\\��<���A~�����l��`�:B�-��[�f\'�폯�U��HEX!���¤Z�4��8�%j�V��
�L�|��\'�����������U]4Q?T̍{�V�	*��NX~F�V@bj-���i%F@̗|�k�خ�V���ɵ��d*���UIx��Q����Z�.L���s��a�s��ҽ���g^*�*5aY�{��J]�1����Q��bU?�����y�y���t\0R�3�6�ni2@��5���0(��â���P��\0�Xʳ�F;1f�̻�I;&$��M�.ӈ*j���9�Ր���\"\0CB�`�F#�O�$��C���)���*�+��f�*)\"���Z��Ŀ���d
w�؅{����
\"�›[���>u������9�
g�o���W��f�2�n{ђ	���@*�_<4
�Gc-ȭވ�t3��:�$-�9�τj���
��9�$����)~�C��>�q\0sV�u�.Ղ����R#��T���N�n�xx�>�GbL�3\0��	���W�\'��Z���?�r�Ą��՗ Ѿ���˼`�L�1�Mc���5?��
h�
���J�[5	DHLQ�N)|.5c��}m�T�5hyz@WB�Hrj&#���en��CL�b�(�};��� �gf��W}^���*m��Z���ͭ�^���2h�ay��r��Ϫ�)WP`僐�X��\"AHa�� l�؎�!S�}��P���I�ѡ(�ޠ��C�ғ�.�G�\"{rF�V�~���y�@1����U�=��Sь!����O4,/�%�YD�5�����Ö5��/uO���<�R�\0!-��:��7��K���a;�J���`U-���u���1\"
��W@;d���	[�b(scZJ��t:�d��q�!O���qH���{����K&��~@ԇ䑑H��>��} J-9tii�$��n�*������_Hb_Z�/����\0��i�Y<H~P�yw���O����O��J�&H�[a7+����vP\0�.@W��}���j
 $�?Jj/�{�������xdA>��|(RP��5������1b��$�A��F��-�-r�䗁
D����U�z0���6)P9�Z� �K?�[)��U����I����7F�:���h���&zK�+���r�T�P��&��\"F�^�G9��-�y�T)yK!%W�miUc*n�@\0�Ru@C�cn�I�\\�)=����g����!�{�uC����l�r�Z��T:�z�	ebb$u�\"*��zp����$���=\"�戮���D��EJ�����*�@r�\0��v�j�������r�`���I\"�x����X+N+���\0��l`b��3�S�:���A% M�T�L�-Z`�+Rgm���g��|�E�\'����o�2a�R�0\'�ڥT����.J5�o=%Ïb��|��T��:�4���1Xڞ�:B����#�~�UDcfx��8j@N�<[@O۽]�>�\\��%��
��z���=qrޡ.hs��D��4K{\\����Ҋ����L�
�
%�(k�D�PkڒE��-0�n0]|+�8� �@��,�	���CH��k}\0�[Ȯ� �_�k�v{fQIjpm�!�B��C8nyiXz����`E�:���P�����P��DbBGQ�X����+k?+��tE޴q�/����ZP<<\0��T�4�V�6q�HT���\0�I�\0aP�yiM֗*j�R�!�\"h���#�<?m���Z1�d�o�WB��b�Ýi��
�\"~Mv����x�o5-�-���v��_D�����\0�$��M�F$��u\\��M�f�{2�M�%��aB��=�B@�[BR16�N���9����
4>Z6/h/��)D��	K�e��ˎ���)��]�Wh�u���֣��v���~\"&�o�F@����%&�\'D����t.B�{��ک�GG}�\'���J���6���,�؜�E�-VG�O8�i;M�ؑ�[��F݂(�K-C�ȑ�+�����yd���K�%�� �_��u��:w��%�Lg��S�c�b�-1\"��2��(k��.�oc�H1!��p�}W�$(Y�>�A�Z©d��a��yU��A�	�@xj)@����б�h\0-�;
Y�ƃΞ��#Mt�JrH��+�\\�y���ֳc�7�:�2��>M�]�QbP׳���3���Q;0���v�!^�]Q���D:ۦ�)�!��.Ķ���V�\'��$m
��mtlI;��[H�
�Lt�L+,��5�pB.���ҏDiK�o; Dpq�=nQ���7eYAp`�S�!M-4�5ǅ\0�[u�P�@\0^	�,Z�:�3�y��>$r����R�r����q���Y���~�w嶚~o9Xޟړ���:�Bm�PE�ju2�y�����M�&?��#�B[���lTG��EYzq���t�S�b�N�j�E�i��x�q1���b�d��7��\0\0�iCCPICC profile\0\0x�}�=H�@�_S�R*
v�␡:Yq�*�B�Zu0����G�����b���YWWA�\0qrtRt���Z�xp܏w�w�\0�Qe��5h�mfRI1�_C�#�B藙e�JR�����%x���?G�Z��g�a����S���y�8�ʲJ|N<j����x�ƹ��3�f63G%K�t0+��$q\\�t�r���8k�kݓ�0RЗ��Ns),`D(���*l$h�I������?��%r)䪀�c� �~�?�ݭU���\"I���q>���.Ь;����4O��3p���
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:fac16c33-2ea9-4324-9a05-4178ff931a22\"
   xmpMM:InstanceID=\"xmp.iid:595fd120-015e-47dd-b53e-f1bdbd1ab213\"
   xmpMM:OriginalDocumentID=\"xmp.did:cdb4dc63-8486-402b-801b-d610d9c58b56\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1603715408360564\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:2a8197be-1561-4874-a7f8-b370e9dfd36f\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?>��GP\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�
��\0\0 \0IDATx���rG�-藈̪ ER[���9�������|��<�K�nI�H�ą\0ꖙ�>�\0խ>g��-�%�B����}�Z����?�o�r�r������ї���_��%F�ܾ��ۗۗ�r��_n_n_b�����K�~�}��/�/��-�~ID\03�����1���ɿu�v�������~ח�W:���X�o��֛�������\"��s���\0�s63���ھ�����}t\0U�G��OU7���g-C�Qp�~���������鷖x����ؾ��������e��\'������(������agD��Ҟs͜�8���/��G1�%���c�%�e�xL,C\0���B����)��ԛ?��`��o!��Ϳ�u]���c�!���9�%Բ�+���K�K��f�M�m-k~|���pq�h�o��RJ)���:M�0��q�i�RJ-[{���\0��C1v]��}��.��K��*Ƹ<�[ePݿ��l>�>�e��i�K��fb��yݎf��B�cQDrΞ�<4�q<���a�a����0�8ØҔ��#������k�C�?��B8==999�l6ggg���\'\'\'�ժ�v����>Ƹ�-�A�?�w�0}&1���b���9�=#���p�p��x8���i�Ԙs�R��q��0L��_�n���%<��Q����������z}rrz~~v~�����d�^o���f�Y��]�y�.;�e�nY�}�K���bԣ!���i��q������p8�pw�ӛ��ۭ\'�i�<[&����w� P3|�Ֆ�����p�������f}zrz~~���ӯ�z���󋋧���!�e��\'����\'����4�v�����뫫�������{VG�ZI�2u�G
�J�8��9���&F=�Ul-4[I8QΒSrt��C�R:���n�۾{��������0��q�F3cfP0HST�t�T�dyZ��\0QUE���1�?{�{��L�b+\0�\0���\0�]���c�`�����1\0�n��o_��1<}r�?��?�����?�|����)���պ��<{��*�/1��s���e96|������c�&�3�U����������ׯ|}y}���5K��$�����	��m\01�,:���h`�`�N�v���]�d����o2���y���jD@�:��X&����b߱����իW^d_�|�����\'�!BTQG\'����{B2�i�T���Z?M�.�`��x\'\0��SJ@�>9�!\0�q>�|x��O�~x����˫�~��]Ed�����\"!�)������9K�Y�~!�  x�*��|sT�h�����?@�l@��a�s��b��Y(��4���n{w������/������O.6�M#��Ӌ��\"I�����/1����,!�5��\0\0���jE�iJ>ܼ~���W?���������ݧ�\0��dT��E�Ė�BF-��ا�t�!ZBi�3��+`���:��UL�D\0D2����Hr>�<�?���N�x{wuyy������߾��?|�͋��}:����I.5�g�\0|��(l���6�ADb1 sJ�����������}��?�xyuUKLf&*�[S335�(OM�@�H��
��/�������=��{�Er�E*\0$BB�9M9!@c��10唧i�������������.M��>���zCP�����Z+������d�)����B\"D��p����������W?�z���q��}5����@��A�+�����/32���;��1�P����cS�J
\0�X�K��엢HD$$D4 DD@ �\0\0��
�SU}��E���{	6�oe�ib�U�9��v����W�~x������]�ڃ!���#g朓��
��i�U\0�`N{�U���Z�{�\\>�q���h/@�Q*\"{O�\\��u���׌Ib�PD2	y�BK�3����J\0����**���Nͤ�FUe���^+���w?�$i3�1^\\\\����B��~!���v����|���O?��n�\0���qE2��b�����hd)3Z�Z��CEF\0?������dD�ׅz��o=�6��LĖl� F˨BE�c_���������@�*����HEQ3���qe-��y&Bh\0\":��޽3\"�S��ӧ��K�/g����a�n�o޼����_�����f�&��= Pa�BٝK�di�KB;�g�h��)2�D[��ǥ6�z�>H{H�9�B�1�HNYUJ����
F���� �	{Y�����QU�6a0�R����Hs5
�RE��
Q6RQ5Xŀ}�4UeD���b�iLIr�\0[�l�xܾ��ӳ����z�~��$g�i.3�����( �	2)x�Hhf�8�����;�)��������\'\"�9���D�2�7�cc7���b$h
���)��/\0�BmF r�_eU;fn
�i�s�FXk\0dR+rR4��<�\0Y�8d�_A�0550TS4��i�9�Okm>��*ϠY�x]�h@Ȁ��0���N�e +	j9�
��LDQDw������pL)�����Ǯ��RDܬֱ���������//��֜�����!�T4@u\\	�9��p�t	��G���B����V�/9t&�001GfN�wn�!�Ӣ8�`��>���m($\"�j�����l�B�7/�5\'Q�%�ޙ�(�SQ�\"ޑ�B����JC�z�q�z��B\065e�9�<�z@!4D��<���Ϟ={��E׭_1�f�^Dc7J�q��x8�)I�*J�&�?>�G���N�IN�R(]-/�u?0R��W�
��TL�\\7LD��%M����DT$r���zt���֠���K�ܸ�UUPC{��\\U���
q�+X�#UU���H	�\0��&��]3��p<�G�߆�I��CT�@�j�&Y!�L�0�8�8�iR�@����`6���U���y2�)`�Z��hn{��\\����80c$�mx�(�����������������AoZ,�Kǯ\"-b��ER~d����\'RC#$fR�����@��Ǆ�n�ZG���0��n�ߧ�V+���h�q	P����-�4��8�0�q�)!\"���.P#�#���5%�4/���,�$����j�ң3\0��4+`db���-\\��S+am�$R3�\"��E��\"�nD��KV�c�e�4��EuP.�Zc3\07Iuy����Zz6B\"fE�9@��ێ��������8������\'F���w���iI9M)��b��N��h�5�������W���AO�`�RO���9�\0T�E�Dd�X�V��T���:�L���Ȍ�)��C4Up��$U\0QwL��b�=|��T\'$(>��ʃ����@YU�qoooooow��fs�u��iӯ����DjV��u/��M\\e��hh�-y�Ρh$՟@�����f�U�/�/���הX7B4�j�\0j���*jB�f���J5�b�z�V�|�Z��Z��6C��؏$4@5P�s.r��*gm�_�\0F�z���f�0V�̥Qa�����Çwww��g!����_-F��n�E%�4b���-ZH�)��H�Άj����:�
���U\'�	u�EjM\"�(�ScCXu��Z�A���U�GX�G,P���,�G$.�t+����k*��dS�hP��%WV���S@���Z�Ʌ��]NV�b���p#���Q�0�hi>���8��oonn�������g?�U+E�A�~A������bsVx$�nǞ��K�O-����Z�-R����#���ܚĤ��(����}-.�`���|��M���|�fwn�+yT�ʩP�.�>`.\"ع�25mVe~UHX��g]��^kʜ��p�����������3�Q�9zE�`��j2�iJ�H2����g��L�i3{k�;.����h԰{�oć0C�z 43���b%��6���Vf�M�\\N�b����1o�Y���i�1�*���ہ��k�2\0
S��?�-�[�������\0\0 \0IDAT����)�sq�sN��%;��H@������Wͣ��`
Y��B\\�1���Ç��q<�eBPF.l��(fb�<(�#��͈j�ՙ���W>��T%�8[���Y���		ĜW*O*�UA��F�T) ���gᵶuΦj�Υ��@ˏ�bՉU��?$8��g)�Vg��},\0	
T[Q���SN�GU����#3�R�a@@�)�)[����0�1�����a�h\\����\\�5���\"��8��]L���o����w��7��W�G��?[�Q}t�WώL7-f7�PU�9ð?�w��zsBMJ0WP�,���?#���Ɗa����*U��l����0��\"Ż���/�\"���t�?�u�X�g�ҹ���]��;[m��򍰮�+���\0�H�V<�\'����V�����z�����
�Ō�͝(��]�n�|������g����BԆ�>YE��k��ywQ �z��C/�Jt���Xa4�CTQk�lNL
�_|bV����}���Y��w�L�#�y��[�q�~�f������EY{t-����f�����3    G��a�S�T��$\0����*�����|+n&�XV7�a�l�h�l;*�6��b��:��2�e�XLZ���p��TZ�%8\\����xk��̻o�!<P���)�s���՘H��
��lϠ���	=����ݟ@����z�y��e�o]�`Xų���=\\�P��ϼ� x[6Ň�v��ْ���԰48W�Ň��YVx;jP
�4;Zl���������
�V��������G�	4��W��{�
s�~�(>,����~�^�����9�7$�ܕ�rlSϥ -딸�t�I)/@��!�nx�P� \'���K5ԣ9�\"Rm� -�\"�vXL˱��h�N�T��X���TE�MDa�tivrDG@�	�إ��:[�{I�TM*����E���\0\"���rk�R��Vޜ�e��	����~�Zy�É�l�L��P�N�v��~���J��uh�$kf��yX�y������ڃ!�}���{��7,�M��\0m�E5\\��4w:
-�\\��9�LŎ�5���w�>�0�T򺧏�Mm��aFo?��n�g���c�1v]qT^�D��.X|���r�*&��a���d�*~s�qݑ���d�.��-r���A�⯚�@��l�9Z62>^$����$�2�JF�Œd�-[��y�2�B�{��,�\"fn#w\"����gьP\\�cH�h��@=����/:�[qq�~g�|���v ���7o����A_��R��Ԡ�`��1�#��9��1C�\"`/�>��X�@f���Қ��f���7��*�vSz,�X8ދh)pfmF��<@!�ᔥb�)K�&U	u���)��Z��~��}�1 b�`L�0�\\����K�8V������!�bA7���$�\0��R|.1�@L!\'IY�,��n�z�Ջ��w����1`��O(��x�{wi��Ł{��A�룗<�#\0:HP�����\'ʱ�&*j9�HVSҕ��P\\��)�Bs��l�rT�	Tg1)9��l��܃G�ɯ��ڀש��&���g��V�_
O�`lʥK6\"��c��;��i�f�~�f
�D]�ԃ�e��ugO�������NVkMٲ^�yG\0���)�\'��U͝�J�Ҵ@�u�������_�|��n�&BdH��t0UG^;&
L�=c`� �\"���iJ)�N�q������?����}Wb!
d�4\'��\\��e����b�J{�E^o\\@��)�T�ZdY��j�WPQ3Q��5KN��
O�f):�iʹ�Es��Zh(	��P���1
@θ��/E�.x�Ey�]Ԥf��.���=�tJ2e���,�/�\"�B��/;}�����p�ګ���,M���9O*yJ��d�Zc]���@()9\"Q]�1��q�b߯ ��!��`��韔X�s�TJ�bťƌ��m%��no���3,a�hY��9�4M�8���4���4�)��R%]�(N�H)��6�?|�GdX���}�%�2�u5�b�Ӗ��|��lS3`FÆ{7ɼ��6����L4e�r�4Li���̥V����������j����gd��\"��G\0�\"����Cb�ÉI���`�\"s@��7�pz�OϞ��U`��ϩma�����u��&����#3�Wݪ�L8���	L���	-�ϐsJ�q��q�qLS�eL�����h\0bQ�0�<t��\'I�K�l��\'�\"�����:/�<i�b10f)���tUoS�B��H!Ш�hV�YgOW���)�)�q�Ø�1%o�	��v2��}���vb�6�A�-j��Dn���毊T�����,�U0_�҅���Uq������������h�G#�ψ�Wvf��<v]�Y�#�L�������t<�}�voX�]�K!��i�o��4�ZU�8����P+�g�*1�,9{�\'\"9��朆�1gAPS����\"�B�u}׭������$ul���G3HSJ����\"�X֔s�AATS�)�$9eII�*�Bb��ݺ�1�NE�C!y�����V����cBk(WS�C]��KW����@�����b��n�����n�a!t��1���!�\'_��ks��|DB\'�w!�1��ӓ�Oο�x���j�o������DgA���v���D��)��.v]�;�MA����*�2�W|�L��u/�����L��0S߅��V]yR��!����<�.�L��B��*H�T�M����$�1v�7�v}����_u]Bd
�!��ؓ^��+\0�p�j��SJ9\'Q\'�V%#��o�w�\0aa�w���D��xw��W7�v�9=;=�l6�Aŷ��V_4�l����t��jJ�~\'iw���p4F��*�w�3B��ug�M\"<���7������#bߕ!�,�
U�����T@��č���1��a)4����fM�\":Mi�)g͢\"���n�*�-F�F/\'��/Z��V�~���w�������+�T%��m��	L�)���#+@N)O�i1;R3�I�bL�
�3��#��S��aD\0��������rw�3��n�$)�4�dc�������XF��P<��z�x�sT��CaH�xL��9w��B4�y��m�*`R
��2MiU��,`�%�	22w�(I>U��+z�S8\0��b�8O���q�o����x��;��h|bݻ�k��]�}\0.n ��vSM9S1ɥYI�`��}����8��0�bDb��qJSJS�u���I��vWEò��9pue�]-�Tr.��АD��\"�2Ss�V@P��0�Ô�~�AU	Y
�!��(Ȩ*)O9\'뻎EsY*��>@ѹ����a�jP1�gf4I&D!$� �T�*j�kV�q\0�JYt��p��LЯ�_���#\"���8�ӄ�hL�͊��!\"\0bII%M��i�iǾ�}�9�C�K���y�͗�u�1�x8���%K�<N2%�2\0����C�T�e��!3�N�q�x\\��
�w���S(�P랶JW3P�NI��;\"�
�O��U)Y�4��q�IM}���hNY�O���iJ�`*DC\"`f�������1�.�h�>�T���#��X��6TD-�\0�����iP�-����0
3�]<9??߬7)��n�����~_ ��Ͽz���竾KӸ�����4ɉ%)g�����������)T�M bĎY�6�R�.�T$%�)�d�Pu��4jVk��m�7�qE�����f�:=9!�!��p��������.�:�k���@KDdT��GLĦ�>��s���j����l���>���9�)gUAP8��ۓga�2��~��c]�MT�\'�~�9 !�.�ĔSJ9������QX-��μ�e1#������x��b�>�R��0N^_W������o���7/�z���nMd{{���8�A��bbbp�W���U@�Vg��s�m�&�`��W1������5b
Y�-��P���d�&3��1t����ɳ�_�֛$��~�����~{8�8N�������l�u�4��$Y4���K��~Ue_�l�W��C�ёMP��49߅(Q�D�S�juKLY������l6g����I�2d�ǫw��)\"#����ӧ/�����˧O���a�#�>D^�)���]���2b��	E4R6T�ګjN��&��i�)��&vg�5�C�ܚbh@P\00���#�QRӬY�#����NO��N7�U��E�.����0�7g��)Gb���4�$�<��4�S��j�9=��x����/_|�2��v����~L�hF�l%�@�xڇ��]��n����1��XH�!p���90q@bD.�/��NK��@�q$f�)��\0���LIp�dԲ�q�C�w�B�]���t�b�����u������Ӌ\'��M�8M�p8�����ȱ��Ű�W��j����]\'���0������)p���.y�ҔLe����9�V�u��]���
�>�I��N��bC!1����!�������|�Z���1!�ja��6f&��Y�|-2�R����������������$����a�����p;NID4g�hg���Ϟ?_�=\"�5�?mf�~��W�j�w]�@\\t��1�c�u]W�\0�D�t�2P/`>a� *\"!	qP\0 ^q!Į�!�4M��0�����JI\000u1��~�^K���;09��;�R�!0���d�>�lV}Ǿ\\E38�
,�\0�\"
�	�\0�W��,!�7k��;Yo����]`Nuͻ�}�=8�������R�f�ԅpvvz��ɦ���v����U-$@�U�o� �q����m��qv��j�[��=y�}�o6�\'\'��cN:GK0������������ɺ��1���ϙ!b��wݪ_��~��^%W�$0��)��}��(��<e\"f�JF��Z���g�]�!�}�#R1��ᘳ���כ[��a����l6���^r��,��H��c�B��.EM�DH���h�H�bDh�`�np`B�z1�.������L!���\0��#�\'\\��k�3\0�]b�1�!������3���)\00M�4���1���Y�\\I��)�����ݹE�2�j�1���CMWu&3#H�/v��,� ���#SU�HD$�� ���L����9߉�+HD\0I\\ݝb��	C��JA�2�Rx��e�������Q�Oj�\0\0 \0IDAT�r�w�?�û����?�;��~}y��j�������dN`^8�x7�S\\uM51Υ�%O�ӈ�b�SG���f������$\'���B�0�����a�&3$Α��׶�{�����H|>=�T�.GWih\"Ҫ�\"\'��ĉyʘ�AB��{z� !gfsRW�DJ�ʔ</9������O���@�n�%��A����^���(��2�e&wSݥ�ٴ�����=>�����^��^�ײN�$��\0�911Hu�Hc��nhnb���ݝ�e�{����䲽���?����w��,����ab^����\"�!H[���_//��������`j*��1�L�!��\"1qFL��13�B��:E& @aҜ�UɌ�Ecu�C\'#��YT���윁���l�I}|N��� \0G�A���%p@�iZ�y�NN��� ��!�ssa�Y]A\\��[X��3�1:`���������ݽ�[5H�r�c��ם��[
���R�AVhb��5Ad$H	�ܼ����-Qq�Fc��4�33�<l�|(����zd�{^�B�)�y�T(�2͜��鼮�4͐�*�����o�p���>(]��e�ϧ��>nO��/_��e�_/�j��T��� yw�;z��߆*y�=C�ALj�R]�����{s$���T�s�KN�C!I��]��n
`�줄΄ �����af��쉒rNLɈ��	:͑:a-
2��Z������};k4�#V��(�|:�?~�����˦��=9��9qN��∪n�v�J�g<�kh��Й e.L�z�ʘ�3�(\"Q)e��yYb:�?��Ə�\"$d`W04À�Rx�m�w�/���s�Q
���0%�Iݫ����#�KQ@or���uO�kI	�Q�)-��޽�<��>�����Rʲ�	�v�G��\"r��	��bh���\0�&���>�h�˕s��	��X�#�ݗ�g,P�.j�#���B��S6�&�e�d���)D�1N4Gstg$\"NSJȅx\'n�m��Y�k���9.����&ƻ4�#�+.X�$�qi�����htv�2/�̀�f
nAȧ��뮁���Bm�5j�<�n��2��������/�?�wgd���ŭ�&����儐ؑ
]���u��Ȼ
 ^w���wL>t�cwp���`DА�Q������әshQb 
���:Qt���{O��ޫ������)����z:O˲�ϩ��g&F1�j�jF�8��ߗDk��8#���*����WH̼\'<F�]��є�\0�\00��Ӝ�iʜb兹�͚�������+�e�Vձ�Q�u�-I���W�L�!+��\\
��)3���qRi���:A�%�9l�B���ٿ[A܃��f�ƭ^����gkl��@�\0��<-����|Ner$4�? 9�����?��)���p�N�!��bJ���,kY���S)j&��MD5��L��9p0�!{Jp�i�׻����qoڢ��`�<%J	��)�d���㟻{J�fj&=�6�z�
��M,�
��C�S�7�Cɇ��ӟD[4g\"FH��R��mZ&3]�4�U3��$����ݻ����D���v�����4Sզ	e�%�K��4͔��;%&�ȷ`��ܴ4���L�S&�Z�xdsΙ�%.�)�e]��Et�.Skb�zى�Ly�\'�4�*AD� �nWS��DĄ�i�`8�Y���	)!AN��(.R)Ӳ\0aq��הo��9@k��bC�k*��*Z�+��8���X�5m�
j��#g�L�!s�VŜ\0R�Y�<����X<��T�Pa�s0����g��\'��Ӧ�I��)GJ�dߡiʒU!O\'b\'���e��\0,���@*�L�ݥ���Z�Q�#����)``���S)��|��C�fSd��@/]T����4�N��i�tC��+0b�]��O8�K9�D䑒�h
�!�\\�R�<\"
����#��nbbcf#PԀ��6iMU
%N�m+�r%bFwTǪ��n<5G��)�\0�D��hm��d�1���G�Ҏ���jH\0��9�����S��zy園�ر��r���N�;2�4t���h���%�Yw�\'!DH!��l�n� �k_��`������A�� ���\"%N�2�B����=��l�jUEj#fM,)�<\'�`��T2s�0�0�k����g��P4��@��*p��D{����S2�f޴mM�<,���$ �y��@���!#�u(j� j!t������_�����Z����đ#�9�Z�Nk���o�BzL\\@Ŏ\"g\0��5�=���O+�
�	�L)!\"r��s��|�ƺ��^���?hx���Ŵ��&������T
\'�)��YZ֚�U�&���-�oN��,
jr�j����5���Հ:�\00q��Jw1L�e�{���������(7��?~�l��wz>�K.˼ֽ�W\"(�Dh��HJL���L��\"DK�	��{\0��\0��=<���vy���L)=���Ç����/��ᵶ��D�R��3�c9`쪟>�#��bK����`���/�h�M�ח��j�9-������t����[�\0�ZQ���z(�$[�I��P���n� @�i�М��쒭q۽zU2�bN�1:��Il�zt*n���m$��51eL�;�iUm�aF*��ާ�܌Z�yY���5�#&��{�.\"n]�x��,};�Q�E��8�ݛ�� ��U�e�.[�޽�o��O˺���ě�Z��n�B9�Id�íncV���P���-��W����5�m�{UG�\\�e=-�i^N)\'TS7SwEQ��(^�#REvw�����l�i`�T��lRb5�]swt�N�\'`@@3���`b��v	1ڀ�v�Ђ;jdD����$Ǝ���4�iZ(M�JB|�{�/Jvs$$��[ώ�o&�>�G*0����
��/6���חWi�rN��]����}�����痧\'�6�����d�dc����p�MV�Հ��is����������\"Q�Pz��;RU����F��o��� y4�����՛JkҪ�&�Ħ��F`��^�(
F
��^y�]��B~?�PJ�}Do2p���/�/�-dd�
�1q8�!�4ϧ��t:�R���e\'}����)\\�4	<@Ƶ�
�\0 �v��Q��+�R�)e��]SbFbs5�8ӛDܳ���Hm��7��ǘqBD�3Vɲ,˲��\\JI�t\0������; y�o!�
�� �|�����Df^�y]O�<���&�2>�iu^��1��Vw�6�hcǈB�T���PCD�_^T��F~��!A$�{1����iZ�eZ�ה][�q�`� ƕF�w��8b�T���.��Ȝwֹ��ݡgΚrék)Hh&:vS�&ښ�/�,pݝ��a���4O˲��2�s�=���M���\'r �@=�#���J�$᪋v��� 0R��Ҳ���iY�\\�.��S[Òr-ô���6�	�-�[��B�{�3�,��i�U��U���[��QE�}�VGP&E�b�IE��hq5��r�Gy_��K��e�C��j$�3�G|J��f�Xb:�D�����&��N���
Z���.X�F��\'����	�c�O���D���3��AȉK)��=&��G�!.�@
S?��#R/F�_��J��b�]�.�&bbg�������������3p���tdy.��-��;?�#r/����݌ՍǨ�p�̇L\'�=�#���:�.SG7W��*:����]6E�׽�9 s.������t�
RxZ-�4�����,�\'k��Fk��8N�4͓����������{�wUEB��}zHA��
&P�ާ�z��M�|��\"�m��|���ѮP^���]e��׽aDe ���v���^�U��܀H�(SB�����L&F�[OI)Ŕ�I2q\"տ��O�OO�$�\"���t()�u�F��P��(���?��U��E=}��C���2rJ7�zXL�!��;�2�&Dq�<���`A�S0�:J��]�+����p7�_��Q�
�C5n����ݒ�Wq#PUW������3�4m*�c��3SdR7\"Z޽;}x_��	�	3Ϝ�A��JN	�L@�O�檆�h`\\��
��g�1\\9�q��T�5%HL��\'�
�5i\0�Z���~��̉339t\0�M�qoQ�	!��>�bdQw�ּn�j.%qQ�k��Hkɽ���f�(�
!��� 
�w�:O��������z:�<�H:�q��.D��eG���G�s-���tN�t����c��h�,f�ΌFj�Yd�{
#�C�Jm��E����x�8t���E;����P�!�U�f���������|w�т����=�̐)�7u��������\0D�|w��4�[Uѐ�@�C:�
�s���)�u&>����R,��2�O^M��۶1�K��ʃ�-Q��@��gSQ���)C��♘�����W�~��
�\'A��	��Ú��Q�iZ׻�w�?~w:�	�(4��U�4�W�ÿs���\"�Z}g��v��D��f\0���~���\\����ڶG�B��G�Dvp���,����.u��%G�N��[�-�9��=��US�U�7�\0\"��	��E�n��x�#O�]=
D�n��Hh6�u;���,�l(NIt���������~������`�\\Rɉ���V[mU��F`�����2^�\0s�h\0Wu���>zؚ{�:\\�Ǻ��$�D%�%O��D.����9�����H#w��0G��GN�;�y��D#�ʠ��&%	oV�P؇\0�{
��>ڨ�i�D],l�ݶ·�ɘQ�m��*A��ר����QBJ���M�z�{xx����OyY�:3��sÏ���ֈ\0i������xn;����+��G��y�J�Ϭ���\'N)�\\����dM����9�&:}a��C!�8$04,74�
��b8�X\'Kt�qd��a���i�����ED}���{tl����6:�X�A� N��h�
�&��1e�1�]=t@>6�n��&��\'4@�1M���\0�)J�Vѭ֩�2�T��9ͪ\0���W}i!��5&�5�d���/�w�������\0\0�{km�l����1a�9�B��V�4�K�����K���Y�O���1�G)�����ѹ�^O�9�
8����K#G0����P͢ c(���ǘ-�@��U�j��vٶR&\"N�S.)�7�;U:\"}�)���+:�8���QL��ā��O�wU�\\6U��u]O�Yk���4<D3�k��L�S�Q��᳄᥼�5o��t{Q����X�̬���4(C�?��ι�����6T\"�iF�ih��?v�#`����8�<18�YiU�)��wA v����Z���S����Rj���Kk��oR����v�w��m�͑z�V�b1��
L���ח�O��/�
Hh�j�D�}�l������O����S���kp�Q��Hʜ2��`�I�n�3`�x�s@sBĔsb�\'�y.=ω]�Vh�cP�I��#j,����h��n�����
ݝ���y�����^�I,����)sR75?�!�!&�4��, UB��r���[��\"RZ�w�K�9q��Rc�N��pw��_��/�/��.��e:�������,��y�Fp���hx�2�i����|^�u��\0�\"-���|~~z|||~�j�<��7qΩ�\"�l!174z��B>�����.�(�<��#%�k|P
þ��U������4M�z�e��doj���]^^.��u��y-���P_E�.:BbN<��O�rZ������i��6z��#��(���v�� ���k����j2
�i^N����z:O�D�%�_�iZfG4�iYR���z}B�N�}P�Z�y.�Ok�\\gL��&*�����_;P�6v{Y���x�ǧ0RJ����G̑j�|�Ɯ`���U&���� p�&���Z�۾�
��~���y�*�F�?�y�j���L�J������Nb�@�0�����1����_�]�@�9��aY�iJHL����pk�D�xM1���#�����}Ի@�9�e]Nw�����ݥ\\���#�H�MhJ�������%?~�������>=}������O�o�ھm�sI������ ������4Q�V]MExp�����V��6|��H=H�zь��������1Y@�n��΅�bJ)DN�:�X\04�<q$��[iR�}�\\�AU�e�e*yBJ�L\0���r��m��\\&���\0�(�1l`�4���[k���D�4�қvů���\'��N7j��j ���t��?��/�I�\"9�`�נ�	\0����L����������������__�~qm:��#�x��%G\06b�`4P��LZ;�w��R�a��!}>��|c�ޙs7���h�\0���|(Yßi��52�D���La�+C���OsN��4U=RY{x�H<�۶y���݇�>ܿ��������8�i��e^ָ��;�J��
S�^��0��t6�/_� ���a������<��ٵ��/j�L\\�y=���e!f5Q���<�*���)�������z�k������?��_��y�xʅ)��Df���z����h�;!aJv�BU���S�IUs��	oePo�Q�v�눷�EQ�fq�:���ԣ��/��&�c#[5$�8�\0��?c���9�#__s�<.���/����Sʥ�!;qnJ�/멞w0�����OSJ��\0��R�u���߶-��O�������j/�tC��%���g��p���o�(O��|~�������a�k��\"\08� 7�}�^[��������������׺o�ݭ�*��)3\0�Z�0B��@i_�_>bF������L�I�+ErM�h��&{�CF�G$��D��n�ԝ-�fDH�s&&31���8�\"q
�pԮaH����i���CP*z���\"\0!<},��m�L�9�4�GDd(�����I��vf?������������4ڑH�:y��U������#\"��D�rF�F�5��u\0������w]�g�a<��w���~��a������1X����s����[o���lnnn���~�����nK���k���r[��E�k_��h���U�B]��b�^o6�����)9���C���{���D�1r�|����l��L\"2M��Q�FLSQ��M5��ՂZ\'�G��2R0	���Y�1C�����,P!\"K��U&S��bL)sOU���I�U��΀�8���?X��PG�TF�\0�(�q\"����iw{{s}u�g/�^��zyu�yq���- �v�>�P�@k���k�� !G?�sn�Zu]�Z��o����p{{��nooo-����kV���f����\\1�\0\0;^.W�������]ߛ�Ck�5�gpcI�e�,i`��2�`Q�ePn|����e�hy��5v�p��Ū�\\�j�w;O�G��,�[�����Q���зs�]Iff2y������`A��%�t)�3K�榛����v�?ϟ=�O�����/�]]��п���i���AYf(=�2)N��c�FYt�}��~���t��
+��ޛ(3�>(����4�{*ތ\'�ѕ�G4��,��d�ؾ!�Y/�Ք+Jfƪ*A>��m8�s�2\'�U��|�|��T��1C�4M�׷O?_��C|��Û�������9�����$SE� *�����朳�����~_���ʞ��)�����`��P���$J��Я������r��Sc��ס�Q���2�u]�ubI;$��/9�<�Lz�ߢJ�Z^&B�B���?�g��M��gK��M�y���`Βɶ�m��*���T��	2?
\0L\\��yxo��|ǵ\\xj��G����ICr��W�[h�\0**xZ{T�JS�j�[٪E�n��\"6�PM2��~�c�@\0�~��������n��sfdjV{b��	����2�̾���1s�����N�d�k�l>�[�Ѥ
�ˮ_��6����˳���AKC�|�����T:hy��,&\"��l�z��O>�i���p��$.�`H;I	E�dh�@�yj���5�_���ZVZ�)��}6?)�Q�r�	U<�R��D�a59�#հu8\'�q�w򪏏El�6Z#�rzes�+ۻ$��	ٙ�ڞR�6mo����0�������jD�\0:&\"`wt��RU�d�Ţ\'����];<��T�	��4(�����]�{�����cv����������Y���|�/�<��U�i6H%p���m�)���~��Gۛ�O��?�n���w�悤�ʐ{X.d����^�;!%0,O�3��\"�E����涥�F@AUe,�z�i;s�_�\\�qV�t��Mйй�
�ɶ�5FI�����8[ܨL�a{{����i�ӂ�K�lZ����(#h��<x\"�!Y*4��w%\"���ա]��:��KV��/R����U�w?C	R?�%5�􎖫��bsyy��l|�s�`VJ�7c����`{���B��o�@�����o�}=�����7_�^<=LSF/!	@%��^\"\0����F�Ԣ�ʣKlV��u3 !���lt��WET����M�,�D$)�N����Z~����M�\'�zV��,E0pR��?���u}��]���%�$�@�p�o��q/����dAQdD.zT��(�����͛�
�$	��Щ�1FTX�׋E�X��8<������ţ��{��F�
g��I�oln}�=�
Ƭ���ևJ�o���`~Q���y�:ρ�R��0췷i���T�@�����i\0���9���S\"%D�&�Mt}��%�$�d�w��dc��0�pn�Xkx��HB@)I�e�\"d�u�8���l�\\=5}�zY�)�Q��r�\\��V��b��9W��@\0�;ۗ
�\0�4\\edv,�s�>U�1����cI!о_Ѱ��qT�.���j��ճg��������4�Eeع]O늏��F��*\0��M4�ܵ�m�KJ���2�4���\0�`[ә�j���
)�4
�
:%�ko�^�|�d��j����bO����1#�#S�:�l�Gמ�c��*��9d^t]�^�I���0��8Uq��p8��1�R%�:��i�B�[p�U����(���.Q��ՔrE*�\0c]�ˊ���<~y��ʳ�q���FD!xfr̋��t9�/nn����?��ѷ�b�VL���e\"DMU_�A�
�@���Y��p|�U\'s�EY&�5���â�i�i?@�^\'b��$I_>}��ۯ��W�~�X�Lۏ� 0L����E4O������,Tx�s�B����c;��~c������Ԇ1\'Wܻ����O�f�03b[&t#$��EAbrl�fc��;�	;aJ��x@[US���F��mɦ4�XN�=;G�Q�u�ALc|1��������˗��l���4�ݼb�+u��h.\'Q��LO��z�6�1h��I6CQo�OBu��[��a�nvn=j}�6�ԗe\0�m�އ��l▮4M�1RATf$�E�O=�����n{sv~Ỏ������#���L�#���nh!��)��֍��
��\"\"����b����O#\"����O��w�3;Δʜ s��n��,��R��0���i�@�13�2&\"+�,)���Z�`w���j��5
��{Q������ZEw���͍�:�;PH)&�)M����$�\"���`f�w���]�6��<,.�2i�\\:+�K�؄Bk)��2��Z�tjD�QW�9�\\�c���w�Q��\0�w������U���@������v+�����|������� ����q���L���9?��;�����icr����5��w��2ӟ�
!���U�D��F7̤�1����,�XR���4���h���(!����LVC
X	혉P�8���������|�y��k���Ͼ������\\ٷ\"qB\0BM	Tz�H[�Q�I]���H��^��nW-�zT�6W�z�\'lAz�$-����`��:\0N>��ֲT��p��M�c�����
-א�u�R�<#���\0��V쒹)�	 �t�Fr�fRJP��0�ꏀŭ3��0��{�؞2�u�����fs~y�ru���/��_�/��
�7�I�b�T���h�Th�t�؝5Z�Ɗx�DD�fdZF�D�?`-��;�8iE�;R�BQ�AcT����z�i�Ө��[.�z������ez���?��w��\"gc�``\"�$ISBL�1��>��TC�	�
�窶��h�����4a�L�_�ն`������4�%WT]a�Z�V+�}Jr8��A\"! ����$8�b*=S�x�z��O������������i�j2�:6��z|k��9������z4S�g���q0�V�\"�y�s�pA��SQ\\8�i\"$\"� ����\\�UL	*�:F�Q�0���}�@�{�i�b�##�_�����������a:|��g$�L���PK<�_�=s44[p4�h����������N��0���H���=)]�ҿ�tf�8\"�!,W����{c����nA�Cf̊P\"%I`9����c	a�������o�����\'au�Y���$�JBdT������I��\\1層~H=Z�3�!Գ�����a<��|���hUf��[�ZW�iBH���ꥮш����g�a8�8N}�9�.���&!�>,}������/�?��7�\"䘑��ND�.�HA��reX~7��۝� ��꽢� ��+�`mK\\�T���r�FMS\\�[�~�X\\\\l��K)�v���vFPB&�\'S��e�Qf��o����G�=~������&TAP�9��AJc�����G~@=z\"6k\'���qZ���ϊ�
R�\"q��̑!I�Z��X~�<���o�X�d������|�XwS�oo��0EI��$���D����������A�CG����SY5�
cȇ�F���ي2&��E�{�i��L͔�km��UU�|<xd���\0��۝2�j.Y�@�D��r�\\��	����v{����CWp&� T>\0�֨�d	@)���~����ً�o�\"HP\"H�@G���@)t�F�o�R�|V��;5YE\'
�W�h���&ߚ�Հ� ��~ܦ�W<Yd��X�X�b�Z8AT{��k�Qv���J\"8Ei&8C_Yֳ�#b��$����0��ru؏��٪���a���eY$�	Ҡ8^��/owCL&�L`�4ń���|�[���BM��S�^-Ɗ]�l	@K#2�����\'PMȶ�Z��?Oc���9_\'S�S�9�AJ�Im��D�!F1��	���v~���-BdR�$i�$��w�*ɨ�13���<���jL�
]�m63�?{�͵H\'�yL$2�˟*$��
ދ�v�D�r�s�0I*u��~�$J��Q���G�x�8#�	;A����4�\\O�����z*�R��0�W���.�H$8^��J����*�����Q�|�/(�:�o�ls��,V\0k*���Eͺ۲u�2h-�w�<\'I���LD޹.Ǯ��X�&1s&D�|
*E2AM��J,-�%A,�^.����o����$�R��,���8�����\\��-��%Cj��VL�֨�:D��&;~�����P�h���Z4S{��Y�hn�x�Q@罃)�
���#0�O�����F
��x�~���o����<�֑.�.x�̪JJ*��^prv�p�s�Vю�,��������$,��.ej�::<^�\'�D<?�\\޻<_��ȋ��onn���R4(����D�u%� ���*��\0�nqy������;�b�n�����;@ �ٚ�@�Ȁ\'ms ��^�����=����jN@�!)+���b/h��Z,��N8�4f=( XX�]�S��%,�K��$AJ
*�R�&��FLz:�o+0X۸2��s��{OZ*�n:��v��ĮN�\"�9�X,�s��D�8nooEd�)����7\"YJ�)\":�4FQ\0K��q��qz��;������)�s����u�ǌ )��\0�<�G��Y=�WՈ���s�v�\\n�Z����t4}\"c�!�q�DS�\'#�cg�`�\\�B߇�\'����sf`�&3 �8B��0�\"	I���]ؕ��ç�3���#�J�HR|���/�Ͽ��/�W/I\0�a�*�;`�8�D�9�X���
T�0x^�]p,�T&F���L�q���:�3iKZP�w��i{4��I<a;�};a(J+D�)�r+�
���Nv�ؗ6�r�Z�}Jɒ���!kGORRBd�<��&$@v��z����o����>����\0�(I��y�|����
�X�!��Z�\")�&�[	��������-���9�ё�Tc�h�\\B�]�$S��vۛ���f����V}�g�~sv�qpD�8zffdG�å��۪b)��d�ctj���]Ϣ��c���x�O�Wu^3W�|�!pTȉ�;MS
�-��BK��Ml	����zry��1�}�[z����;/�kEH�D$o,�aL	yu��;���o���ɱSVL��2F�Vz�|:�:�o�Fk���i_cI��g�%aK�����z���j�����u�y5 JPUR2����AV9�!%EH1�8�h\'>t.xv������q߅ET�����0��3KV��L�6�Ț��
F��H6ߒ��y:P±�0��F v�y��옼_���b	DIDT��@��s~��t]7�)low��
Z��\'Ui[�gBe�H��H~u��|����=�
�{�9��9O$֋6����;$���E��\0��y�T��s^�$?�҉)��j}����������\"��4
LI�1���q�l:l�ZRR\0�������U�����IQ�*üF�cv�����YM�(
\0fT�8�#�<��s��x�
B5c��TI0�)�4�9ɜ[e&DJE\0�i������N#TBp}Xn�o���t�;l�zO�������M
�(�)�21�摜�T��:��g��=��	b��JG��@���)�9��K�	�s�{��ݔ�H���\"����2�
INSERT INTO student VALUES("KICTC-CER-008-2020","Justice","Hussein","Ndosi","ITT","TC-MFT","2018","5","kweka8@gmail.com","�PNG

\0\0\0
N?�_��B�*�C��g�WT2EN?y	�W���������&\"X�2w&8��\\b���-�Qz�N���������,�.&$\"�+�j�-��؉��B=�!���(cNTK�=��|����X��e0�@P@���&���?-wrh�Tr)��Vze�Ts-��V~���[i����h���{鵷�]}�8�XFm�1Ɯ�tr�ɧ\'o�sŕV^e��V_cM#},[�jͺ�asǝ68��n���	�T:��SO;��3/�v�ͷ�z��w����>a����{�¯��)���D�����ApR3\"s �M ��b�{�9:�N1�#R%2ʢ�절�|B,7�����-n.��W���9��?9������k��!j[lc>�!���\'��j%�|f������]��Q�{�w����ĩ���;Nлzݷ�RO�~�+�ԣ(�u�{6?�V���,��N��t�O�cT*�\\Đ%䥗�>�o���)���{��}����193fݟ羟|׸�n���g�sg��U�vn��kh��\0��*�4����䶘����mG��wP:3�n�Џ�)scZKy��i��3N�_�}������Z���1����<s����=2ק%�����3y_W7�fj��3�7��P�kq
�hX̿��~��Jiks���c� C:�!��Ϛk��]ܛ��i){;ˀ����n��)��R����zb]!��cR(s���8�^��
�y[i�C������Lk�l_m��z�����g�Z�<f�0���Oښ�8��i9zph�L��X75rw��^�/����w����Y�����.	> -�8��%#X��&��e*Yq��(��`U1��788�9H\"d����2
��x�/j/l���!2�mE�[�ߨ^	x��k�J� =�z�c���Ҟ.��ƢL>�^O��Y�Ayq��\0w$k.�9r��Pq?����Rٻ���jq)�^���6����Z��G���靊(~@11l4na  �U�z.��}���d�����X�ȶh9�`��!w�?���b����$mM�D��
W���p���S8�7r�Μ=�.Pl�]N�ש�+d�l�n��ӶU]��r��z�\"����>��)���䥄> ���Ë�ⵥ}�ͼk�r���f
��x7u���E:�8/7���0�QI�o�f:� e�5q�|T��6=�S.
@`�*Glŀ_��ښ15.0G����F-����mQ��0OҌY�ƅ��V&�Ip��gyh�XBm��r_�\'���U	���&��\'���ps%�賁�/���2X�1�U��S�[��r�`��߱Cp�pG��[[�;��VKk\\x`S���V\'�Px7����m��Pv��R�G�t-#V�
�����4�����Ɠ�s���*�4��8w��g�]����ۈ7?A�в���B1���ұL�L�\\��D��j\0����ߴ�t��{x�\'��g�u\0$�2�F�r�4(�H���Tlڌ1��\"˂��aFp1h>�;��O��O�j���W�1䝰�y4L͠$��S������w�����v`�$��9&�b(�/�/d2�3��>�b|�/0Pq���z���:���?����ʚT�e�!h�$pO�>�#�>~���ؓC�\"����\0�M�ޢ*����/�a������:�+��c=KƲ��&`�2�G���AP
����d��](���E���м�5�����e�	��Q������)�H���[����n�,�~`@�nI�T2`��u:P�jd1:I�3Ջ�=�ڇ������DL�,�!R��CiA���C���vY���M*KPe1sn\"G໏���������˾f������W�nDD���OG�h��� >�F�ᕅ_�� ��ALq�/��k\\ ��)	bծ\0��Ǻ�X7BhB��1#�q>. Y����A��t�1��eArr-�8�*��DI �)���\"�Օ.�����۵A,�e!�@�%���)
��`���2u���k>��]�4d�h���ʹE��b�NP�WW!ah�
�fU�Z\'�e���X���+��Xc8�(�U�
���~�
�����JRSB�Ԟ=��X����[�ʜ3J)��\0����`�_�0�x�y.���}MގjW����>��+��p��=��6�f>
\0�]�#����Ưty�a��H�	�p90�Q�����	?�?���������=Z�j�b_�w����;!,=_Y)�5�\0��=�wS���a�bcnI�wx���+���?�(�@�H�T)EX9�0Ȯ�ڪ[������
Ňˈ��ŉtL�1hK���6�!�`Cz}����)E�Y\"��M�ZEi�m�Lg*\"������Lx�X�G�U���K�VP?�}ĸ\"�\'7m)-2��u���-^#�wx�(�a�`.��[8�d>��Nv���f�/�{���\"ަ\0�xZR�d��Φ�pk���P8˄��9(0`��Y/��� Uc8j���8\'�lJH[�g�oFC�aLٍ��W�_$��%���!��V|/s1u�($��~�P��t�:�|�J{>����$ƃ�B�\"�K-��vgi �����f��g�u	g�r�[��I�;J�$�r(�/ w]�ۨs�����S�� �7@s����3�DȦ,Q��ЍG�Z�S�j,|�B��������9A)j��玿R#����� L�I� 	;�\"Cۛ��cj���&�1�U�-�x�\0����5���k�4���6���V� 6��>���*i�.��R`���3
qB�#��t��3!|:�o�R������\0������@60kQy�*�_�\0�<�+��4KP�L�Hn6#��LS�$	�-=�\"V�\0u��G�9<������:����mt.(�q \\v��h_rP=�/�c�	5%��W�hKDe���(�3���P��A�S\"ps�t�w�������`�ld���|KCR��A��3��.�R\'�QW	�`��(����=�A���%�j�f�\0�:��-(�
�*��Q�2kf�NC�­��z
�04^
F��mz��G�B��ƄG��jg,#ƭ��_�gN�+BX���^�R�(B1G�	�u�\'�!
�M��tɓ�L��2&{A7@m�����,����%�
�
�����a�Odi��X���n�^�+�^���\"�U��44��0��.�E�|6�AQ�^��>��BG3�~lRC:+�-�W�[��k�4��&6�NR�u\"+����
�~o��CV����$����i*6ת
�V�r$¨�Տ2����r�d���
�� DN
v�␡:Yq�*�B�Zu0����G�����b���YWWA�\0qrtRt���Z�xp܏w�w�\0�Qe��5h�mfRI1�_C�#�B藙e�JR�����%x���?G�Z��g�a����S���y�8�ʲJ|N<j����x�ƹ��3�f63G%K�t0+��$q\\�t�r���8k�kݓ�0RЗ��Ns),`D(���*l$h�I������?��%r)䪀�c� �~�?�ݭU���\"I���q>���.Ь;����4O��3p���
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:3f73f71d-85ae-436d-a72e-e7efd81782b4\"
   xmpMM:InstanceID=\"xmp.iid:a0b537bc-b216-4a07-aaca-00748baddb4b\"
   xmpMM:OriginalDocumentID=\"xmp.did:79369281-84d3-4c37-9e04-583a1ae74f49\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1603715518991302\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:889c0f1e-e7ed-4796-9b5d-bd6c6de9edf6\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?>x�%h\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�
:6Yr&\0\0 \0IDATx��Y�%ב&��9w˥6H� 	�@/�V[mm3/���66?Uz�ͼ��d걖z��KD�h��U��\\s|�ù�(ԆB$QU׭�Ldƍ��?�~>�o����������z}|||rrxfD\0�HĵV��)�|ѭ��٬D\0\0 `\0� � @o�u����o\0�v�?���5\"��v�§<�)���yN푷(���\0���ܭ3�G����g����lg�ܤ��G�(xv�����;{Q��.et?��֯	���p�Zĝ3}�\0������G��\0볬�����쏉T|4|�[~�������v�-��o+gB�/G����s�;�f~��9����y��U9���ξ
�qf���\0�{D  \"D��GЗ��|B�}������ۧ|~ɳUF_�����W�|:��\\�k^3?|1O�*z�=|�ϿFģ��n�)�\0�xtg;{rR�X?;��aĝ=C��������;���L�[�dW����v~tg/���]�C#�mq�����m<��`T��w����Qt�\0H��Hg�CD@��2��l����}�����r��Z�u����/�������[X�1����_y�>��}m���v��G����l��l�2wy��;����Lw�ԝ���F�*��\0�s;?�{^��k�=�@bfA������<h���������������}��u�?��s=�������[���v���v���v���v���;�����Z5x���o`<���*�c0z^�$��t��{��j�V�쉐nbO��~�s���������q��4k���L�徺�}�/]���ش]���q_�~���G���W��\'����������o����{��:��\0�#<���I�ro?-���P\0`�������;��F_6�\'>|��3?��E��� `Ϛg�q�+����G����\\Mw(���#ճp�����;�~s,>���=����E�~��6@�WJ��t�ѝ}mQc��픋��̫�����&�#P�0�M��x��Y�\\c��oMX0�iޗd>��-��[��	F�����x^�y�3=T���\'_������ZJ��T��6_,V�e4t\"l��~9Cj��Vvv0��{��+�O( !A���y��|Vpy�I�}B!�ӷ���B(�\0@�\"̌�X$�k-�sfI�^����dXon޸u�[�4
D�\"�BD�Y���W�^�zuux�B���������\"���n�GD2ѷ�~����S��i�O�#�sA+�=�Y\"�g�<�?n��B	��3d&�0s���S�s��a�s���۷oߺ}���{��m6���zs��@jB�DDH\0������bo�ʫW^��/_�W+J	�\"D�]���ж��fy֋���n���}`u\0sw3&N�^����[���]_��ܽs���h�ľÑ����9��:[��U��Z�q�l�n�\"�k��__���7~�ƛ?�r�J�%G$t�wD�����aH�_w}������Ɠӏ>��_����
$a�g|@D�p������<���q�O>�����|���ſ��?}{u��IL+\"�����$�r}j;�~�%ڬ7������p�7�)��u����u\"]�rJ�̸�����D���Uk��Rʒ�RL\0�Z�)�0en9�0l�{�ן}���>�˿��?��k^j���a2��/����T\0\0�z�������>]�3H�f}J\0��˜�91%Di���9HXDD��Y�J5�R��0S
!��){U�a�	a�3 �+�#a�2,W�ݼ�_���=n�����ʫ�V�)u���Z���{sW���\0�ܦz��K������I� f���D��g������׮a���2ԢV�Jn΀A��V@���g+��r�IX\0���Ե�D�UM�Pqp�;�z�\0w7Ww����>� �a:9����wj����p�H�Dq2\0)%bv�]<�B�A݉������������3��򒃅�i
$U���|�``�Z5�����ϬT-�V I]���8��ݪ��#��{�K
��ͫ���3\"L��*33����?�����I��t]����W��@��HH�9�\0�93Sc}��R��f�l�fm������cY����� 4\"scG�֊D@����1P�p�l>|�w?���{{+z<7�E�gz)�v4UFL�x���w�y�֍�6Me�T�T�TWw$\'³�Q<��YD���\"b�F�=����G��Yhu�h�!--Cr&
a����\0T�\"@x�Y�&f$d$\0���JH�����/u���W^�
����Lϣ2K���b~������?��Ct��R��j����t�0ڿ�ƃy�Y��tS���\"��n�������&�z���\"�G�\0�@Rs&tSe�\0$B@\0n=:�j�Čx:����o���.^ȳ��o5�%�����Fp�QJ\'w���ڵ�{��#�Z��9#	1�-I��-P�\"��	\"���F�^C�բ�X-��]í-��Ek��E�Z�#9��{���4���mD��̒�\'������۷n7J��z���Q$r�6t���]��_���K���6\\l,&D0���@�m;�Y�t9Iߥ$�A`^]ö�N$H��jVU��R�8��0��0NUս�[ �D�v�=\" ����\0�@̤���\\�?���O>��������_>�QwD�i������{w�$�U����I�v�
Q[差�a\'��F�ɽa�)1�{���մ�k����Z�Z�X�q�a�^�כa*���H�9lbA�\0j<Aw�3mDwUe�Ұ�|������J��0jZ�i6��}����n�cթ���������C8l�������4<�qǡLC6V
!0!�7��v��mf��^Uk-e�ʸ���V
L@d\0�\0�����t�z�1Z�	#�C���H�	`��<���ҍ�7>����q�w��\\)�m�n�p���wD����
�\0g��݈��G�p��0w�����M6-wy[�=��u�p��?�ݺu�̄���UE�ܚv�;��& �����%M�*SԚ�BSh�ҥD���=,�N��ݪj)V\'�յn��n�fa[�F\0:�x��v.��6*�HM�Vt	�a�l�a�u[�3\03��>�s��㝻wO��D��:�[��jnm�m�@\0���A�����D��=+Z�i�5s��5�Ka@�Z�*B\0F+�%�=�\\r�%�m�C����;��p�9	�M�`��q�ެ�[�g�`��a�9���R
 ֪�N�`�fjn��|���J��|��Z9��A���V˰>u�NWy1GI��X8e�`D�0s L(d��j�F�5���[�y��m]�!����ճ��[5u�i����;�|U�����;�>7�t��;��8\0@mۚn��$H�(��H�\0ִ�LK��DyN����̠���u���ɴ��P�p����xcS��\0@�@@��A��5�T	\"���Z�25A�k\0�?���Rs��K�G�%����T���ČD�f�V��i\'DN`�f�6N�L�
S�%p#���~b�¶��R��N�q=��]�n \\kY�B��-�s���\0�m�}��(ǗfX}�웧����m��x��	W�j�nj�D��@n�f`���@D��HM�!±ї�I@`n���n�굆�P�!L�Y�R���Z�\"#V77ab��~+����6پ/DDG��H��	������Fwk������,��t����G�v��i���LD��J3mY`�j怍�D[�1���m�NE�1DXk-�HD��T�Y
 b���E���Y ܭb�,gY.�zV�7(cJH\0���,�j������,��L�-JqUg`xQD _�x�|�`!������j���Ę�{I}J�����Eڲ�(���ݧ���Xj�j\0$R	��3#`k�W�֒��hB*��.)/e>��Z�R�[���gH\0���C���٠�+@-�LS-��pˆ�Ҥ�F���4\"���\"BJ��\'Us5\0dF���9q�r/�1�0Q�i5=˨<ܣ��;\0�{�oSoSզ
fQk��ND�Q]�4Là�&��X�y��l�R,����ۓ�M}0��>iǌ��UU�̾�Z�v\'�y\'<ˋ�A�p��h��RbN�0j\0D�$K�����pf��	@��B붼�bV��n�8�X��Z�L�L��i��%!����]�er�ek� <�$U�Ng��<�ZԚ��l�~ a@ b!sk�QC\'Q��� ���k����&��\"g��f�Կ�)SP��Skwo�N��4M㠥x���!�\"�=����<��&dU�@vD@d����%\'j�2a0�{�R��5�$E`D1��^7�s���:�\'�\0@&!.nj�_�׈	ܷ��_��g/�[o�tƯG�muH �Z�2	!��YT
��Qͫ��6��\0BNL��	f}����,�{�9��4�fV�j5$dIg�΍\0��D �L��aZ]��)\'�6GJ�B�N�9���Xe�,Dne*���k�.�r1˹�f���4�j�޶%��zU��r6F��Қ�clGhD5��բZhD��2��u]�����j��_u}�Z�f�jj�V�}�\'��
0���90�V��uy�ܑq��宥<E\"���w̴V��Qk�6S�F!�/�]�圉�!R����x�T�x��U�cr��a#�3�^�Ͳ�3���8 ��r��.w]�X̗���j�X���S)q�9ZKi�+��lšp+���z\0���!��b������!�Հ��v�LϓU�Zj�Z5��R��u=��&�Udu�a��\0�̜ ��M[����Ķc�[l;7 �)���|F,�h�cU$�Vt��R&UW��4j��N�r�:�(�Z,�%6Z#0\"F������^�ڤ$\0�x��t���\'E���0U�$��2��a�j�$��c���L~F�\"o�LƖ�0o�� ��!Q��&d�`��\'�\"r�Y�e��Z� ?�{-:N�V��@��ӌ�� @F�\0A�����M��Kʩ�X8
=p�Zkڣj����\\��	����t�7M�\0j�mfg����+
�I]]X��!ݹsrr�PM��Uu��H��ټK�&a��|��M��0c�RbATdu��M�����������*!xX&涰3!&I@�\"��MV�����L���3�(75U�u�����O���MU����{?|m~��j��������wO��������m�sj3>N����ڒ:�S�T�nI��1�P�3�w����oݹyT5�S1��` ����S�`=\'�S�p�����Ѵz�DD�󮣾K93S�u]JVy�u���䛖$����a�ռz�9�4��00QN���<gA��01iJ�˳�P\0����N�GbЪn���|*��Ν۟|
D�U*O\0\0 \0IDAT}��?���w^������w?[���Z7>^�����o4��Eꯗ�y����������{������8T�0Ǫ���x||2nơ���������b%�}��4��b{��Y?�O����K���@,f���$qJ����r�s���`���i�Ԋzu����tp�����4N7n\\?>�\'�D���<3�a8��N]��,3\"�$�H�H�fQՓn7�a��������o��ů����������@;��w5�tww�l\0@D>������;��n�5���j��������0�������5d6�a�1|sz�e��cQ��]ge��Ϝ��,}����I�F�H}?S_��t(q|��n�w��\\�f����Y��4�g�r��)%�2���PN�ܢ_a\"@wW�Z�VwD	Л�nW�?����������A
����	Ϻ�\"\"9������i�%��@9����똻~��%����|�|X�b��rJ��0�a1���{�~�u�F�B�rZ�������b��P��ѽ[F���@��F�6w�;����`���Û�0�+�\\�|����2�����&af &A��,rv������=�)���g��c�i��i��Q��Up���Yǳy$H
X�K�(����N��N�O�V˰٬כ�nܸq�� Y�\\�r���W�\\�����P���r���<ς^�\'G\'��޼~}�q�V3G���C�ىZ@$����W���ӓ�l1���僃�`��Ļ���W�\"$aJH��ji��@��Hq\06��[w6\'w/����+���Z���۴�>`D*�ϙs��
H;�>g�=@�$��H$I��jx��A�xrz|r|����|��[o���k��2\'.�R�n
��e�OJ7�����G��t�������8]�����j���W���\'\'\'}�i5?�{|��W_������9�M�z�ð�R�͆�mk�����DAۡH���]F��b�X-g������O8��_f�ݴR�0������g^T��c)��������x�ل�l�J�y1�{�!��㻧���|�!`D�e=�;����ݺu{����+W�Ʊ��oݾ{|Z-Ƣ�g�|u<��a��N�x9���޽s��A���6E�Vժ�V͚B�m�C�\"�RJ��s�|�򅋧�����bFB��Z���&���ʃ�AM��|�l�-�٧b������Tx\"��1�T���0\'@BV�R�c*�X�IK��q3l6��4L��fs%����I��Z6\'����b1��.��� �����w�On�;:݌լ�����cѣ�ө(pR��0֠~q���Ӂ����V7�G]ff`f2�����F�(�#�;�304yR\0컮��ɉw}�Z��5�?K�����W=>��/��?�DDè��������[���0zt���	O[�Y�`\0w��)���0ZU7���RU�(8���]o�����z棓i���YOmv`\"	��Rn�קøƩT�(��T\0�S������g��i7SI��MU��	�!gF���aa���-�V#@ �Zu���f~||RJY��/!P�z<��xf�>��O������1���S)�8���^ǩ���)«����{q�\0��,F�6�ݓ���hZ�f��l�7���>��\0V+0�ܙ����8��כ�PJm3>Ir��l���؛/��c�:Nu]
G\0b1F&LR�T��!2XD1�\0f DRqS�i�s7����b�$wD��?��[~aQP�:���y�2N�8�\0�a�:/L#�� 0%�[�A���`��q�xpp���t\"`[I��8�)�n���XJ	`��ͦi�\0b�Zk�s��(�z�\"(D��L\0a۩�D$B�$\0\0m��Y��A�D�yݼ�A�4�<���s����|��*�j�Z���6��hS<��\\M�<����#������7C����X��0 �C���xgO=0%��yd�%���,�8e*�0a�(j�.��آ[��6F��$���@���F��bu�¥a���SI�H\"��^^?��P����$�$Sk�s�p5wkmu|bp�aS�DD�,W{)w�8�Z��j\0ND>j�@�R�1��y�,�\'\"f�$�F`�!E�z8�K`
B�@wo,b�`	�Đ����u�\09IΩ_���պ��s�P{z\0
\0j���ռ�{�&7z6���g&ps��vo�L�V����qS!���0<1������ު��M+z�Tљ�:MZ�M�:��&���A��&n��@\0	m;o;a��t��g�k�^{�Y�G�(��=�B%�#Q|�1���#Լ�W5�
mz�6g
 �\0B&)aV�CAR���j���\0P	�] f}��N�0�	�P\"Z�����N�@NurCb(�n\0$њ�l��۠=Gv�ꑐ��fE\"�fa~rt��\'�����_�z5_�h^���9����4=P\"=ϋ�ɥg��˙�2��YQ�k��}��K��
M��c)Sպ�>V\0�u;��J%�j���qӸ7��QT�qZo�E+	����\'9�;<<<`�0c�05�y�YN���jq3\0�0`\0��n���8�<ܷi�%@$\0��ʫ�{\"�P����7����7���#j�_Bm&/�ϴ�_?�������n���ٮS��>@!��}ܾ�h�Ck:<�3i�o���u���v���Z\'��m�2\0r�{!�����Ĝ%u�l����:�z3�I����)w}����ͻ��b9_���\"ȵD���fsS��rfWq�A��X�	�E��[mr�-\'�X�T�����������o��~Z�\0b�a��~����*
O�������3���g�}��\\3���1@Bfi��v�\"�y��r�u��%e�]fI���|�����6��!R�-���,c�Z�q*�Hq>��$3��@�_�F���D�!�	�b�q������!mN��C�M��Lݑ0Ϻ��������0���$�
�n+/H���XӒ5�6E\0�BD�DA�r��IU3-Z��$�R\'BaI
�&M�P�bf�U�#�#��m�\\��֦@�fѨ!�A,�|!]��Rj��ZY2��&��[\"k\0!�7�A�_�D��$A\\�|�ʥK��ĜR@L㈄��n�9�jz�0:����YO�#\0���ܝ��M������[�IĘ����1\\�T-��g�͚�Ȯ3���{�=�\\�@a)Tj�XU�D�Ħ�۬�G��O��y�463cm6#i�n�%qĭH��ZX�VH��Ȍ���=������L$j)�8�%��\0���~���b�E[$C$4p�| &r`2o۽�8�1 zǅ#T%0��[c�A�s��@#P4C4\0b���Z�X�l&fֶ���&����=���
|\\Ԛ�v��\0��������\'���4M�/6�^����^�{�@�e��N`�0Ox��
{\0�Q@Sr��2d� �a��sgϜ�9��ݮƇ�^zqk{�`2��֟N�j��f=G�|�@ْ�<��l��CY�PHJ��X���D%��fnJ��Yj�D��1e�EBSChc��mlnt|�G����D�b����W�,�x����W��}��ݣ���\'��������a�3}�tu �4�h���h���c�Ǿ�a)@akks}c����.xU�Q��;O� �$����*1�^��^���@�LYID���zE����Z�*�����ƹ�����=�Udk}���&DB�{�m���v\'G���@DĒ!�N���%�������9�-��EL\"1=�k�K�ÏNO���~ͦ�c~����N)nn�o���U7	y2�u�\"y;e�n�S����*�aUz�������TO�)IKd�o}��+�jg�L(ʦ���OF�n���*N��p:�c4\"Վ�YL�L�h>�Lr�
\0����Y�GI���̙3UU�����n�#�G���ھx���}ԶyB�g�$BD&bG�Dd	��m�6
*�t������L,_������̀\\!0i�X�ml[QUl��y�H
�ЉBL�����+]�	C�k�|$��+e(!��bY;gv���2(6�|���6
\0@�&������+.|x��1��mW��\0T3B���M�*5-��Y�=�a݄���*@��:&j\\�m�ضI�n��R#0���(j+�M>ED@$��p�ray4�3V�U*�B�V$�o<q�܎�>�VU�����Um�錈�BE�ɧ�|�ʕ;��6u�s��Ʌ���������j�(��T�H)F@p�!BL1FE��E�i���x��9O�)B�Ԋ�l��\\ZvRp���:S5�\"2�j��>���m�\'fxBVW��?ߏ�k�/8DZ4�2�t���\'<���Xm������餮�>�lNt�Nmy��t?�������=�4K�9<sv�ŗ_������ ��y��
�H�TQŌ,�$V6U��mRLIR�m��sY5 �U�T��{��g��;`6F@E0�(
��G1�d�hy���\02�sF����� ��9����*�3\0(`7-]�2\0�/
�Yh	L��TU
Eo2��(��ZU�������¬M��\\��)\"�! #�H�_sв�\0\0 \0IDAT�if����%�da&�o�>N\"�\"�Y�6t�XN��u��q�D��N=c\\[ۺt�a�F?�鏘ݟ��w�^�L.�(
&��]��p JjҴP��٩*;������\'v.�
��k���4�ջ3g��5��А\0H
�>Ħ�FD�+/���?�η�{m��1��׷6�$v��MJ�J��`��o�n��~��Z�_\":��̄�IUs�MT2��b�\0J�� q�Z��q����(w=��uRf�_�Fm�3��*����#d\"��ף�⥰�w\\�X��s\\�����L��+Q�$4`C#���`�YkP�T�{&�UD؁��6�(f����������[�gK�CM!�~j	���g��o\\�}�F�6E6�6%# � �)�d��!���ѩ��y\0fČv�S�������D������U�JeO�x��+������Oz`��Zo�1��i!5�Nc݂�~������N2z���7��L��SCe�0�hI�.Q7YP��I��\\�7��KhK�34D09rɧ�C�U��J��������#wAQ��m�wxb�ֲ\0\"�\0����3s����]$Hbf���
f$�[$�\\�\045yppPO�/
@UFH�MJ�h��LhY���2Y�e�Yk���(OD@�!P�&2#dB�d�/JW@2Rp�{���𽿼|�\"
�fI�ZR1��T��(z�F����W�/
������@�B�\"ֶ��z����,�5o������\0-]/�/�D���W���R��x�o@X4\0���2�z�v�걏b4�#��lK��9A��D�{O�$JR�V���N&m�ԩi�}�w����O>�c`C0��T/ȅ��Zop���F�g������Y
�%\0Kk��������\\�1��	� +è���:&�Q%�Ĩ��|>��\'�ɧ�^���O�]�~�����Ƶ;��\08��^���3{����mT\0�PU���$�d��ȫ������������w)x���P����Q�j�ʈ|,_\\i�b�2�ɹ����#�E(�:J#����?�޷_�SQp���R+UY_Գ��!1�E��m���9O���ml����]�^���}��wvΤ�D;���^Ua\0Ռ����(u.m��t���6M�_я�s��\"��<��7�q6�c;8���Ֆ\'/T=\0�k��,
�<?��&��d:�L\'?����O~s���[�v><���M�F*76�(�����+ϰ�&�l�M2��l^7�<\0�u���(
Ui��P]���M���j�_�����w�� 0cQF�$	\04O7�I)��N3@Xp�f:���j��R T�hI��z�ɧ�x��o������t4\'c��1��:ນ�ƣ�$������9�T�g7��z}m�$�i�+��ֆk��`�<��C�̞@���w[�z<ʝ�F����܏��Vm?��f�|;�h����Г��h[\01;I��s%\0L��û��޻{���7�?x�?�G��d<��:	���	��m^�x�9�(��T�>Q���ܻ;�L�C���w�@��,�0m�+��x������D,zU���\'1E���m9{_��M�ZQ�|���dI��l������֫/�z��3��ؠ�ӆ�#υ�0���Q�D��l6{x�p4+���c�a5\0&ߴ��\'7�t6��\'#&���mmonl��;w�ܹ�����_�;�$I[���Ǯ�����냮��G�;�^f��\\Q\\|��l1�ny
ƩU�>($$%��������dT�E^�e�$����U�����?{�MT���w��+cA��D5�:ff��E9�M�2I��a��\"���@���3�^y��7�|����a��DC U�\\�XUT&��qp1ֈ�LM[ϥ���FHHLQ0j�D��L\0IL-9Ft����۶��� T��<��&��7?+�������+[ۛ;;;�� x��#\"�jJ)�(\08`癈t��CD̜)}V!�\'��N��/5h�\"4ܢ��G�9v�Ƙ��Ԁ�̈85LI��z4�Lg�۷��޾�{��Ã ��z��ڨX����df�}ٶmJ�W��AQ�y.����H����@���Ѥ���2�u��/��*��nJ1�U�7^~�(Bq��uw�����p6�aUǠru1���(�$13�C�T��gv���+o����O^zҳ��]+��۲�9�L���5\0!��!!�t<���.8���1DP�Q�3DBD��\0�CQ�Ԧ�&\0�	��������,˰��q���.^��ޮze�WKd�y��0S�QFʛY�Q;��K�L���d{@4�����3�eJ[i[�>Eij�Y=�L���x<�w��g�>�s��|�����5�i�1�9H�hL��Pu�2��`0\\__7�[�Y�(r����F���~�����@������)E��\\y����pp}����ד)�
e۴�Xz��$R�d6f��i���,���篼�\'���ʕΝ9�/�#�����yU�K1�h��5I���f���n�kk	�8�vH�[���L�L��Z�C�(@�\0�X�������o>�����֓�.�;wvs}�����&lc�(I� ��&)�Uի�����F�QLV�2U3f�
)%
���7�isp0��{��O�����fs@25���-�MS�\";�̘�)�X&OȌȪ�؅���s.��q�[�@gP&d&�=�&�{����,9
�V7Mիʲ�L\'��7��c�:��U�ɪ(�JT~��h�1�yN�u�2gd�c�\"x�A����O~�/��ʳ/�C���;G*RUUnfZ�W��Y
���D�6ֳz6k�{���AF
�h�X^�n�L�ؑcbFBUQC͘ADr��������$��w����z�<s��sgϞ�	!�m���\"�ʠ�jg����;�ɇ�@EUR�0#�)2�PU�Lf{��ݻ��������㺩 ��ص16)9�\0�F�9X!���XQ�$jlc۶����\"�b0�B�R�1��͟\0
��	ɹb2��hUUm�����MGQڵ�P�^}���Ͽ���O?�����ء�y�2\\��Է^z���^����UYdL�Pղ(�zV�\"\"Lg�P����*���I����GM�Cb��Ԡ���+HI#qG�R���r�%�I#SV/s�`b0�ש����\0�\\F�d�<��o����3[�\\y晧���9B��m7(�S{�\0�#UD�nյS��&h���写��1-�*��B\0���3Z�3��*�����x|������w���&M�\":�<@ �UE���	M2��4�XV%.Xc�DB��˙��y�3sWUQ^6j�����M��z:o�{�=\02A5#�~Q!X[Ͼ�ױM�\"�E�g�Z5������ͪ���\0W\0�ZBM�vξ����~���ic��Ř�@M�1Ŧ-]��@�*X�[G�$�06�ShGR[A��Љ&�lO��@���Gk�J�I��eJr��|���)���b�JU@�������HDH��RR\0eGT������G7o>�|�҅��Á\\U��54��
�$2åL/m�.G���S�ܤeFPl5Ij�\"X�L	����\"x�m���D�
�D\\����9O��KED�ڤM�����ׯ_�s��|^3�\"�.T��2����3�Ԉb��L��=r:�DԲ#9�b�IElѥs�C>\0B�6�;cF��,Sx#�g�=�6k����\\T�� �)0�!�Z�B�̫�WTE�6�C���AŌM����
˂o�2n)��͛HDh(FQt<����=ܿu��t2�Ng󹊐sUQ�P�)��>�h�4)	\0��jo���=+��ǧsuSi%��ć�sm۞j��s=��/���)�&��n�Ɗ1s2%ǥ����ڐ%��sg��Y3��ٍ_�����F��7�թm[UѪW��D�ԓ�|v���_���sgν������/�r���%zm�>�VѱH,z�H�̧���ؠ#�p����l��)S�gͦv���#�=�@�d(��ru�~毪���+!�ec�RB4vL�\0TP�R��y;��{�7�����O^���>x�]�γ=d��d(
,T!5R�0�\'�	ѳ�M�T\\�H-��;��!b����#��;Ғ<N����1v-�Iｈ�d�:��Ʃ�b15M�HZb%%I��M�Px�)����M����k�����k�^�*|��=PIy�QMQͰ�.�E������0�֣��޾w��]1��l��kd\"@r��` *)�����R\0C�7=� l��:
���G�X�P�\'��Y���h��H�peop9ФU������~���
5)�9Nh��%h\0\0 \0IDAT*�ӛ��~�W?{���l�ą���؀��dĳ��2TU��\"�sޥ$�̞�fLNM[M>xr���w�������w��ΰ엽B�T*����jR+�Ao�p���sE@�
���I)\"��p���ƅ����UUY�`�Ө1���+�����?���W���|<G���?A�	��=�*�c�;N����w�i\0<��b����tZW.�8g7���.�@Dλ���(D��
�����`�/�0�g|�������;Z�SB|�\"!@2�(�ԳcTU 4H��	S��j\"bH@h�5u�_����*�����8���ۈL)�Y=V���w?|+hJ�$��f�����\'X�_���.mQU����ir�?a��K��Ba5@uAO��t1������=�Lz�\0�:_\0@�lf�L$DRP!�$�����k7�<u���w�l��2U�6<`o�p4@��7C\"&����������`���\\�d�Ү���}����
�]Q��i�^�ys������B3Aty.v���Ã�γGr&��-7��Q���`�=��-[���.���q=Vc.[$���|!3�J�:�6����L��`1�b`ǁB���zSe������O>������7�]/��ޠ��	�%L����˲��5M�>g������$0S�$�M�
f(֯ʭ�
章�s&[�Y�A]׳�TM�搩6��.�6\0A�1��#e*����-{N�q;�D?V}ay��g����F�r[��S,FdJ��,\'��!�wo���g?��;�*�s�T���U�f[$t�%��t�1�\"��s�,��d:��ә���LL�@5s,S郩Φ4��C���v?��p��{��{u��o\\Oyͦ����P��<�e�t�rt9����K��R�Qx����	]6+��Z7;X�]��Y�G�8Z��q���M�ڶ�ͦ���(������F�q۶L,1�ΧsbQXL5q��\\n��)�E<A�t_4]}��Щ�@F-ﹷ�J����-�C�<�\00��24D����bڌ?��7����\'}|���`�_�%:,ʂ�\"DM�tu�T�����ރ��x���R`v��4��D&dSQS#CG��9�Le0��������1A�\'��௯ݸv��EDhc|Ѵ1ߙ�:��b�?zZ֑�=��>m�.=�2�z���	U5��Iz��\0�NȖ�Hgy�������d������v�o��m�J-Ճ�Cu����`=��e�q�FYKsxG\0�i!0�#ޠ�\\V?
��[�R[4PtQ4���-�i�].��,�:��n���HM�p�̛��������so|��L�6nnmz��֓+<\\�y��[7�~�����1��ie�j�	4�I��%G|������^�\\۸�{���;?:Ř�{����-����3lV�
\"�#ǌ�))ZTHƊ��Vo}}m����{��׆ë��g���������ME�u���{w�kHh����ʕ;N;\0]��6���~θd�@]� \\i`�����#p�➩-�˕fs���T���MS�BO��DH�\0e����;�d��+o�5U�v�<KR�
M] r�6e�����,ˎƓ�>�����?|��&8�.��bZ�A�\0J��\'=�y�������|C\0�Smm�5�(��#d�.b�i���R���YF8/fG���|b���*��v�S��E���	;�h7��b�^��4
A�Ljp�E\'�P�4�Ai5·�l��r�0�tz���mYnlhB��|H�\\�+0���pr<>��Ï>����h2
{6�iTR�G����?\0g��ں��o� v���eF�(�B)�7

;����˲l�f�Z1�Yk�E.�v�l���m��<B������뚝�D�(7~i��ñl�%�3m�O�V�ś�[�P��&G������`TU�%�jʷ�Aej2�������?��G\'���0NFX��D	:7������Tk�(�)�D��\'��M�x�z�R��r7DTU_�Ȓ��J@������=Oo��7#sH��W)�繵v׏&�����������Y����gy�W���>��j�jO�<ŉBb;��@��s&�sUU���V�Sʼ(����گ�e���HP߱Q>��R���r�\\:����ֺ�����n��ӣ�Mu�,��۠�������{o8	�֮\0P)�rS\\^^~��\'�~���0�\\�r]d& �p��ԪX������� %j�m��m�w
A�v���А;\'g���X�R����zī90�u��g�\'�53���EQ�F#n�D��#�X�0f��֠�����p��l�fl�f��aQ�
����a�Z���5�Ѐ��ah�kRJ9��9@1(�������[DQ�D!E�M]o�o�w�<}�ɧ��_��GS�@�Z�P׍�Ne���DG����ū�2��65I��gqA��FӉ�,+s$kmY�UU�Uu�^���j��Mc�����{��O���,��v��-\"\"r{mt�^G�`l��TZv��$p�u��������N\'\'2=���Pt�OL1Әǎ_/���`�n��A�4�_٣F댙8^\"/�i��%��Ar�Q y�֛��֠$2�c��ʵ��kRH)���J�� ��BYV�uYWVJ	ZF��>���~~6=�e#\0�V���C)Ҩ�n,���_�~�vv�2횪iJm�$! H�Q�;1=�?�Ϧq!��6�����������n�^o�k�}V��x<�M�]>;;;����C���H��8�hj{ U{_����^eY6�ީ@H� 1eE�ϳ|����p�-L�����<��$�}��~1�@�jŉ�%N���-�\"�s)%�1�-����Q�H�Ȳ���!��c��3)�Y�����N����x2��֪�A%e��w�,�E1)��d2�,ϵ2Me�ʪf��*��r��\'�8?;ϳ��A	�u��XX��4
rsK*%<�6�d
��Lg��\0����p���Y�c\0�6N���&���\'y��Ƈ!�DPIK���,�kz�6�����7�t�A�D�=�s!A$nW\'�o�w�?ϲ|2=��|v7s�c�\'�\'��Ӥ��������KE��}�7�d��a�hT<9i�O�(;cL;ބ(�p�!�tx�q<=�P�NQ��9���3�[�v�[�(K�����u\'\0, �.�իk�|5Mc��L&U]��M���l`��T�Q�BJ|me4����[���Ԣ\0 �2UHD`�$����h��V5ֶq!TU���?6ΚA�ȷ;yjB��_�=�<�.�j8�C�<��w0�26,n5��l����k��DK��Fܯ���s�͗�7�\"����f�i͑(���[�[��}�aǏ�a��~�\'��g�
{�Uk�A��\'�&D���Gӳ�\0Z59�|!��ni����ۡ����zuvr���J
�@������i���������7��烇\01|	:��{��u�癔ґ�[�H-
%�!�m��$O2�JaP�DP0_=�z�\\jl!���;��J�6s��јS��ɋ���ѷ��!�w��`���E�z��;�ߡi۔��L?�?�����޷��kk�s^!��jat��@JX�׿��w��{�-���eYV��$H K��@� ��
\0�9_>߶��3_)�i�5�6�#2q5xc9U��f���cZ�B)�5Ӻ\"�\'��l{-[!C�v_�B�j[#kDj)Q�e]�ڒkl
!`>_��k\0P��z<`Y���\0�Z�߼y{}{W5V�Α��ɈBc���O*H)�V����v�e;:@�����pC[�<tG��Vڽ���ʔ2���!��-���������I���\'/
O%A\0��0Ԭ6��˯��_��_ �RK�gJJ�&��\"��r�DFg�&Ђ)�ɑ\')j_��_R9��\"����H>� �_�כ�f�Z�����c�&30Ǻ��/�um����#��M�pADc��ν����E$�v@L�\'�ԂЊyXFp6��������~��og���V�|K�t!�}�c]��Tz��|h��q>nw�3^�ic,�/7�h��
٩U��2ݡ�%���,��s�R�J:kY}�w}{��������d�
A�/V�&��뷯릖
7ˍV�S�)(�.<<���ݱA�-LI[Ѓ�c��\0(˲,K��F����%�
��\0�Z�z�j*�8k�E��w.7��?�h�eJ�²���S�\"\0j�\'��sn>���s�=L���k���3��hp�QU
�A�}��;��Oh������!$�#��v>��f��tjv�#���絃B����Y�u�������{��h
I��n�g����
�D��u��������Zk\"��fWWW������pȞ��&�@<{Q��	b777���(�X�p�����ק�<���Q)2�#�Imd�2���g����������z�M^�M���ޜ���A��N�=��A;e��\'l��
8��RH�?[Y��F��!R�K)i��D+?�Pz � ���W�����ǧ��\0�?����?�����P��f�öm� �(��[C��/*��gR+)y;��m}s{SV�p4j�`����Z|���p��t�^/v�����Ʉ��K\0`͎�yw�������%�r�\"�Ė����Z��q1���g�|P9-f4Wʲ����/�����z85��QZ[�\\UWZe&��6VH�J���o�I�]߷�ഀ�5�3�u�RN&��j5����D�v�մџ��\'�Ŏq��7�W�mP+a]@�޽z������U���T�T	8NA2n�.B@���,���z�pd=�������ȋ��e�
�{\"��({�7�|v)@�����6��t���|��Ώ=���gk�%����)�,����I?zj��S~��k�`0 !8߰�n6��i�s��z�ͷ���/���)�&˙�d�o���O\0���sv��,8�s�|�vl�� �G�5�j���D���Y�3������F�Q4�\'xX����b�A�v�m�h�M]Y��P��������r�!�6:�$���<3b�	�[(Hxng��rQ��A8�����n�\\E�.�Tp~�,�W�SU���|��<?�炄DY����U�4Rʣ�#��a\"!��=�����o˲|���ONO�,cML�8=�d�(��z���j��������mA���C9/��?�x�f<=���u�eO	kc|\0��M�Z
�=,~x����
�J!F�SO\":;;�Z��Wι�r�0����h�5Y�y�r�g�^�~}�p���~~qq�y��\\fu�Ύi��ǣ�1s��t��ٵ���ȟ����z��~�ş^��r6xl�U��R*)A������ G{f?āF��n����ṇr*�b2�Wu��/��|.2>t�!���68��q�$�âl�����_��Sě����m�������R���~X�]�eS	�q�^����<�{$p�=�J��EQ��秧��������j�X,�������o߼}���r<�g���n����t�=(
�<��\"���9����?�*�]�1Q��J\"pF�-�)8�x�B�u�}K��sQ4��N�YOO$������~xx�:�Q�h�}�Z�u����=Ӓ|xX������~x�����Ga�y�`�@Ji�(9�s�����;p��~��Eٔ�{�����yUױ
����į��Nqc�����9�W�M�$웛����ŋ��.����2q.�(���={}�@��w�����}\\Q�9���{����\'�*x/z�!��*R�{�7}Cp���Tx-�m�ö�wyRޟ$��Sa嬔=��B0GGGWWW��\0&�	�)��II;��4\0Tu5(��xvq	���/�oo�a��\0� 	�eFk-y����\0 �w\"P.�������^M��5�����W.x���	��$T���]y6v��
Mcn�g���^���_]^>���1�eڎyL,�g�\'ʹ�:ݣ�?S;I[3�-��b0TJ��@j�	(��&\0G/�B�&|_�:U\\�ɱ
�{�h�`tN��#4Ɯ��VUu��f�!�������ןB���4J_�޾���l�?��KP2pI�(%\0)e�Yf\0 xO䉠-�C�P�L������_����S�XΟ�z��T=y^e��[�\0��2�E)쨪�sƉc���k��|~s}=��]^�F#\"����r����W��]4%���O���b����VGErw?BSR��=	���M�v+iO�]Z,/گ�s���,Rݔ��5�,���	��x|~~��f���w��o�)���TZYa������ͪ�hcֶ�n�RJo��,3�����L/@���*��������_|���L���Z�����t��>�Q	���<�֧5rbeZR@�9��w�!�/~�sΈ��JQO)M�:�I�}���OO��Kl\"�
PI\"B^�ֺ��<˥����[[�5���PJ����}��_���qV��|�j0*#A��.G_�}��ɮ���:p�W�Ĳ���z��|��G��t4m6�5�?�9��ܻ$��C�.��=q&j�kE�@������I��(Ԧ�䙑R3�_ו�\0P+Z�h�5E�R��D��� I\"�\0��V�A���~Z�Q4�rB+T$���i���]N��`08??/˒;.�X9c}QB�6	�o���=D�u!���B����������M��LK@#
�L)��T��|\0��X�B�\"�� �|�����O���^�za��Ю�o�X����88��{�
i�{�q��ccUU��ُ?�pyqqzz��eY�Lpt+?� �\0���>�w�z��A�k��\0�8�\0@��h	���/������ޱ��C�(���QA ʴ�Ji�6U)��R�(H�\0��|�H\0�A�Ep���\0b[�okrއ�[@@�6RIB��������-����(�����r�!8�p@B�S &Z��Ox�{]�B�ʵ4h}����DP5Q����\0��R
O��@��
-��@��{9���?�����?���Gө����R
�5HI�\0��@��0�\0	�-]J��NDĺi^�x1�O�Z��رK%k:3!�t|�PN�4铨��~B$;
.x��7���];%�2�y�/Ã�ȋ,WF��f���)#τ\0�K�[o��Zh)��p܎\"�\\�o��˰]qɂ���T�����e��u!��PU��UU���N�ǡ�(���&ꭴ�G@ �JK�k�e�A��B�Z�\"ˌd����Rj%��*Ȓ�r�2����
�r�]]�^Iשi�9Rl,�e)�\\����1������Vߡ?��Y��@d>�(�;��W�aw�^V���Üy�u��O�Z2\0<ߦ��Ul���8\'+{j��6nz^�awV�]�T���\'�7Ҽ{04M�^�7���:�2
��j�Y˲�m/6qT����N5ח]M������>���OfB{5
w���
��:��j�0�c�62y�sF�l�B���[}}cL�g!x�T�eZ+�\"��r������\0Q�B����������P���N���AG������n�\\��f�77������1f��p�t9���b.n�Z��۷�g3
�I	\"��^���r:?�A��ѽs�[h��v�Y�e�d2��f���k&�m�@�	?I	�$�Y�[�E1B��`�6FK����
j�$�-ePr|r4�J���z��Dr&�}���f�b�^7�y�����?̲�C|�lsHO4uR{[܇ne�_���L��ᑏǷ��cco,2�Z�[YH)ğ\"�qOJ�`�ܔ[M����#%}:-G�4c����QUU�gytt�K���͔�`8Ap>�4�$\"���$ˀ����5�R���ϧ�)���Ĕ�=��=���b�-���X.C���(&�Q�$�0����2��\"��5֔	A���N7k��6�2�\'���f�x��\"\'���z\"%6�C�$��?�w���^�\'�������p�X,���d2���`~|���A��l}�1&3��\0�6R\"s�� )�mx	J\\��J���(
�8�V�������t����H��٦�lv��r:��u͟=~�̺~{�����m��OlGG (&��˓�{���d�ќFy�j2��e��l���Dl�E����L�4��D~g:�%���e�*t���u�)�ٓQ� �\0@]�\00�˲������M�EQ�d}�ݲ4��/�n�
��]��#@�����`i�嶭�����������封2W+NVrs;��x�7����8�[O�C���V�~�z��׽y���}�������<�yl2~
��>wt�v��]L��\\�LT6��m[���C�����{(�\"g�6���y礔(�mܶ�&�%�KB�[�5�����7o�����N\'�H�ҍxO�r�]��2���=C��;/�z��R��Ӓ�2��?�A�k�)�T�&�Ǝ\\�)����s��y�^r}S�`0��o޼���qTP��3ֲu�;Tn�Îdd�ѱ�b+��v})�,Z[{~q:�N�we�Vm��IR
{�{Ou�\"@������m����t:���3u�w|�c��0��yp�n�9<��GZ!uF�w(Q�ݦj\0���?�h�1�D�M+�.I>�������W�]ʠ\'��^
INSERT INTO student VALUES("KICTC-CER-009-2020","Nicholous","Jackson","Mushi","ELE","TC-ELE","2018","5","kweka9@gmail.com","�PNG

\0\0\0
��c8@B�g���[TI:�=\'l��Z�j�co 3�#�������?�ӂ�.�����\'�<���?��|~�ߟ�}���=�~�y*�>����������a�S�˅����~a���������g�^h|/������L����_��������2���[�߷}����sc��p��I!y��?H�KS/�=��C*��?��cA�n��_F����ϟ�?<�GPR�<�x��Ŭ?���P�x�{A���/wN��{��0��Ώ�Zw����f�,i�N��T�O�q���}����W�����Wwd�&��_|�0Bd�o���7����f�9��x�q�������R�W����,u�	o���s,��w���й��J�o����нJ�|��V�+*	�\"�＋���#��[�_�Q\\,o�;�~}.�J���(�@\'�Xx��Zh��\0KĽ�	��J�|����:v�3�P�)�EB)�ẻji�Gݛϴ��K�<
�E��b��g�~E���_q�?\"��G�B���׸�M�Lp�}r/B*C-�O��mm��xz��W5Y��E$�4�a��ޣl�g���=��G@I���έ?�(���n
/�>�� ����2��Ը\\�c�1v�=��F;�����wm�+��i
<J�A��;h������ťR��V�|#o�]dV@��yl+� �Y���ɤ��||���� ��W���\03Ji?ؐf��%����=N0��>;�Hd?Z5�r՝���v�,����r
t��3\0q��Ȭf8���ٵNd���:���f
�k��Ȗ��L��t�� ryr?Aa�T�D�aY~�&��դ6P09�c,<b��`���K���$���@��$�Hz�Ih�X��#m)��n�7���@VVP��P��R܍\"OǍ�W�~m��q`8��|�!F�V�A��
j�d�r@�`�w�:�CyC��}T�%Ll��6�kgM/h�%��x�l�P/Rkւ�-Pn�`�R0�$]7h�np�	0��&ֻA���K�\0���Ďlgu��
 rܡ���%���0�
{�n��~���r;�*��b|
�o:��b�}�b�bBX�V��-U]��+� ��3洈xN��V��I�(�F�Ohd�K��(��2�_�>�r��>��b�<�v0Ű��F�x�G�|�5�S<�����BdQ\"�vE\\]�)0��M13N�SӠ���\'��*1�!��C\0++�j��U� U��B�a�K(�3�Ơ(��\'�HB�*͋��/�*��v�^��T?���m�Z��IIȝ%X��9�:[!�\0��x
��Y�fLq]�`\0[�!���e�9�Cb�Ջ���]n��Ċ���;�y7K3�T#�Mb>�
�y
��]��`�
22��g-B;M,�+d�YocW�2n��8P���
�DFm��[R�xT\0e��4�ҁ8��|ռ������s�:�L�hY2
�F@r\0���|��c{С�:�6Сqރ�iZ��#�4�IEr���S1غ��I�9��3�k�<����#�FD�bk@&��(G2��8t�59�E���@��G̈�d�N����*x~>ʭ�#��R��*���qFCR�O7y|�J�c��a*���C��uZ�t�H�\"�m�%(9Wr��:$AV��0l�R�0\0�c�C�*��|!�M�Lj.��վ!MT/o�0��vz����j��$V�PJxQ4\05L�S�VO�հ�Ԫ�����\\��jv�ga�k<x��,�\'��芬|U&���	t���|s�i��b�1��1Z�t�Gr��V���$��\0��AP�AU�	���r�����f\0� 
���,T��ry�=_�q�2d��;��6 �j	zC5�d�`�O��Ȝ�J���#
�t�7P��ꌢ�x�	\"�R���q֐ #� i�I�lpTPݩ�S��qK>L��(�$�0�-w�|���P:�
k �I#���u�Jm.��x4m^��������|���O��W\'��p�Cx� �K%CM�)M�1T�8��.\'7���Y7Э]CZ&��l�%�0P�z� ��F���(N&M���2�u\\5��=d8�5&W��L���j[5D�؂Q�:�E��$�&��d��4��5P�`yb
j���,	��
n�e�/��c�fHl��4T`�Z�ҫ�7^��lA+m��w2�kUX��TVŇ�mк�!� ��J�_�,-�\"�rb�FR��j�4����.`�7w�X�Z_��xCX��vF,����F$��v�����j����cG�B�����ed��\\�T���`�&QT��u\\ic¸���1��D&�HHJW�6�z=����3�GE�/�ܰ����܂f�q=�-r͘�C�2kƲ 2��{d�eL)u���/�\'�\\e\\@�O����\"�GYg��:Y�Q�(��W!�ޜ�U6�F0�҈�B?r��,�2��G �\0�Iͥ�<jYP�$f�C���.���P�$����r��Q�� f��P����%V+W۠��!�\'Ĳ=B�2���b�\"�\0u��z�|\0gYv\0l�J\\p���],3dhXJ�|P���,?N4|ٓy�\0�T\"ӈn��0���X�j\\8TICXU�
��	��	��A�#��R�ڼ�����W�)��~l�=C�;�I�D@Njf����G�y�p�8#ȋn~a��6/Ylp
\'6���ۡ�=���)��+�2�}�}T�{+\\�/#QL��	����X`j��O�K�>��x��S퉌h�ȝ���p�CD�:ՉW�9�+xTf�jo�_�u�~����OSMWt�=o� F�m�ˍ��.\0�۠���T9��~Yl�Yp��ݼwj�{\\W��^S��V�d�<6B��jn&���/	3���֒��92�Y2����C[�z��j�n.^H�6�LNW�ǎk���VDv�c��mJ#��[*�5�e��Z��@���
��ljK��H�������/��%��작���14n��n��x{$����S��-�/�`�ב&x�e�no�p���K{�8
Um��)�%d܀ml{���oa�轌�J��UPS�D,ɣ��������Ÿ�ڽ
��X�Lh\0n�z�U����E��������a���� �ꞇܘL���]��r4�Ϊ���nb$���I�d�=W#@�!>���D�R� 󑹜:n0�牢3��B����AH�]�Qm��C�zL��H������}�Ы����ʁ(d�B%A�?����d�N��x;#���/������e�zScD�!}vj$C:�H�f#�%`�ځ��P�����0�Kmș�|R��q�ϰu\"�P���^]��

M�2�d�6m��=Ŕ��
�����ӝN2 ����;�u4�h�Tb���Fh���ǰ����ڋ��\\���G�`��h���o�c��t���f��o�� �)uJ0��sƄ��=N����K[AG��K�]�!A���o��W���Nv���\"%����2箓F`~y]}<�����x��q���P1�,8��:r�ww�m
M1�Ί/r[]&Y�����?jQ���F�8��>-h���O��UJRW�,�:>�v�>hH�
�d�Bn8ry��\"��K̕�(�R�,҆ލ����萣0!21]I�w�|�u�Z2�lw����\0��6t+`��(�ЌD���$�ο���s�/�v�C̢3��Ҩ��~N���Q��jҧ)Q��aŃsF��8\0��w8C���ax}�T�Z!Q#�g����
�QǑi���
�0?Ur��Ի�t�_�@AiYγy��IM�G~\0
�r����4.��\'V��^Ǧ�a��� ����*�~I��$L��x5{�b�c�V�Q��
����v_m@X~)�D;�$����d87�\\$v�E����9k?A����n:�
v�␡:Yq�*�B�Zu0����G�����b���YWWA�\0qrtRt���Z�xp܏w�w�\0�Qe��5h�mfRI1�_C�#�B藙e�JR�����%x���?G�Z��g�a����S���y�8�ʲJ|N<j����x�ƹ��3�f63G%K�t0+��$q\\�t�r���8k�kݓ�0RЗ��Ns),`D(���*l$h�I������?��%r)䪀�c� �~�?�ݭU���\"I���q>���.Ь;����4O��3p���
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:57286358-8f75-4e3d-993f-b784f4757141\"
   xmpMM:InstanceID=\"xmp.iid:f86ea45a-2f4f-42b9-a0ae-3e1921d1a02a\"
   xmpMM:OriginalDocumentID=\"xmp.did:891106fc-1e53-4283-ba1d-49f5419ce0be\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1603715613619820\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:c878c1d9-24b2-4341-a748-0f222dd0e377\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?>��/�\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�
!!����\0\0 \0IDATx��i�ב%h�{�	pUUQTkWU�������NM�P��A �ؗ�w��{�ࢦ(�R��RD\"3���ܖk׮�v��k�_�\0 �sD|�GA�!����+W�K�*\0 \0}�_��K|q����8.l��8.l�⸰ы�⸰ы�⸰ы��{��%��;�z��Հ�?zq|/v}�/��|��8.l��8.l�⸰ы���F��{�qb<_�WT�׋���+\\���`ķtN��<}&���+\"�,<�W33@ bB��AD�p\"DĈ0sw\0fBf&�\0Uww�߀pP3w\'\"D$$�$�Bxx�a\0�YD�����: RD?U\"�\03W�� ��w_~,@���Ǘ[W|#~�����3�[NDL���pS��4)\00swCDf\07�@fa\"a��an��H�Ȕ�n �|=�4�0��@\0 ��Pm\0 RD��]�E(@(\0B�]�/#�ô�����1�{����#0\0���yD��333#bx@8P\0P\0�5�y7x��-�N˼��e���\"Rk)��n���ED��RK)�\"d�@�@ wG���ir���@�}��g��4����y�\0�������<��E*\0��2�y�>|x�νG�N�ݲ�e���4M��nۚz8�H�E� b���,DTK�������������������p��f3�� ��7U3�1]xw����p��>:v�~�t�k��w�3}���/\"l�OOL�E��	7s3����Ǐ<xx���{��?��������;9=m���{�ۢM�\"\0�Y��3�u7UD$�Z�0���`��l6��g��/]�tt|��s�=���/_:>>ތ)B���\0)3d̋�_o����Y�?���M\0\"b��g8��f0�����ѣ���?�{���r��O�޽��ᣥ�ˢ��\'���=K���Ϟ?Vk]���[	!���q�}��_|ᥗ_z��^|��˗/?�����!3F\" f�L\0�����_��!���+z�i/��z�6m�����G�n~|�ƍ�>���O>������VUUui��	)��-��T!��,��E�F����H�sm
�8?st������.?���_��W�=w���������#be�5.�����l�)3%�ph�̌�E\0�y999}��ɻ׮����ݼy��Ç����mBN9V��O���*���_�q����p`.��!E���><���W?���������g�?��vw�f\"��ۨ�u���#�)�@ ��=yrr���7n\\�u��?��ʝ�ڲ�;2q�\"\"s#$U��,���03E���
5�{�R�yYD
��r�$5���R
���k�G3=�ܥ_��g���o~��_���O�y��\0L1�,@f�\0�@����C��x5����@fb\"w73�z��K!�x��ѭ��>�����{��۟޶\0�*�4u���|����������3S)%�ZF�����4�9�u3��lx\0 G�Y\0\"�g��H�w������޸q�����髯\\~�g��6����Ux%Z������L/���ۏbD!\"�G[L�#@������w��{����_��s���;�QJ1�\0�}��\">]7%BU�(�K-�8\"�<OD45�1X�����~kmY�̃��/Q����l�
Bd.dؼ�&t�L���eSFs�.�ij��@DiK;><*,A��\0���!� s�821�39�8��\0\0 d�D\"DH�n��D(D$D�h�($�����[W�?x|�����������=�̱��Y!f��Zx0s)��Q��lW�$�\0vNE�yXBJ�ń���*F�����޻��k������۷ED����T���0��Pk�����(�,2��������dh��<|BD���<�� �A��L�ւI����$S�\0P����js3uF�\0�pWw��5���Qwkk��(Y�P�>���v���tv������Ǉ�$A#J�Bh�`xa�ߌ�ƗyYS�R0Z�`BP�yi?|�ͷ_{�o��;w�B\"���&����xB���5`p��\"��RKEDU
������>c�	_�ӎK	��@���o�^�	��2�������^ \"&����RK\0�E����R��v�EU�7�����͛���[������w�ݮ��<��̔sIkXum
�ZZk��V��R#;����4�4ĈȖҲ,f6��ܛZ�#1�P ���{Ǚ6��|��|)��iBb�0S����\'�����nO�������?��+�y�gmZ��\"��x&�óQ\\�0q*=|x��{׮\\��o���O>��9\"\0\\U�i�(H�f��bfn��x�6��jn脌�H��0#
Y�tfQZ�J���_\\���Z��Xlv����O\0(��0C)Rkm����3!Bk3 �=}�g�hD�v��n\'\"iه�G�U�Ù�D:]����d���J*i�9�25B\"��Ck-����˲�j-e�UJ9���|�ͣ�#��o~Y3���T�G�D�l��1���lG��E�e��{�����?��Oׯ�銒�n�N����$�q��ksea�Z`�b�#d�P�MÍ��\"���0#n�Z�T��03`�,�3���Ⱦ��Zk���F/؉�0�Z�K)\"���g�SffB�0\0pQ7M�j�ֈh�\"N�r���HR����^��:Ԯ�	&���H�E�,=��u��Տ��?�����|�7>����v�Ѽ3n��5Gԭ6�vk�����o�{�7a$G���z�H����z~\'�L�L�����[a����n�\"]Jef�N-��N�s��l�=UD� ����\"��m#���,�P9YE��l��2MS��yY�߸1�C���/��B����ʇ�5�Y\"$HD�f��ɓ+W�������?99%��n��F�.�<���R�u1��A6BM5A�t���#A�������m����lO>�rf�4]��hUQD|�g\0���bf�WA�\0����3�`�&���~��ӓ\'^k\0F,LU8��%�]f���a�0x�{�7�O~�2\"����\"⎉��9\\��W>�tYD,����{<z��ڵko���իWOO��i4�DLrlc1��yf^kIv���=�9�\"8\"���9+뽉�a�o��m����	���8�0�a�}�N^��:��iU������Ӳ��!7�����Yʟ7�����F���iO��Ƈ7���?�Z�q�t�R��C��,6�7�L\"�%�z��i�q������W���j��Y� �²��	ǡ�Z��R3�\"іf~��zmJL\0�M��X���Ѵ���3��fܔZ=z�Q2�:��y)��ĖB<Dkb���(3�R���0�MVx$���ŧ.q&!Գ9\'P��~xx�mF�����.KkZǁ�����L)&����+W�\\�|�_888�&HW��1\'���!�o�fU�������G����+oܾ}7�[kf�)v�R��fk�����a��W�Ҫ��\"mYVf	hk�V8��$�
3bv��ic��9��0�����w�R6\"%\"�y:==��:n�DTDXd��T���%3{������\0KS�������9��Me��\0�Zi���V�0�n7��BH�e���2/���0�7��_g.E��������+������aο�ѳ��w�{GbY<�\'=z���o���G�:=�D�	S����ak-\\�
u�s�� �js�O �p& d@H�e�0%��\"��\0H�Z�����˗2ߨ�J-G�#��ZIh��d-�/��ei}2�X���I��PUm��n;l6�yޞl	 �b�L�X��
��)�5m�# 3�q�QX�qL��&�;w=]iPf&��\0����P�\"�����	KE\"0ܛ��!\"o��K�l�D$����Y��!0�!@��L�V��sk�4S$@D��	R@0!\02a[����n�kmIVjD��Z�.A(\"��O>������O��_D��G��>�(�,��=�q�Û7o-�2�ZD0��1�ШT)��a��P
#�΅������pK�=�=F��RG��WP��׀03m}`8�����P{��C������+�	��1�A���x���  �1�Ѕ�0Ԅ1�	l@wW��+�\0��\\Ӄ����f3^�g�-H�&��<r;yXҩ?z|�ƍ�t���K���������<� v�|���[7oݻw_���:r�r�f�\"E6ðk)����.��8��m��n���t�	D���Rg�n�113 u�&bfa©5� �R��A� ���eif,,\"\0��H��r�Sn�qk-	M.��xm:��Q6��8����̖��7Z�!F @$*��_����˧��8�۩�i3w�扖���X`����ݻw�ܙ����`���Od��x�ױ� ����ݕ+�_�~�H�
!Bx�`���R���vrz
\"��n�LΥ�}ZgNo߹��[o��??>>���C+�i%��z��h�Ĺ���	qZ��w�<xp���b/QK��
2s5-B$\"L̀\0�,�n�s)c�R�������ѽ�0w�\0O:? �F%\0����-��&�%�? \0��n;/K#\'\'\'7o�����}�ٗ_~��;����{����G�\\}���w�i�dxN0�s.��=lF�,E��up��Jb>	R��h�)0�����A_-�L�)����O�HH�E|��G.����2�v��xD@ \"���qiD�,Rj�Dn���n��������OZ�E�cxDf/n`����\"�#���<�Y�#h[�y��a�^��N�Q��n�޽���|��\'	����w��{��=�d\"2��,������ �%bI����_\'Z2���$D����<Z��$zڃzBU\0�_���N�X�P�+\0\0 \0IDAT�Hs�C ���ͭC)V��ǈ<�����0�o`��m�}(�Ϧf�w�_#���:��=�����&̇�XK	\03{��j3S�T�,��;��������<y�j�ʅ�~5?j����ܹ��͹��p	�8Ժǃq(�a��#�vQ�\"�V�^���@����ޘfϨ���\"7�v�a|�\0�]�\0H�!a�X��t���t�,\\�J��{ .�tD&B��L�twz�#��<gn���@@��@D����E�0����i���S�F\"��,�k����nOOO�]���;�<���{�_/l�+��\'�O?���.���\\k7�X�R� \"�X��Ԛkf��}�)#A��\"\0b��MM@\\e�@=Lݍ0� �-�0�)�EJ�y�H=�+r���۳�U���! ��N}�\')���������D�|ِH�sC���Ǡ�9��p��ܥ��-М6i��֒3�I�������;wNNN.b�W�P�{����[>�E9���.4h)�	>�&V�S z�G2?�\0�wˀ�,LB�c�lv����7:����\\h�����\0�pss_#�Q!�\"���� �>��[Ta�T6����yӖ�!f���aB����!<�\"EL	��]9>:�aj���6�/��I��RJ)u^���|a�_�^8y���w����P�f��0�ڜȀan���,�yx3Cѣ��I�	�/��`���7E/ͨ�fn�rbk��|YE*{Z�_ѡ�9g�YQA�ś�0\'�$w*�[�W��0�qk���4׌�#R>7�m
�e���p���\0
t��ޒ/�P=�y\0S0������=�ҝ�����#M�T�˲��[��F�e����G��1܄\0	��({���#�c���b�@`qĬ�%��@��qtwՖ�*Dlm>���,���ә\'��<z�x��E\\��g��9����BQ_�F?�5��J�o�F��\"2�{_ipzzz���oܘ�%��L��$���V)B�����Yc��D3\0\0�5t�1�D�\"�#\"gE)<r#�����_�.k��h@��۔\0�ܻ���������:BfB\"$&ⳉ�H���T��\\Gw�p�@b���l۹�{ � $��7㸴���n�ۈ���������f�\0D�qzr��ɓ�vgѧ��0�7L���3����G��b�S0�[k�����OݭHEBsG�R�f�ٌ��TD$�t
��W����[�	c���E�Է�G�IY׋pe���̌4����A&��L3�#�]�XU3|��gA�+t��NG(�,=&�)R���3�&��CWO��\\���ݻ��O�O��+uםYJ(��f����>�\0����ww�Nm1���
B�� A.n�l���Xd��@��,������< �ה�O%~���=(��CV�;����;
��k������9::z��%F����fe�B�!s�\0`�`�N;��J��}˸�C��f)�<aD���\'r\"�9���ֳLviX�wR��l˙i��>$��q�R�%m��y�ԅӸ�\\/�#V�>�  �[�L�E��$\"Ȑ��b\"x6��6���<-��{B���5�~�<ߝ�L?�~����Җ�� �Z��*�����!Jz[7Î�0\"E�\'x������5�̛������)E�,���:j�Y\"�Y��w�g\"a�ɞ�Qد�@b$A⽴Xn�K6S�ҟ�,�W�~rN�@VKIצ3����j!���`^�f�m�����(\'[kj�z�8SM���ѿ	I�����U�MY��e��Y�6���񳗞�4(,�9+��|Y1��.\0\\sv4fR\"�H}��);��D��G���\0��=��h+s�\"	#a��s�}�y�>�M��E��Gݛ��x|ƕ�hE&�OO�I2Y!D������ ��D�xZZ�NkߗAR�\"m�T;�e�	 �w���ُߛ��z�������!�f�9>>.$����zA2_wwG8�Z��V��#䎋R��<\0P����N~\"5��[�I�\"�V�~�׹R�����#!�eX��^?ۿ@�@�������v�
��R\"j����2M�nYr�C:v��m��[;���k��k�g��_��
�͒uI}Ĉ���Zd�lJ)}X���R*�ˤ�v��`�*!�E�*��9��� ���T��-ӽ;\'����B>����	�@x���5cN�ྦྷ��7wK�q�=�
@�D�L��*����,�St�kY�y��h��>��=�q7��D@Ĝ�W�EUͅx,�$��2���li�Y����N4�j$7h����{��
1��9jk
{5y3Ws���%v_�).g\'9�D��_\'����B=�)c��V2QnH��$/���,4��^����d){��N:�dF�J���-E>OK�@u�y����1������G�N=�0�@@@U���_��zc}oaO���3�ӹ�񥮴�&�B�$Oe\"�_��ޙ��x�t�H8n�5�Uս[
	��a�0D�$��\0���:2�pA��Kk��ݼ�MM=�C��2V�Zs!�#b��aB`ǌ<,�gɮwJ@
s=l/�0�X8�)zG��M5��m����f����YvyBf�%��=c/����0�GʙdS��M���+�Ϗ���n11\0Nn˴�mO���l(|tpp|x$$B�n-,\0,`Q-��$S���7�����\"���g�5�2�o1��\"0#�9|��-+���ֈh˒4���z�=ϕ��<&\"\05��y���<�lw����{���T���$E���j���8yi���D��cńgSْ�w�u%-L=�rÓ�j�}\"Ѻ)��D-�NN+Q�	���3�+>��T� �Y@�3�~[N��{b��=12w`a!G�JL���#�A\0�d���S��D_���$��|͔P�2��RL�L�Ա�0u�l6�W���
���WVHi�Y���ۢm���v���4o�i77�0�EסVBTkn�J6t�TK��E��2�:�\",KA��EG�H9�>�d�M#Vd�OUh�B�Hi����n��S$�Z+g+���^=�ܫ�^Ɓ#� �#���ǝ+�D�e\0Ǳ���\"�)\"��Y[9!�͊o�*���F�l;����B�6:3��MfD��l�q��e6U\"�UZ$�i��F9��+�u^��v�M�Ҵ�9KN��7U��0!��B�0.J\0�m�e�R*uqx�a��q�Cf�aa��p2�г���`��L�2,|֦fj�<�{�X�N�2/�\0%mtQ
bw�4J\"
�1��8۹��y�Z�aa8����V���!�Q�/���@C���(#\"� 	��������p����.���5�\"�6�nz3mjfR��<X@SojsS���yY�Y[L��L��]#I�0f�aY�y��ԡ���7����8�����鴙73�u�U�j3[�f���n^��i;���������:ѣ�&�W��$)̵��8�l�qȆ;@�G��5��
�������l�vj�h�7�M�0�f@g�{݆����o�L��X��<\\$� Bb:>:����_���j
}+�����$HFXk�4�v�eY <K�*\\k)u�ZhQ[T�Ew�trrzrr��|��[�0�O���/�{q]a�$�,u�.�O�Z��0�R2mP3

�H9 ��n�ptp���\0�I��.��D��j������ɉ��R3�Ժ98�M �͚�z�K;7��ݍ��ЖY��ڢ�@1�Z��25�j�ؚ9zBs��9�#(��+1�i����PՖ�LӤf��楝���4-�X�\0��h�4���խ�X��Ե|�04@$\"4�f�<M�:��f�q��A,��%bDJ��G
bJ)�YBÄ�\"�X�P��4Ń�f$�0��nk�;m4�����ea5��;Us�On�zx��R2�K�:��L,L�ꪦ�˒)����S9��Ke\0KK�Բ����@u�wSkK��&�y7��njlM���MݽyD�@
 H�9G�D�o݀�Q
�B�!�q�r\\V\"<???���4%��k8�H33���C|�����C������	�J��_<���Ϗ�e]�_�����_�]�\'&3M�n�=��ܴ��z\\L%�4���2���hN� �$Ę��9��\\
��j&j�i�a\0��։����v5��)#��ћ�͓8{jF(�FHd�Iۤ�&��p*��Zp��H�G7���LX0FZ��q2#��)�4�<�a.�<��0
`}ꥪ*����������91�q��8\"c�\"ꆄȩ�7�U--�\\͚�H@-!�Ey�.�T�[�^(NMUč��:q�����JΉ���������q���������i2���,�=���ђEw_����ן}�鋧�NNO�<z�������n��i��}����9
�)��R��8�\'x�jۯ�|<��ǵ.��x{{���um��>������~�w�W���Ͽ��_�����>�Lci�������?���?>���n/��\"*�0�)a>?�z���4N\"�D��ӀX̒��k�oeF54�VQ)�\\\0(;fqZ��K�\\�ӛ����7?�/�������<O_>��o~cL�����f��]�9���������O����������g�aΜJ��eCj�.�s��>:: \"#��IGW�!�s)���͉���Û����u���]S�u�?z����ǎ �Y�c
��\"�]�[���\'K���_��o��bd7,th68�?�|�U��w��b���V�՚���[�i��q�P�55���@�ڽ�5���Бs&gV�T�.��J�2}���\'�����w7�?���>z�$����p{Ǆ�4�.NO=xxvz���_�zy��/�.=x�s���a�ݼ+���S\0�B�e�D�,��N��\'GUE��}6��(l��F�.w�e\\����G?�����?���{ｾ�~����������/�˱�\0��?�������tw2
�)1����`�4N����c��q�;.����W�JS��\'\'��X\\�NOv��������~_�0%���4�\\����-�3ŉ�Mє<!��L�)�TR*Dd֐ML������d�@�.Uv��������>��Ӌ���?x?
C��7����4]�Vm�b��sJ��������~��D)n���������i��N�g�׍�����p���y��c����G拉E;9T�d�3e��(qp\"TT�9q�g�<Ӻֵ��q�Z�\\.O��D�h��o���������%��8(�PJNR������(1a2vWr
`\"�D9QΑi��ZT����
��83@\"�e\".Ӹ3�2:�R�<���-㈉_=�ʰ?�h7�^����7o���0W�M��gϙqJ�)�4�K���wp$;�Z�c]�V�xIE���q�S*)��0M���	�Iw�p��>��#���E�ҍ�R
���6��!Fy%�[�m�.�FAzߜ��i\\����QŌ��L]�-�atsC7P@�13�=4��m�H�kҎKu��S�dD�1�4LS�y(%C�\"3μ�rl�|��S���tN����Uw3���s�z��w�&\"\"�0����Ck�,��)1\'�X_ɐ�
�#P�MT��\"[J���7p3�,7s����;*�[�h�!��b�V[m
3/\"��AUgQ����[���j�{5f����k\0���\"��Mݕ	R\"\0REw�#���E�%��I�T�J��p�w�R���v�a�YA���F�!f�R��v�$�L��3�TG@dHn���c�)ȷ�OBpr�yt�D>2�A��TX��KS5��Vs�\\0�2��<�s8Q\\�,���\0\0�(U�*�\0 1Q�5�ڪ��sr)�s�!s.<M�6�k��f�r��\\1�Ј*p�XF�UX%9�lb��M�6��\"`�\\��]Cww5S�-+=r�{�����L��YA<�4��4�ø��{�s��޳�CD2�#1W$2�����#@�
(d�i۠�1��9eN�ED�ݹ��p�P�x��Ұ���C��PiZEZ�����ݩ;,�2��\'O.//��pؿ~������ȉ�2��4�vC)n�Mѽ��6uN�49���I�y�ǳ���<2���r���d��\"����?�c�۶�t��$$b#
�n�.7�@A�k��Ǫj�]
i�M�{�!\0���c�5?d�n!{~ۮQUS��HNP,��x<����Ϟ~�٧�������8�\\���>|8���k2�V�63@v�c�on�^��~}s���+w�9���<���:?��1����J.0ú�\0 ��Vc�p���
H@���\0N�3G���b�υ���+�G���r�\0�RӘ��[��?Qw`N�M��(ͮ�o��������w����?z��+�x����/�{����b*�8�43u$Gگ�ׯ?������www7צ�K:?;��}�>zxyq>�\')Ɖ�S攥�x����a���Zkf*\0�V�h��ީ�=�l����������h�G���sJ#瓓��n��M
=�	�_���K���#�� E��D��s�BClw@�2�Rԣsssssw����O?���O?�R����������W�^����<y��|��gH���x����?���/�\\���}�����aH�w�DD�%�rJ��b����l+!8u��\0����V�[Ds(Fm[�m�
��6����l��
G]�M\"\"�6�յ��m��MM)�\\�N��^kt�yw<.b���pvqvuu�9��7��뺆��ir3C���لt �)�#��
Fd���%qC�=kS3����tSR���%�R0���D��8\\�e����q]\0q�M�<W�*2MsJY�ֵ���=?9�N�x��&k���8�Ӕ8���&�ʲXm�0�|2��8�a�RBI��zdS�G��{9n��\0�s�z�D$�9��y����н���!���/S�����r]��T��ꊉQE�q@O��`�~G5��% �mv!\0D q������t������������(��3`�(4�f�f�i�M
�DҤU;.Z
S���<�E\0=\' 0�a�qDt5T#��8�RJ��t�*4W�H�q�Kd~k\\��D�u{����
�]\0��hȿ���l�90bJ���}]�W�_��4c]�9<x�����C�]\0\0 \0IDAT<y4漬jfy�H_W,_�!_��׉9�}S�o3�n#?# bΔӐO���\\]�=z��O�~Y�7�߼z�|{k��(.���`�)�\\�9�.?�&5F�����*U�������#BO�ː�)�y�G�-F�΄��]͚���8�l#�e]�3��˔R���LEe��k]���,眙Sʔ�������B��&�]�M\"ѴO��\"��	�����?|�}�9\0�]̪��SxVEԬ*�7L7i���{���L4ϻ�����o��������{�i���Y������*N�w1��y���s\\.�i���>���_�~�?�������DdFh�1�Pp7#�ĉ��pR��4���@�5צZMT�ܑc2�HD��TF�sFw�䈶��
�jCT2��U���!�*!��&2
�ܝ��co��;��\0����@p��Б�����ÿ��O���s��<_^^��_�2-K=�^S*�|ʉZmn���3�hty��!����<O�0��z�X_<�1PCa�,bi�*8�:��I���.��0$`Θ3��@�8g��Э�
�<)��C_����\'��)�l������֐8\0�\"��+@a.�M�\"��SD�
 �	sJ�oG�y:�Be	�{�)%F4Pm�@�ԭ�]�\0������
N`
�����Am\"��u��MD
և�HĐ��u������#�v7n]\'@@ �����<�3��J���1��	ȑD�J3�4�@��Q�3���zw�qΙ�j��Zw��<O����4����_Gq[�{W����]�W��D�D{�:9:zr�D��摱E)�y7S�����HɘSJ��ܚT]�)
�rI���8>O*��� ��~�u]��S&�p/�ZˊD\0^��Z�&��3���V����h?�����pŎp��x4�Q��RG5b�&��L��0=~����b,#\0��Z�Y�� aOrUs�o*���������{���I�Ƽ1�FX��xZk����⢌e9h���L��i�����<s���6��3 TC�4{�\0T������ܾ�
�\\�T!9\0�̥�%g�F\0�p���DCʘ��I�Zk�5JmYb�ʈ�9U�em˺8�ֵ��,�-%*)%�q,��H�Q�w/a�t\0Ut��
� Q3��� &H=����A
�����ɦ�v�h��˫�����͢l۱l�8��t�r\0�;�����;,�;��Cx���Yф����!���43mK5�]�	1s*93���{
�����J��6m����RJ�x���&�M��VEV���\0�Dd����
HX77mR���#fo�o�X�)|[�Ѕ��(\02�;L\'��Wg�S@H�	��\0��w�WZ�)���)�����5zꍙ�8�W��<#���1���c�8�x:	8�:aBN���󊑱K���b�CTi�\"�
��n��Y�U�Z߃
q���~YYL<��!��H��\\���h����O��ێ�Dn��Gs\"G���g��?wo�$Ir���a����u��cf���=E��B���B��A��:�*�8���T�?���3�\0�]t�d�4�yDy�����O��<:��(`(R\\W_힠b&��*>�T�?2\\���z���iz�:��K��2����?��/�n�n�oo�8R��ݽi1E��{���\"y���1P�9[�X�:;�:Q^s��b�ޜ=�C
ċ��r�h�\\B)lІ����d�[L)��IR
6M�X,�66M�4�b�8Y�U�HI%w}���}�hm�2��2��ݾ��j��,g
�g���n�&jۆ	9�bѦ�v}��TrB�&FC**��tֶۇ�AAu� VR�d�
�}\'���~����4M��H1���Pmt{pM<��O�q�9�r*c�鞏�L��M�r.ڋ���O?i۶W�V��&�Xx�����Ab�����>�裗/^^]]9���`NHs���r�Lՙ..K��Br��RJ���1��m�%\"9Վ�$g`^,�f�l�4�Dc`�(\0����]�а��i@LyH9;oι���%������)wET%��C��8A#b��R)�4zM(�hՇ7��@�\'\"�E%J)j�~t�w�w�}��j�QU�Q�m<S��ς�Cƨs@DK۶Ϟ=����/�]���DBR�o��l�M��\'E\"u�>�\"��j��B��mۅS��3�Izn��.c`4sV��<�1��2�9���hɜKCDeT�v@���~�#]|��
�%E��K��]%49�U�ԯ~�͹\'���l�82�1��#�����k\0P���\'O����\'O� rJ	\0B�G
 �j/v&i㍂;$=:]#�J1���}Ή) \0&��rJ�O�$3 vfZ))
�R8&%�1���EӨ\0E�N��`Ƒ�$K���T.� \")
h�2䜊(��֚Y�\"`~�r晋<I-�n�D�G/]�j�:�!�
\0�Y)Eܛ�D��:�R#X�j��*G�@k5Mݜ0���C�� ��.
�x�V�aRTQ3@�������;r�6�(P��	��)��X�B?�Z.>pUUT�Jf�g�lc%�R=�ČŖM<ݜ��]��bvo��={��N�R�{��ѣ��]�G��zw s�4�,���?��p8\\����/���u���:JJ��qpo�y�DT��բD��&�!X*���A@\\\'n>�b���`S��Ǧ��3��W|5\\P0#r�&��H�U4�$͢R9���2�a)�`X-Lji�&�z)맜 ��n?�r�l�\0�!�1��/��X��w��C�BE�(�1b`J��1��j�����/.o�n��r\'�p�>�v��\\J�4EL5�\0qEW!4�fP�d�y�I>:H���V�nT 3����jNR�q�S��5���\\�̰�������#3 $qK3�AL)0r�CQU)��V!�!,sބ\0-�Gg�._lN7!��
b������bc�l��?d��Գ9��HJ)1����_��?�۾��]��N�؋s�CU5�B!x,�^n��9�/�ȁ�P@�g�.i(.-�C����pzp�\'h��(��N����`ծ��}uh2�3f�P�P�	�ͱ�2�\'��F�֨��ƅߨ16������������r�ĦH�+\0BI=j�H�a��:�df�R.�,��O>�t����w�����\0 6���Dw�z�V1�f\"f
Dc ��y�~-�DĀ�M�2ު�n͙e���Ty�;�����*�j׌��0�R����+�\\r�i��/���ƀRws���7�C\0�f�hK\0��a�T*���mg���q^k~߮��F�����ѿx*���.��7����-��j���O�o߼}��� )�дm��jD5
02Ŧ��ab3�͢i���aHC������SN�oS=�9��i��X1�;�����kv��Z.��\0C�\"���h�!��`1�yd˸�Y���W��R0U(���E���ۗ�������g�xz!��O����]~��Ge�{�m������a��X��Vg|P����b����\0��0%�\'��@��n�!2�v��櫯��kcSrF\0��]�q��>3ͥ\";n�ȑA)%@5W���B�f)5��!PC����b�a,*-��9B���v=z����:��-k��!�\"�>\\S�ӵ�p\\�O_���i��8�z}s��������?ٜ,
IDh�
���->V� #��Q+�*�{�B�FU�s�lU�����������ħ
�T \"?2G�z�1�P�+����o�����>����������)R�;\0��� D��皩\">�_��f�0�?T���X	�V-��/�\\��w��տ��������NNTJι6��K���*R�H��q�o�\\�ͬ���W���,��<F�$VD\'����`欬j8a
`̮U}5Q-�:U���A�������8�zx���|0$$\"w//���X��4����×_~����O?_��b)e���VQw��-������q=QvZq��)���ƨ}w�i����|��_���o��8{t8>����� �Rp,�Vh��35��F�I}����<d攒���G����=DB$b�b�UDJ�f�F�E�*�U�qD�chJ������y�>�ӽ��\0�2^�[uI�J�H��+B��m�����uD|}s��������f�A�@����],�D���w�_H�CT���@P���Օ}��+F��\'QC 34$3{u��/��/���ác«뫟�������!
L��nP��>�	�Y,W!6w�����wH�����uo߾�կ��i������O..Ο={�����?����\'!�*`�,��Ϭz��?�@�F�:������`��G&���<m��k���UQ!�������ګWo^�|ED�4�t8noo�=y�4�r�`&)�pJ)̑C0�)W�@ޣ�Ի�+�ڌ#a�<�>S}U��!Li�]܋�(D��3a�v�ڪԉ��t�{-E��h��ɟ�/rgxB��nlB)���DD�1Ʀi�E`N)Q3��v��.�A��v�X��\'��77/��߈��ts~~�9�<:=ݜ�.��œO?���O>9??_�-��y���BG�]3#7ܙh�J�H�u��҈�zN{�?���.X����{�������PEr�s).,�r������V�Ӑ��ۛ]�_ĆۦY�����s.2T�8}
T%h|��XW�t<au��������z[e�fEQK��\\i�_V�����k���au9ϩ�7c6�B/���/R̔�b�&��b�\\��V���IC��!��\0��u��ۓ�͐������o����=���89�3S�/�v�^�>:}��駟~��G�?���r�B},�Bh.���uڸ�P�@Ȅ���^�S��A�_������4���DD!D\"���c�.����u������wۭ+�0s?�����|����j�r���j��H�|pJ�mR�,Eę�n�a����(�s��a%�L�Ɏ�lf41f����UDH6o��9�n�)�Oќs@cn��Y-W��mZDvO\\����v�])�Y4NcCQ�L���G�*�������,�rY-w��].W}��o�_��z������>~������ϟ?~����$�\0�5D&?�~	N�	Ym[�H�9�f:�?�zt���H��a)jH!r�Q�n�n������÷�~��W_�
:�4�������n��@�u^�4��RD;Uu��:?teF u���h����\0UJIi�FG�1Ju�O��c�	u�z�s�4�#Y���Xr�R˜�1�L�`Q�.���j�r���D���v����R�Rr��ZI�4!!3�OOS)777��~Hy�د�k3\\o��b�!t]����/���7���f�~|q���ӧO�\\\\\\���_\\<>;{t�^U�?�\0��]�G�Fe��w�_���[��b�x�r��,�M�0���w��ݿ��׿������-����ruffj]w��vg���\\��6�Vf�1����+?\"8�nܸ�{_��p��h��0i��&U��B�L��h@3�:p��#���{*�\"YO0������=3f\0YY.���m�I��5�������:��5H|,�D�4�!�����	Rx��]?dC�������f�Y�N���,r�����������E�q�Z���={����\'�?~���z��l6��z�h�B�>��Ð�|���y����zO�ӊ/�ag��\"�|��_~�/������/���~���/�>���G��J�ES@˥�no��˶�H&��!���A��\0T$Q�BW��1*��STE+XTPL�L��J1�)�!2�N\'�M�͎$k����):���{���2�Ʃ�]��X,6�M�4\0�2$�̹H��w���p�:�rK5h��8�\"]׋h۶�b�:Y�n]]g�L]O���FUK�����v��|��˯�^.����g�O7������G���6����f�Z�M���t���Vd~���bԙF�\0h��J)}?t}z���/��W����~�{��uQx���G�����ݭ�	���k���ޞ�o�\'L�H����r�4��R)�w��:eB�-���ނ��h ��ɦ��f�ް�)N�q}Zs�Lay�u�4�=S4m���jJ�S��˥/���k3��i��ۻ�0$�����5\"��\"��b��li�?T7��e�ʕ9�F݅t&�&\"�C�u����W_~�X���z�Y?:==?�x������/.Ξ^��mVM�c��K.�d����ᯍ�!�8)ݿ��d��= ]!\"�ŕd�\0Y�a��������w��/����ݿ������n�\\��m�\'\'f��]ʹ3
A�\0���nw�J��v1R�۶u��v�R�m�[sUF \"�8a��!�Y.9
�S��f��������lUmۖ�RJ�>f5���:
	�(�������8ĈH���Ķ���}�����7o޾}������/_�zw���������1�-���HQe�V����TK�����vw�9# ��e��21���Ms�:af/R}#��,\\$�;���yԑP�5ϛ�qPdN;懳eC F��\"��������3��D�d�݀G�gFf�!�iQ!4H�o
9��s�J�ܥ��@�ܺQD���
�鈡*��ȐR[sYƪs�\"�U�W�X
�̡i��p�o���ۻ������bi�9�a���^˥�)��Ba�_�{�C���Y���i�i��f�&�&6������䒫��\0!�w��d�q01�+���l�_��A�M�b�u�Clb��z= �y=���bY�^�\0�����
L��Z�(PK�	�3�0gD3����MӄƅV�ܖR��C��չ�ȸ<�G�O�<��8\"h�lſez[�����o����_4�OV���d�\\>:�<}���t���㋋��fӶ-QZG��2Bp�y�q��rsw�mB`��;�ݡ���y���˗��^���������n�~(E�=/����,}.E�c<Y.W�%��OC)�X.^��Ðr��c!rYϨ�0\\__7���1��b�4�0����B���i��R/@c�er��Aœ�R���y>�9w��������	���l�9���+����f���D���	15Q0�1;P̊�T~u�ﲊC���p���F
s�G0%�J��̱=
s�{=���-d��M���rJRJ�4L! @`nb\\�m7,v�>���9yc�>�Gf�fj!�f��4������
D�B�����K�\"�\\JJ�!
;�����ٳ2M�i�Uw�D!����$Zd�JN�Z��j�o|�������\"FHLA����QTѴ��CN{10*��v]���m��v�\\>z���\'Ϟ????�x�x��x�#uz�ܫ�R*RTbl�B���޽���o���W�^����mw�C7�}J)��rήo��ATs�G�RJR)�m���JN��(p�Ķm}J�s���ՎOD
 �v�kn�Z�
W��1[�ޑH��Z��A���\0�=45+
�������6�$��aH\"�! ��1��JČ�S֜��M�K��EdѶ�b1����AϪz8D�j}V?V���clf�^^���.�0#�F�?���n���	���޼��뗛������?��8o�E�1���m�O��D!+z{�{����_��7߼|�����n�;�{/�LUJI��
�捘�a�)���ET���r��Sי����d:��<�1Q`���i\0��,P�v�0�m��9�` �1F�j�V��q�R�l۠��4!����gPs))���N�{��v0^U
�B�ȁ�s};��NwA ��Lu:��є/u���T�c\"�z�\\�zH�d1$f�*�N�o��Z�h.\"@䆗\0��;M�=Ŏt�\\�4:�G�XMC�KU\00GK	IT��DX�W�N���<$\']@�*��j��oZ@d�;tC��I����ڗ���77���]]߾~���/�����vwz0$�sw�v���\"13�q��l�����m)��6�T��a�R�K+��>m<��9.o�����LLS·���c��[�&\0��0�>�1\"2�\"a�=�J�,��óLdo��������}`��X��qp��@\0L�8��6
B �2qr�C�L���LP����;�1!����(B�^�\"J�G ��c�AI7?��\\���bA�}ߗ��Z
�R�\\������*:���kILBh�v�<L	�=��;����@��z��\0E�RE��\'��cb;F���cJ�Fdmӈ��������d9����E���0&⌆��ʄ_�*=���d&��<���^�(1�8F���=f �P�^�Tk%�\'�����w���~���o�����77�w>�.��T܂�At��vw��� �-1c��}�홬�AJ*i0S��q(��� 9�
��Df�8�S�, Ǹ�}^��_�~�Ew�RCߟ:�Xͅ����<�Q��!��
�V�4#���֏�DBT�g�G�b��|\0�1���7kłd\0Lb�Z��F�����`F(b>{�����K�18�|o8B��:����GXӶE$�⋢i�<���
��Y�	H��j*��D��z%F����(.Y��(���T���я6�����o��������Ϋ+3+b���o8D�;t��>�c$l�|��D$��W�䬒���z&�@�R|o�,M���x�q,q�=�Yb��q\0EuH��C!��+ߪ�i܊8�sq����I��?G(ݨ)��Uw
р\\��<��fbH\0 fh5��*�q2L���3C��~���\0�,m*�h��N3P�����%�D.^t��dj�ֹf)��%��y�����_>�(L��4�q솹̣�j�mMj\0\'�J� :���V\0B-R�sGV�_�މ�*\"�\"��H
*�J1@������V��p��Zι�sQ�@DMÁ	��=�y��U�M~�9\'��]4M`��S��4�)�_OP
���NpTAŗ�7IDH����)�T5�xA�*�⹳i���C>�P�!51�&\0��s=�>�[��yu�h\0�\0��b�:�+
���}����(P�����4�h�I�̵e����}�a�ުF�H�50�#攜�[�k�!FG
����\"��&l�K5�J;TA0��z�(䶓G�8(��!��ǟ[4M�D�
�tO#xFk$����*b���B��}?�!
!��W���Nf��x.��5�D����U\0��&�#�qyj���( Qe�����X�
 6@�rHJӴ)F�S-��1J�:�(�U-6S@�MC�@�w��e
��8@����U��E_	m\"9��Y1K��B�W�T�jH�	��#�}gD��Ut ��qXisN��>O)�Z�8\0�ۆn��Ǹ�ru1%�e��9.��\0\0IDATvuf�FQ�[hE�(�4t����ĪJWB�h�R��I�jt�_S�=�ɑ����U��0�#�L��o�)g�|�~	��\'б2U�\"���&R\0
���s��WI����m	���=B�*r��P@@��)j��I���\0#�����
�N�I1|T/�P�!�x3O��	_��x=�C컴\"����s�Y�<̘���D�JЏ�!��:u*��I#ӕ�*ʓ���j-�O�\'�����N�F�6���o�\'i�R�*8-��Y�HiBc�L��2�H������)�r8>�M*j�.�o@�F��r\\�O�v������@U�U7��Ξ�+#9��$�~�)P�u��VR�v���0a�s���b�ZqX6��Oy�y�6#Dj0\0��s
���\\�D]E���<��3ɪ�����\\�ߖ�O�� b�zg�`|�E�(	[���/F�a���$��kϑ��xz/gIDD&�C\"\"�C��l����3P�i}Q�\0,*�b�A��_|#�80U���cW	*}uto�>�����	��@g�3�ޫ�������1�����AU
�ct[�X���u0!�g1�S�3�Xӣ@�xOOY�w�س\'L6��r��A�6�f(�d04Um\0�]
D�3֒�dЂ��w
�������r����T-�L]��@�Mz��t:��&u1f�Ճ\0���ct��S�D.�ŷ����<sc�������@�ht�S߰�
�J���˼j���i;i�L��MH��+5ȑ�D�,�:6��ϕ%O��8�V)1SQ�*V()�	o\"fЄ9D��4qD�Vl�U�d
6[��I>�%Ni�\'[ׂ��SV��?�f�G�ŃV苉�27D���\".�.y��y@Du�d�**y8\\_��ֳ������>����/��I!b�X��\\��G	���)�j��ٴ���T�������H?��?�\"z�r�۩�&}͜��Ħ���潗\'Mo+ٹ�.�0��Ƭ0.m��0(����C�t�׺k3@4D������94!4�_c�1
5!T0��딸��x;�D�_v,�EfڸG��K͟P�B��՝̪��Of*O��3\"[���?�(�\0���������ӁB$4d�2��� `@Z���i
˸m�#0I���d�;-��*1FG��÷�VG����;����W��\0��_��՟�������|c���i^{_B������}�0��~�5�14�v$t�l�X��MU�))���TE����z��Ն0�|��t�z#��`Ge��<�2H*�s*�\"���U���Q��ǩ���c�@a$1�5���U�|�i�0��pG�����1��,+��9\'D�!hICw�o�þ�D̄���%���!2����0���6��7ڥZ�&�kV�I��?�\\��a�>�����{�*Z�#�(��������)�����\0k�N/Ư�JY��S{1��^�m�(��Q�L\0bӐ��E��� 2U������?V9,��ߠ���O��߫�s�`���J\'�Po���D���g`�SF#0Ҡf�	�9C0@�Bz�qT1+fު82M|IQ��f/�f��La?��mSA���H�&
�j�E-QC@&DE����SA�R]f�����ZUN��8�eH�)���^4v�[ث��_~n|cf�~�!nE\"T�2����~�5��W�5%#�j��b\0�棋<�����.W�Ū��oE�	)P**\"���h�En���⼣�-J|~�E?ՔDt\'��Ë~����Ñ�|\0;?R���W��1�ޗR���}�AE�ܯ�����@8�FƠw�	�B\\�̊i)�\"�\0�
�pf��T	R\"��qPް�f&S5vɃ��UU��B�3�.:b����Bs�枙��
�1�h�f(f�B;j
V\0Q}\'�L�@Zr�ooww��~/R�@\0u�9�)1�i5�u#?S���o����������zcӶ�1@E�@>yp��D��2ϗ2<��gAf��p�}O���Ա�QZ�A���w��>�姂�H���q�/\"��q�
�V\0�t�&���~� D�
�X*u ��A�\0����n�%������T���\"4�

`�8\"dd$T����s��}WTR�ׇӓ��b�1 �N�����t����w�:�X��&�p>:g�ݓ�����_6��g۪��#�;��>1~��ItD�҃���V�8t�7����NS��BT\'��׷wwW�a��TJ&��z�\\.C�j��1�?���E4o�ut���R��(!#�<9�19���Шoտ	!(��U4TL
�u9^o�Q���
��	�E�%}�az�D�U�V�#1����������d�\\�&\"7�=	�e�A�jJ�� <�����8	=X�\'P�y�ۨ�5��8	��l����Z���gU3�l�f��G��z,<e\"��%W:�h0l����ݮ?�����pء�c�rλ�^UW�eӴ�:n1�DCqz	PAF��Z�AU�i�H\\��TUG�L�Իդ�>�wԠ�c5!@`񙭨b� �	5��Uj�D�H`R4�<���v��@3��]io�
��Bu�@񗉹C\0)Zr�/�i��ya��u��nu�}�(�U�e�a���;Q�ZH͂����i
����s�)c�w�]������t�@LR$�l*����v��u�����
�`(�w!BR �\\�EdV[���Y��<��p>�~+d��[I�d���Im�P+�v�g�[�(�w�������( ��*b��<���r������o�l*���Ҡ�9Q)�is��B���<g���՜a��n�\\�9R�0}�l�*�Q��i,��h��|��*�*l؈��d��>��M���v�~w�w�y����?�x��&q�V����Hf0+E.�����~�����t<�	}G
�Kb4ʺ(�a)��ޗ\0���\"�5�&�\0��#��\08\"����&�������p�8uF)��2�<-�0͹�)�a)%����)n���=���l[>��?�~�f���]:X�̊&���2O��DDw��D�Ԋ�a���L��oa�wyO����7B�ˉ�R>�l�*��zՇ�R��K�u�	�l
���w!����O��8�p�O�����?<,��|5\0� �Ԟ�K��s>��PJ����>�k&O(�h��r�=�#B7r�Q�L���Kd�`chֺ�փ*������ۨh��L�\0��32+ZV��|���|���<LӒ�yɫ�\0\0Tt5D�{5�X?gu>^+�jj�
M�fa�ȫ^o���n��&�U�����~��+�-�U��x�ͩ��������?��U��D$*%��s�LMr�,q�Ԥ�D���4�y9���q�G׋�]�덟͒�(%D����P\\��2ϳ�!/S�����.����#��͒��ꊔ���h5��tN�5���WJ�<HT{v��US��,y\\��2.���<L��|���%j�`�K��t��jB��2�s�ʷ�W��M;k�.��{G3cN-ĢQ�Z��l����ʬ�y÷0�������5�j~���\\r��%s������9��T�2S�>D3��
�Z��J�b\\u�w�Ui����@8C=�sF�V-����|G��&]��l\"oZU1���-�<j�E�7ļ:��v�M�4�����%;<�1�u��18ID\0��@���D�����gcJ�Ŗ�<�t]GLs���K��[��\"�9�e^����vww�w������W��H��mx�����7�q`bM�\"z.�{��)pVMU11sr�&�S��Η�}����������.נ����T2f�8���n����+��f���┈�z6b�U���Y�W��/\0B����]��j��b�
��{t�/�1>��
@x+���dT^���V��{�@�l�ƜR*\"�\\�/�*���<�̩�{x�Μ\"�R
CZ�7!�$4˪X
`V3\" t�@
�:�g�s�L�Q�1���|z�����/?NXo���c�`�ɓ;˨O�-ݙ�9�S��l�jtU�\"�*��+镪�.?� )2T��������\'|[��v�Z��2[��,�W?߬����c]�+&�U�جK5�`�}h�\0��ȶX���Q	�I�<�ܔUp]���CU�!FD�ZV۠�,�����]���81X�$���8�@A�Ӭ��R��4��rl���#R\0EĢz�?��������t�Dǻ5�T�$�����	k�>R�kl��ᐐ{�#2�.+\"^Cm\0PZ��H�}��w#\"s��
F�����7b��ݴ?��߯ѷ�\'
INSERT INTO student VALUES("KICTC-CER-010-2020","Abdallah","Hussein","Issa","ELE","TC-ELE","2018","5","kweka10@gmail.com","�PNG

\0\0\0
=V�����g��ʌ��j�i2�N:��\0��[`������_|X�#�f�{����>��5��}�>�G~�����_d�*<��G���?���~&ߵ�\\h�_�X���_��](�<�Hߟ_�_*�����ϴb�a�º?������������z��?Wc�N�>%�[R�|�%��|�C��_s�0�������cA��:ſ�*��?�K���߂R���\'�������|j�=���[�ܹ�?�����ߦ������ݟ���Y��kR����\\���m�O��{�>����M�O�q񹓧�*�T�I3�t�ǝ6C��f�1����(�=oE-�����/��	o����X�w_�n����\'�ʜ�XR*}�����zO)�R���JB����+�\" ���G�[�?>�P\\l�2&8����j�Wn)�����?�����\0KĽ�I��N򧞢�l)����L.4r�y��Z>�2�B�XY��=������D+���2�U��������Z���h�f/���{�.�V�Z�nf���(��6��1��1={�w7�>\'7�\\y����\\y�UW[}���ܤϮ���m��}ϓO9�����8~�M�T���ۯ�q��G����k�?{���F-�������<j鏨�/Rz��5�j��%��)fD,�D�M ��bG�5�N1���g�Q6�$E�֛r{����#r�[���+n�����#rA��7�������͎%|RjQc��x�̃p�|t^>�mZO�{:��9o��E�u���ڸ��=��h-�c��8������
��c�y߸�9�y�w��u���`�3�J��g�F��W��Y{f~��|#&�]�RYm�V�%yc�Dy�j��\\+���󵹺�C�y
G\"��S/�P�f�>��U�����:���]k�d��l[s���zg��-�^\0΍D�K2~��r�ee�L���_m�\"�&�9+U��TI�ZsB���\'�#��:�ȶZ���<��w<���c�@f��e�E���	���젣�Su�ن�ͩ�[[�|ّ��}��}��6Q:��ӡ���N@��Y���|��_(s_(\\��>�y���Kc,kt�\04�P�%�������Yf
���e�L|��r�á��ޑ��ܩrIA�Z�l�2�+�A�ݯ6׫�@�
ЄH�:�\\N��}H�KBzEV���
��j�F���yEѫV .a$���C�2	��b-Y�L��:�.���!�b=\\�J	D��g�2���rC������\0nCW��(z�сڇa�F1����Y�����d�̟к��b�V_h0��\"?|>��+~��|&d�Fc�%q�7����4� �B�B��$�l�L�Rfs\'�F��D����v\0�ʤ�_�?N��|����G_$�2<���ҝ�{T/�l�7�jk��\'k�R@���A�U1.T�ƙՇ�|�Ph�hP��<�!8�176
�F$��S\"uL�n`�p9��>]Lq�2!��m����9q�%�E@��~\0;��,	�MKU#���}EE.ҊĊ�����5o����Rc��q�aMa (?vD�6&������7�C��a�!SIT����e�Y��Q��\\\\���J�[h���p!�R�
���G����nې_&|�#�Zy�%	�꣠���Kw�@M\'X>��\\�i)R�?�o�(q�!$ݨWl���HV�3,�#�����g�1�=CF�>8�T/�B�`�!������52��Z@�:���#�j��ݓ�RK��7����?$>�x3�A!�ToCu���qt!6C�	�M�o��I�-�!�� ����2���?YQ�q�/bC�#3�d���~�*f���α\0�o��A���|�����g�ǣ�6`�mC�B��}�{r���)�Q���OH�2U$�س��%Y�I�yxW,w
s�SPI�E~��-F�a;)�������\0K!��d�9���4E���y �{�2_iJ��%2�!j�h#���^�8-\0�g}��U��0 Kﰀ{�0��!>��ٶ;���D�w��R/��@b�a4*H)r&WC]�O$4:�Ƙ;/\"v���N

��.)=�����s�������MRK
�L��umM�;堞0�&�㤎��
@�\'_s�;�`s:<�Ǉ��^���n
H�9��(۪ޠz���Fv�Įgk2j��*�$�9�3q�?mXRh�N�<! ;�&ȳ���n8d�ii�^�&DP}0�%H�T�u�vmn��pm톏m�j�����^[x���T�v*�T+�v� ������{�1��$��������q~�8JqH:����Q_pwI�ҙf��DEf��\'��_���΁������H��U�&���	M@�Q{-5���
�o���V�kIȡ���t���r���ى��8p�5��sYX7)^��98y�uނ�z�� x\'�/�:��S����nG�P4̜�y�nD4~��dɨ�P�3h_-S�e[y��@�|G�C^�����,{J�q��_RKji�Ѝ4�����Hb��\\���\0f��cj7���R8�A���5�����f�Ȑ� ��d��a��W�d�h�`�CS[����,K�m�M[rQ�����6L�I�f@��}� �E]t`��ȼ��M�˶vd�@�b��\'Y��Թ\\�ٍ2?����D,�y�&���������(Ek��gJL��x���$,0���ڬ2O]��nFuH_n�]��1��X��I�IBP�LH�� �PО8�ut`Z�e?�b���0D�/�Rգɼ�g3���,R]�{��z,n-��hp�C~i�r�@
Q��MyT5DC������htpD;�:1��g3ܠ<{
Kj�K�S��kt�.-⥾s�����|`/��\0*��H�݂�ӽO�rױ�W��X�梠m_7w�.���*�sp�	
��T�x��E������G������T�\"�o�J��a���|�P�`��s[�-PQ��td�Jw1:oI�!+�d\'�3R҈�w>��ڛ;�2
���y���)��A���;�pum+�vuB�=��M#��u�c.qm�tR��9����S`��t�R��p����e��2,��H�������:�x�\\��\'��ʰ_߮i�&�꣬�6��!(�TO�H�&Zs��R�ƣ]H��#kv��̑k��ja������X.����RY��-lD��
��Z�@�:
�uyӉ���ϴ5��{]��3��5\\��������
f�A�e�AG_�!�\'�e�}-N��#b��C�B�Ӻ����j�N��I����o�I\'C�p��e:��WSH<T4Q�ƫoj��	2
��|���.�3!�SA�6tp)/�\'@<P�hzU�6�:��;�+Ȭ(�	��<�,�\".��L�RG�9���-�6,N��=���ur���`��Ч���\'B�FR\"ISa�l���<4��r[�{FE�c�t5AяXu���(����Fw�}p� f�n�iL-��u�\'*
��pB�QA�
{��ǽ(��u[��4��@��Q��ƨi�+
Vd:��۴AK�q.�IN&�:Ȥ�����4�P��A�GǮ7|�v&2��+ȣ�_�jފZ+�,H��h_�IQ�Ĉ��ʻ����c���:��$&K��[r����-ߎ�������s� `�Y\".�:�f������^��\"�����D`n�/a�2R�`�wL_�\0Q�CD�F�����xb�A[��,�W�h05�H����]�Fߎ\"���6����@V��D%�i�<jSY�Š]��
�fr�f?RO��Jd�~��3~p��c��hK�/�$����%(�b��぀:\"�#�����4�s�[�NV l�E�VN���v@��W���w<�x��G����^CY�l	�WǼN�-� ����!�O�n�ڭԠ�4k��(O��@��8\0�T=9�*�ʪ�IuJ\0mR�	*[ª)��^�@����|�
\"���l
�Z�#�Z�����S��\0j�����������ȘƔ0�$�\\���WSwuC�#}P��+GO5\\�~Y��ӵ5	��+4�Ɂ2*j��e{h�$�dH��B� ��!��4ӖrZ�tnX:�Hz뉹�~ Ԣ����Dn�7T������ЌT{�0H���(��I\\����췿����c�:��:��=��R�X(Z����W��\"���G�Ά�Ni(u٤��8���ut�F
a�ȕI�v`�˳&�\0JTe�Z�Ym���P|�S��i:�l��%�\"��&]J�,�8�.�$ʷ��q����`�;c�������ހ�������u1�o˹���+:I�)9�{��4��SK�\"&e^AB
�jk��A���|��������M���hK{�\0th�(���jw3{G9�A��w�.�C��9�,�ɵ�6�{Mo�)HgMm
��A؉1��	�ik�\"^M�81%�`4H����1��z>�1ú����w2�UΤ&ĎG��A�H�(\\m괰�*vG���9Y����bRt�A�#2��.�H��k�t*`����!X�*�B��
v�␡:Yq�*�B�Zu0����G�����b���YWWA�\0qrtRt���Z�xp܏w�w�\0�Qe��5h�mfRI1�_C�#�B藙e�JR�����%x���?G�Z��g�a����S���y�8�ʲJ|N<j����x�ƹ��3�f63G%K�t0+��$q\\�t�r���8k�kݓ�0RЗ��Ns),`D(���*l$h�I������?��%r)䪀�c� �~�?�ݭU���\"I���q>���.Ь;����4O��3p���
<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">
 <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">
  <rdf:Description rdf:about=\"\"
    xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\"
    xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"
    xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\"
    xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"
    xmlns:GIMP=\"http://www.gimp.org/xmp/\"
    xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"
    xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"
   xmpMM:DocumentID=\"gimp:docid:gimp:088f4ab5-f90e-4d25-ab14-372a392d7919\"
   xmpMM:InstanceID=\"xmp.iid:05d686dc-ac06-427e-b822-ed58573343f6\"
   xmpMM:OriginalDocumentID=\"xmp.did:09f20369-4cc6-45a5-a549-8e1752292d7e\"
   GIMP:API=\"2.0\"
   GIMP:Platform=\"Linux\"
   GIMP:TimeStamp=\"1603715713202207\"
   GIMP:Version=\"2.10.22\"
   dc:Format=\"image/png\"
   tiff:Orientation=\"1\"
   xmp:CreatorTool=\"GIMP 2.10\">
   <iptcExt:LocationCreated>
    <rdf:Bag/>
   </iptcExt:LocationCreated>
   <iptcExt:LocationShown>
    <rdf:Bag/>
   </iptcExt:LocationShown>
   <iptcExt:ArtworkOrObject>
    <rdf:Bag/>
   </iptcExt:ArtworkOrObject>
   <iptcExt:RegistryId>
    <rdf:Bag/>
   </iptcExt:RegistryId>
   <xmpMM:History>
    <rdf:Seq>
     <rdf:li
      stEvt:action=\"saved\"
      stEvt:changed=\"/\"
      stEvt:instanceID=\"xmp.iid:279bfb9f-cd80-47bb-b7a1-eb7e1ee5306a\"
      stEvt:softwareAgent=\"Gimp 2.10 (Linux)\"
      stEvt:when=\"+03:00\"/>
    </rdf:Seq>
   </xmpMM:History>
   <plus:ImageSupplier>
    <rdf:Seq/>
   </plus:ImageSupplier>
   <plus:ImageCreator>
    <rdf:Seq/>
   </plus:ImageCreator>
   <plus:CopyrightOwner>
    <rdf:Seq/>
   </plus:CopyrightOwner>
   <plus:Licensor>
    <rdf:Seq/>
   </plus:Licensor>
  </rdf:Description>
 </rdf:RDF>
</x:xmpmeta>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                           
<?xpacket end=\"w\"?>�8?1\0\0\0	pHYs\0\0.#\0\0.#x�?v\0\0\0tIME�
#
`\0�{�\0\0@���@���L���
�, bUU\"c�1.v�4\"��Df�L̽co�Z�i����?bC�O�T�Ww�)�%F�:��49D��C�M�\0(h2�<�E��)�om޼�qacc�����\\�~���X�O=�����#_�����Ǟ���R�%�Fb�9�\0\0u=\0 \0��|2(G\0*I���W?<m/3������,|����G�35
!4F04k�ф
��DjI�cD�h�Y����H����FH�1P����񘉥n�QU�?w���޸u��ŋ�}���/̦Sf�
YY�y��6�7n<�������|�����y��f�T7M����EPٝ쭯�=��cO=���虝��g�a9��?|��7�;s�ʇ׏;���������/�Է��VMj���us{k��׎��`n�\0@�_��G;ʠ� �����M�4���\"b��\0M���+Wnܸ�4�����o������̙3[��M�0Ҡ�<�$I�Rcu5U���������������|>����Dt���i�z뭷�~�֭��X�z��>|����g����~��o����ڹ���L���w����W���Ǿ��0�\0��)*��!�~��&���#lg�
2A ޿��.]�p�̟.\\�������>}���JJLQ�Ԭj�:���E�\0��O̦{�<,�i���/Ov\'�3��&!�x<�N�Ν;w�ʕ�IY����kT/N��.m�p��hxi��`4,�\\L�=����=���m^�p8�a{�)�A�E,�����K�E[돦hL����<E\0�4[�7nܸ���}���+W?8��ŋ/_���͛dT��|V��\00��UU�Y�q��W��x<����<
EQ�F�BJ����q�����i��\'O~�{����<��O�;q��X�3��}����f��o1�R
!\0���sD���WU����\00�L�,�������lm���TU�����˗/_������s���d2K)!PJi2�M�s�x���\"\"\"������ bB �&�fbf�#HKo-��_���1s��EQ ��eY���2Z?�������_��_?��WcYB3����\0\0��k��_�?�~���o����β���!�Ų����ϙ�
�
j
j
�\0*!�
�HL�@R��C3���a�����>����O<��O>����ה30�+�~����,��\"!���d{+�����ӧO���?��˯\\�r)15��Eb�dfD!D��VS|W)�NY�d�����\"2pF3!�r�
,Hw\0m����\0����\0@LA��XP�$u]C��+��#�Yjj�K��˗/���=�����C����{uI����{������A�ۛ�W\0C�8(�w���o~��s��tq���� O)9u��z>��u-�X\0�������TUZ����gRB\0@3@5$��H�c@��.DBFUU\0RD44D4Tg��u\0PK�|��M���s��i�����K�/_�z��l6+���5\"����D�}>���u�W�W���\"�e	��.]z��Wϟ;[ϫ\"ˋ<2sU�L�ܡ1sJ	��!.`\0�)p7�m�	�\0����F\0T��C�B&`�dD`�(`�d�b
d��d�FF�dHĆ��F�1���s�vI�F��dwgkc�|��<�3_}��yQ��ܽ���|�s+]\\�����nmo���[g�?G���kR�/m�����y�@����R�@��R�^U��!��Y#���AQ@���I�M5�f��H�D�(
?T�l/\0�f��_��O�033�� \"&u�TT�,�A9��f;{�Ddfǎ����V�=����<��7����O|�w��̗@{���G�|�]��\0 D00I��$K
�DD�̒6f�jXiB���!BT@3SP4T4S0A���y�������h��c`\0�VVEDD��\0\0D@Dp�lj����>d� a�I�{3\"Z�!�����&ۓ�`����1��<�g�r�ԃ������i���>Xk��?#H�������Zs�`��z�0��jB��R�/�������^{�իW���SG@=�-����9���_�3R�E�QWh�zx���muQ���X\"�����k�
��_���6d�&�h�^��v$x�5�!x�5��F�\'�ͧ�k~xv0h�f{����|���kkk�ṕ8�~�&!Q�\0�I� ~� qO���[�L�b\0�z6#�|0\0����+���������n޼�e�j��
\02�Эm�菒��L��(����en)��sD�#���m	��]5��ʬ�-��Qq�:�( j�W\0C����t>����7�T�,�I�,;v�ĩS���l�8��\0(`�/9�O�-V8\0�2��mݼy�ܙ�g���?��7oܸQ��p8�
��ЉLդ
��\0�DԜ�Wݷ��f ��ڻ\'��a��HD�C7�t���{�Hg�;��[��NtE<po��i߃�|���~��t>�����uꑇWVVz��|���?�v��`�v�j\0L�˘�SX�\0]D�A�df\0z���_���_��͛7/^����-ڔec���if�}�7U��$�\"�����KZ��pH�ݦ�0J����y���d~\0�D��������<�U�)%�j]׈�j��N�8v�����C=�����O>��O|��j-7s�eE����5���2F\0ؼ~���/��_|��Ku]gYH)�&@]@��4����@��0\0�$3S�?j�����Lc�Wб`���m�ю1��u���c4h��6\0@��*U��63��!��EOd��ht�G{챿�_��Gy���%PM��{��K��Ym��;z���˗/��⋿��s�O���fܟs\'OpAg��
�p�0\"D$Dh���b��~\0��M�^�[��`u��ۘ�������Կ.=�jYdvp��{{{UUu)\\�8��Bp�����h�������[�����᷿��\'NP���/1�g`�3\'�a�������{��g�huuu6��ɓ\'oܸ��D��f��63SѦ!�!x���Rl�Ǎ[8������=���B�eY�e1F_ӭ6��,�\'���\\d�a�������d2!���1dq^���PDf���YL���G}�G?��?��?<����` u���������Ǆ���3�\'��/~������_~�卍�cǎ���looO&���X�4��/6���t#��1��s;������%�2-���@�BOkQN��EUUM�S?�P�bfYFD�@c̲�w�)��i�p.q^@��hꘞN�)����g�y�_��_�����I�Ѫv>C�,��_��G��tue�æ�,7om�������~��Ef>y�$3O�Ӻ�� ƘR�:^)�Ԛ�z�-*��{��w�t.?\00�����N�K�m����]J)�sw%�ʑក��MUy
�(\"����W��=�i5!�!�%�%A
16UB4�L(o����򁧾����~:�2b��Ď{�K����^m��ŏ�\"��nl���o��+/�ڼ	`*ID4y�����!RY[�	�m�Z[?Q7��\"\"�cY!R��t���̎��9��d֡a�d��ی1�y��y1f!�H5�U5�y9������,I�is`��
�<�5)B�4�J�yQ���l>\'\"O��\"����ta�[��M�b�f�����U]s�X�F�i�R2UMZ�&�l2��W\"#Xb&@\0Ѷe\0\0&{�,_,;jm�EI��:�4�����g��isss6�9;CD�e:�(��<�j��J�T�	()�M?D�-8y�G;���`r�����&^c�gE�A�4��̩�,��o�U͘!���QC�R�!��P���B��4&3��$Bv��h����l�|��WF��ɞ~����z\'�JԾ��O��M�P�r�F�K�.���k���֭[��l>�����\"�=��V�1.�Bl�ti)�Υ�\0����.q�q�~��x�rE��Q������:�7�X����sd���-�KR(G��<ω`^���}�q<?~|��
��SUQ10�pm�c/pw_YL����z�ӧO_�vͩ��i�|>/�ё�<:ǋGTv�x���,?�g���I�1�R����L1Ʀi�������d��g	���8]bd�|��h�C�Ѻ�����w���B4��p������Ǐ#�W��X�20U13d�E��;;���a���\0���r���s���������33��z�ci�����J�ٗ��I�#�V��^J;uQW���G9)��r:�������F.���Uw�葩ڔRW��gn�$��LBY�����s�^���`�F�N=��~D�Ʋ������()�^�ׯ_�������O&����Px���Ky�>+y؎�5�ճ�pZ���)�c�o�|��b��aQ�+���NVU���N$����u����q�]���g�c�HG��Y�/�eLI677766N�<i�D4���U�~�0
�=`�u]o\\��ҋ/^�xqgg��δIEQ�1R=�\\wvq	���d���ʍ�+�O)uIK8����G�w��bs��+��EQWG��^c��:F�K/y�Y��(s3��.���ъ4����.]�1*�����ZY9��U������R��fW�^�ӟ�t�ƍ�|��@D�ә���,�ʔ3m����W��/�nغ��%Lt�����.c��З��,��٧#���N�kkk}lu]\"���o�{^r:��>��u��R�Nƨ�X���8��666N=��͛7g���:2`jS�H����� ��7�͛7��_ݺu���5%LMڝ�Y���>������b�u���묠��T\'�E�^���Yf�|����|>^��s2�,��6�ջ��l����ѩ_a<8K)hUU1�s��v7��1,�J�D��%KI����<v�S\\_?���_IMC(ľOu�B߷v4I
L�\\\"�O�>s�̍7���,�M��
.]���~��r8��Y�����[�E$0�
���>��s�{��k��̧���(����Qߕ�[8�MEM�t�6�zʾ����W�\'�;�wU�-�8>4���<,�����.��CDΖ����x���/_��ys����O<�T�eV���Qf��g1\"~��^xᅽ������ޤCwT�ڡr�;���
�p
�1�����]f3Sݯ2��R�g�)1���u�6�����uO���_j�]M}P.�仲�K��#nw̽_q!Si�]^\\Oe2����\'���\'O�E��)�<��!��d�W��ճ�>����`ss30#bX��DQ{Wt� ���K�����8���w�eWt��OG^�>��g�Y�c|$�>�r��f�rH};��]:��xm�@EE\0sw�
�����|�G�7]�h�QD@�՟�gyDF�4\0\0 \0IDAT����S\0�&+���h���Rg�c� �:N��$�i\0U݈+�Wl?�@\0Bh+���=No���:����p��jp�y���-sj����Ò�\0q��y��W>����cȲb�N�1F1

�u�!���\04�g���,���d�-@9����!���\\dY�h%���ͳg�nll;qj:�6\"�kky�s��&51���Z�ig�E����_~y6�����d2�<���q,Q-Khw{0˕~\0��hd��pЎR�6�m����~���b@Āa����w�ŰO���W)_�0ۧ*�7p
�ZQF�ԋ�>N�〮j�W�V=����K�.����O>�i�&�C\0�b���I\\-����[���/vww1��.�u&�v0]j{��w�cչP}�\"[4W�h�����A�������(�<䝖�)�H�����²hOjgSP�$�>��ȼĈ�zo��=Hw����<�2s6p4������������N�Woy�W�e1�O0�s�PD^y�7�|3Ƹ��5�Lʲ�~پ����%x]����Gߎb;��}��WE\0Y�F9���R4wC���L��$������L�;UC�6E���p`j�؎r��L�����G�����v�{;\0`[(SE]�gΜ�L&yY��v���8vuO`ؤV�fww��W^�����	sO���u��#9��Jy������q!�쓓���E�\"�������SLє��2I5���4MS7����t�@,�J5��:$މ���\0`Ԇl\0j����f�>�\'z��y���G񪺽�}���o|�	1��<w����Gմi��,Eeoo�Y�U�j<�l6��z0����nׂ�ā�ڰ��C�D�B(�|72�~P�
$���:B�J$n�B�B��uIM#u
q֤�Y�RMj�*�H��ϛ��6R�@XpfK�z�)