-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_warehouse
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('c58a8d78-6cc6-11ee-ac98-48a47209a1e7',1,'D:\\project\\warehouse\\warehouse-backend\\target\\classes\\processes\\test2.bpmn20.xml','c58a6667-6cc6-11ee-ac98-48a47209a1e7',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\r\n  <process id=\"test2\" name=\"test2\" isExecutable=\"true\">\r\n    <startEvent id=\"sid-1e09c08d-3f2b-4fe1-9e08-ac8928a24079\"/>\r\n    <userTask id=\"sid-001\" name=\"合同确认\" activiti:assignee=\"supper_manage\"/>\r\n    <sequenceFlow id=\"sid-f2266cbf-1832-444c-8557-8c2c63cb9e4c\" sourceRef=\"sid-1e09c08d-3f2b-4fe1-9e08-ac8928a24079\" targetRef=\"sid-001\"/>\r\n    <exclusiveGateway id=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\"/>\r\n    <sequenceFlow id=\"sid-85a068be-7050-495a-adf8-a6d3274c50b5\" sourceRef=\"sid-001\" targetRef=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\"/>\r\n    <sequenceFlow id=\"sid-07ed102e-5c07-4b3d-8ea7-a7f5084131ed\" sourceRef=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\" targetRef=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\" name=\"状态为0，不需要采购\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">${status&lt;1}</conditionExpression>\r\n    </sequenceFlow>\r\n    <userTask id=\"sid-03\" name=\"采购确认\" activiti:assignee=\"purchase_man\"/>\r\n    <sequenceFlow id=\"sid-3336c44f-efd1-46d6-8936-5898eda984fc\" sourceRef=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\" targetRef=\"sid-03\" name=\"状态为1，需要采购\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">${status&gt;0}</conditionExpression>\r\n    </sequenceFlow>\r\n    <userTask id=\"sid-04\" name=\"入库确认\" activiti:assignee=\"in_store\"/>\r\n    <userTask id=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\" name=\"出库确认\" activiti:assignee=\"out_store\"/>\r\n    <sequenceFlow id=\"sid-f8134f82-5c6e-4e1d-95db-6711258ab146\" sourceRef=\"sid-03\" targetRef=\"sid-04\"/>\r\n    <sequenceFlow id=\"sid-a1ef8239-1c5c-4fc3-89c0-59f1ce4935a4\" sourceRef=\"sid-04\" targetRef=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\"/>\r\n    <userTask id=\"sid-84446ab7-1ca8-44ce-9758-41116ac6c93d\" name=\"生产确认\" activiti:assignee=\"supper_manage\"/>\r\n    <sequenceFlow id=\"sid-a19e4b01-c0c9-481c-a0a7-33b019b1eacc\" sourceRef=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\" targetRef=\"sid-84446ab7-1ca8-44ce-9758-41116ac6c93d\"/>\r\n    <endEvent id=\"sid-62652f38-4a57-4de4-814d-0238e76e9684\"/>\r\n    <sequenceFlow id=\"sid-d451b9b6-f941-40f5-8d9d-fb0e8284da6f\" sourceRef=\"sid-84446ab7-1ca8-44ce-9758-41116ac6c93d\" targetRef=\"sid-0cf982c9-1429-49c3-bd13-baf82b13c441\"/>\r\n    <userTask id=\"sid-0cf982c9-1429-49c3-bd13-baf82b13c441\" name=\"结算确认\" activiti:assignee=\"supper_manage\"/>\r\n    <sequenceFlow id=\"sid-36990bdc-9b68-4224-bfe1-53b32d21ccbe\" sourceRef=\"sid-0cf982c9-1429-49c3-bd13-baf82b13c441\" targetRef=\"sid-62652f38-4a57-4de4-814d-0238e76e9684\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test2\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"test2\" id=\"BPMNPlane_test2\">\r\n      <bpmndi:BPMNShape id=\"shape-eb913ff1-5b45-4637-b9ac-05ee88293705\" bpmnElement=\"sid-1e09c08d-3f2b-4fe1-9e08-ac8928a24079\">\r\n        <omgdc:Bounds x=\"0.0\" y=\"-75.0\" width=\"30.0\" height=\"30.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape id=\"shape-e885664f-e517-4061-8000-9f99bcca5661\" bpmnElement=\"sid-001\">\r\n        <omgdc:Bounds x=\"-35.0\" y=\"-15.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-474d8589-7cea-41a9-9c9c-91b4bb177409\" bpmnElement=\"sid-f2266cbf-1832-444c-8557-8c2c63cb9e4c\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"-45.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"-15.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-a98ebdf3-89d7-4de4-89d7-112688535da2\" bpmnElement=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\">\r\n        <omgdc:Bounds x=\"-5.0\" y=\"110.0\" width=\"40.0\" height=\"40.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-4494a9c3-a064-4b7e-943a-fb28bb59a6dd\" bpmnElement=\"sid-85a068be-7050-495a-adf8-a6d3274c50b5\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"110.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-e2722641-0337-461d-b87d-8db8b656b49f\" bpmnElement=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\">\r\n        <omgdc:Bounds x=\"-35.0\" y=\"430.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-b3246a6e-2351-4ddd-9720-ba4090c6ccfb\" bpmnElement=\"sid-07ed102e-5c07-4b3d-8ea7-a7f5084131ed\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"150.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"430.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-49fa569c-24d4-44d9-98c5-ae8878a45a83\" bpmnElement=\"sid-03\">\r\n        <omgdc:Bounds x=\"155.0\" y=\"205.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-f488e788-9e2c-4e9b-a416-45a5b1456113\" bpmnElement=\"sid-3336c44f-efd1-46d6-8936-5898eda984fc\">\r\n        <omgdi:waypoint x=\"35.0\" y=\"130.0\"/>\r\n        <omgdi:waypoint x=\"155.0\" y=\"225.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-65c37638-4c19-4758-b623-ca3a25b0e34d\" bpmnElement=\"sid-04\">\r\n        <omgdc:Bounds x=\"155.0\" y=\"390.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-8bb5b775-67a2-4bee-9daf-4e315f3e52a0\" bpmnElement=\"sid-f8134f82-5c6e-4e1d-95db-6711258ab146\">\r\n        <omgdi:waypoint x=\"205.0\" y=\"285.0\"/>\r\n        <omgdi:waypoint x=\"205.0\" y=\"390.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge id=\"edge-8883547e-90df-4cbe-a5f6-a9115e753bd7\" bpmnElement=\"sid-a1ef8239-1c5c-4fc3-89c0-59f1ce4935a4\">\r\n        <omgdi:waypoint x=\"155.0\" y=\"450.0\"/>\r\n        <omgdi:waypoint x=\"65.0\" y=\"450.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-29428fe0-b1df-4c25-b156-b2a2a8f8c8e6\" bpmnElement=\"sid-84446ab7-1ca8-44ce-9758-41116ac6c93d\">\r\n        <omgdc:Bounds x=\"-35.0\" y=\"585.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-9ce9d85c-1051-4c0e-b868-0af7c2ebc492\" bpmnElement=\"sid-a19e4b01-c0c9-481c-a0a7-33b019b1eacc\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"510.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"585.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-160de2f7-aac4-4c76-889f-5e016c43a008\" bpmnElement=\"sid-62652f38-4a57-4de4-814d-0238e76e9684\">\r\n        <omgdc:Bounds x=\"0.0\" y=\"885.0\" width=\"30.0\" height=\"30.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-967dbe17-1458-494c-9b9f-1b3f8d6216ce\" bpmnElement=\"sid-d451b9b6-f941-40f5-8d9d-fb0e8284da6f\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"665.0\"/>\r\n        <omgdi:waypoint x=\"14.999985\" y=\"725.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-c876b611-831b-4419-a251-6e65d64332a1\" bpmnElement=\"sid-0cf982c9-1429-49c3-bd13-baf82b13c441\">\r\n        <omgdc:Bounds x=\"-35.0\" y=\"735.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-344e4609-9949-4b8c-86cc-3731347f354f\" bpmnElement=\"sid-36990bdc-9b68-4224-bfe1-53b32d21ccbe\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"815.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"885.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('d6c6ef3f-6cc6-11ee-8873-48a47209a1e7',1,'/processes/test2.bpmn20.xml','d6c6ef3e-6cc6-11ee-8873-48a47209a1e7',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\r\n  <process id=\"test2\" name=\"test2\" isExecutable=\"true\">\r\n    <startEvent id=\"sid-1e09c08d-3f2b-4fe1-9e08-ac8928a24079\"/>\r\n    <userTask id=\"sid-001\" name=\"合同确认\" activiti:assignee=\"supper_manage\"/>\r\n    <sequenceFlow id=\"sid-f2266cbf-1832-444c-8557-8c2c63cb9e4c\" sourceRef=\"sid-1e09c08d-3f2b-4fe1-9e08-ac8928a24079\" targetRef=\"sid-001\"/>\r\n    <exclusiveGateway id=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\"/>\r\n    <sequenceFlow id=\"sid-85a068be-7050-495a-adf8-a6d3274c50b5\" sourceRef=\"sid-001\" targetRef=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\"/>\r\n    <sequenceFlow id=\"sid-07ed102e-5c07-4b3d-8ea7-a7f5084131ed\" sourceRef=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\" targetRef=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\" name=\"状态为0，不需要采购\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">${status&lt;1}</conditionExpression>\r\n    </sequenceFlow>\r\n    <userTask id=\"sid-03\" name=\"采购确认\" activiti:assignee=\"purchase_man\"/>\r\n    <sequenceFlow id=\"sid-3336c44f-efd1-46d6-8936-5898eda984fc\" sourceRef=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\" targetRef=\"sid-03\" name=\"状态为1，需要采购\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">${status&gt;0}</conditionExpression>\r\n    </sequenceFlow>\r\n    <userTask id=\"sid-04\" name=\"入库确认\" activiti:assignee=\"in_store\"/>\r\n    <userTask id=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\" name=\"出库确认\" activiti:assignee=\"out_store\"/>\r\n    <sequenceFlow id=\"sid-f8134f82-5c6e-4e1d-95db-6711258ab146\" sourceRef=\"sid-03\" targetRef=\"sid-04\"/>\r\n    <sequenceFlow id=\"sid-a1ef8239-1c5c-4fc3-89c0-59f1ce4935a4\" sourceRef=\"sid-04\" targetRef=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\"/>\r\n    <userTask id=\"sid-84446ab7-1ca8-44ce-9758-41116ac6c93d\" name=\"生产确认\" activiti:assignee=\"supper_manage\"/>\r\n    <sequenceFlow id=\"sid-a19e4b01-c0c9-481c-a0a7-33b019b1eacc\" sourceRef=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\" targetRef=\"sid-84446ab7-1ca8-44ce-9758-41116ac6c93d\"/>\r\n    <endEvent id=\"sid-62652f38-4a57-4de4-814d-0238e76e9684\"/>\r\n    <sequenceFlow id=\"sid-d451b9b6-f941-40f5-8d9d-fb0e8284da6f\" sourceRef=\"sid-84446ab7-1ca8-44ce-9758-41116ac6c93d\" targetRef=\"sid-0cf982c9-1429-49c3-bd13-baf82b13c441\"/>\r\n    <userTask id=\"sid-0cf982c9-1429-49c3-bd13-baf82b13c441\" name=\"结算确认\" activiti:assignee=\"supper_manage\"/>\r\n    <sequenceFlow id=\"sid-36990bdc-9b68-4224-bfe1-53b32d21ccbe\" sourceRef=\"sid-0cf982c9-1429-49c3-bd13-baf82b13c441\" targetRef=\"sid-62652f38-4a57-4de4-814d-0238e76e9684\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test2\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"test2\" id=\"BPMNPlane_test2\">\r\n      <bpmndi:BPMNShape id=\"shape-eb913ff1-5b45-4637-b9ac-05ee88293705\" bpmnElement=\"sid-1e09c08d-3f2b-4fe1-9e08-ac8928a24079\">\r\n        <omgdc:Bounds x=\"0.0\" y=\"-75.0\" width=\"30.0\" height=\"30.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape id=\"shape-e885664f-e517-4061-8000-9f99bcca5661\" bpmnElement=\"sid-001\">\r\n        <omgdc:Bounds x=\"-35.0\" y=\"-15.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-474d8589-7cea-41a9-9c9c-91b4bb177409\" bpmnElement=\"sid-f2266cbf-1832-444c-8557-8c2c63cb9e4c\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"-45.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"-15.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-a98ebdf3-89d7-4de4-89d7-112688535da2\" bpmnElement=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\">\r\n        <omgdc:Bounds x=\"-5.0\" y=\"110.0\" width=\"40.0\" height=\"40.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-4494a9c3-a064-4b7e-943a-fb28bb59a6dd\" bpmnElement=\"sid-85a068be-7050-495a-adf8-a6d3274c50b5\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"110.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-e2722641-0337-461d-b87d-8db8b656b49f\" bpmnElement=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\">\r\n        <omgdc:Bounds x=\"-35.0\" y=\"430.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-b3246a6e-2351-4ddd-9720-ba4090c6ccfb\" bpmnElement=\"sid-07ed102e-5c07-4b3d-8ea7-a7f5084131ed\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"150.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"430.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-49fa569c-24d4-44d9-98c5-ae8878a45a83\" bpmnElement=\"sid-03\">\r\n        <omgdc:Bounds x=\"155.0\" y=\"205.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-f488e788-9e2c-4e9b-a416-45a5b1456113\" bpmnElement=\"sid-3336c44f-efd1-46d6-8936-5898eda984fc\">\r\n        <omgdi:waypoint x=\"35.0\" y=\"130.0\"/>\r\n        <omgdi:waypoint x=\"155.0\" y=\"225.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-65c37638-4c19-4758-b623-ca3a25b0e34d\" bpmnElement=\"sid-04\">\r\n        <omgdc:Bounds x=\"155.0\" y=\"390.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-8bb5b775-67a2-4bee-9daf-4e315f3e52a0\" bpmnElement=\"sid-f8134f82-5c6e-4e1d-95db-6711258ab146\">\r\n        <omgdi:waypoint x=\"205.0\" y=\"285.0\"/>\r\n        <omgdi:waypoint x=\"205.0\" y=\"390.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge id=\"edge-8883547e-90df-4cbe-a5f6-a9115e753bd7\" bpmnElement=\"sid-a1ef8239-1c5c-4fc3-89c0-59f1ce4935a4\">\r\n        <omgdi:waypoint x=\"155.0\" y=\"450.0\"/>\r\n        <omgdi:waypoint x=\"65.0\" y=\"450.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-29428fe0-b1df-4c25-b156-b2a2a8f8c8e6\" bpmnElement=\"sid-84446ab7-1ca8-44ce-9758-41116ac6c93d\">\r\n        <omgdc:Bounds x=\"-35.0\" y=\"585.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-9ce9d85c-1051-4c0e-b868-0af7c2ebc492\" bpmnElement=\"sid-a19e4b01-c0c9-481c-a0a7-33b019b1eacc\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"510.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"585.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-160de2f7-aac4-4c76-889f-5e016c43a008\" bpmnElement=\"sid-62652f38-4a57-4de4-814d-0238e76e9684\">\r\n        <omgdc:Bounds x=\"0.0\" y=\"885.0\" width=\"30.0\" height=\"30.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-967dbe17-1458-494c-9b9f-1b3f8d6216ce\" bpmnElement=\"sid-d451b9b6-f941-40f5-8d9d-fb0e8284da6f\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"665.0\"/>\r\n        <omgdi:waypoint x=\"14.999985\" y=\"725.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-c876b611-831b-4419-a251-6e65d64332a1\" bpmnElement=\"sid-0cf982c9-1429-49c3-bd13-baf82b13c441\">\r\n        <omgdc:Bounds x=\"-35.0\" y=\"735.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-344e4609-9949-4b8c-86cc-3731347f354f\" bpmnElement=\"sid-36990bdc-9b68-4224-bfe1-53b32d21ccbe\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"815.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"885.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','false',1),('next.dbid','1',1),('schema.history','create(7.0.0.0)',1),('schema.version','7.0.0.0',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
INSERT INTO `act_hi_actinst` VALUES ('187b9cb0-6cc7-11ee-8577-48a47209a1e7','test2:1:c5a76449-6cc6-11ee-ac98-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7','187b4f8f-6cc7-11ee-8577-48a47209a1e7','sid-1e09c08d-3f2b-4fe1-9e08-ac8928a24079',NULL,NULL,NULL,'startEvent',NULL,'2023-10-17 16:28:06.011','2023-10-17 16:28:06.015',4,NULL,''),('187cae21-6cc7-11ee-8577-48a47209a1e7','test2:1:c5a76449-6cc6-11ee-ac98-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7','187b4f8f-6cc7-11ee-8577-48a47209a1e7','sid-001','187f1f22-6cc7-11ee-8577-48a47209a1e7',NULL,'合同确认','userTask','supper_manage','2023-10-17 16:28:06.018','2023-10-17 16:28:06.174',156,NULL,''),('18947be4-6cc7-11ee-8577-48a47209a1e7','test2:1:c5a76449-6cc6-11ee-ac98-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7','187b4f8f-6cc7-11ee-8577-48a47209a1e7','sid-38ca953b-2358-448d-a355-a4f5994269d8',NULL,NULL,NULL,'exclusiveGateway',NULL,'2023-10-17 16:28:06.174','2023-10-17 16:28:06.195',21,NULL,''),('1897fe55-6cc7-11ee-8577-48a47209a1e7','test2:1:c5a76449-6cc6-11ee-ac98-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7','187b4f8f-6cc7-11ee-8577-48a47209a1e7','sid-03','1897fe56-6cc7-11ee-8577-48a47209a1e7',NULL,'采购确认','userTask','purchase_man','2023-10-17 16:28:06.197','2023-10-17 16:31:14.349',188152,NULL,''),('5a29291b-6cc8-11ee-8577-48a47209a1e7','test2:1:c5a76449-6cc6-11ee-ac98-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7','187b4f8f-6cc7-11ee-8577-48a47209a1e7','sid-c4db8201-27cd-4c94-b5e0-a4c32be06784','5a29773c-6cc8-11ee-8577-48a47209a1e7',NULL,'出库确认','userTask','out_store','2023-10-17 16:37:05.697','2023-10-17 16:41:02.161',236464,NULL,''),('88bddce8-6cc7-11ee-8577-48a47209a1e7','test2:1:c5a76449-6cc6-11ee-ac98-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7','187b4f8f-6cc7-11ee-8577-48a47209a1e7','sid-04','88bddce9-6cc7-11ee-8577-48a47209a1e7',NULL,'入库确认','userTask','in_store','2023-10-17 16:31:14.350','2023-10-17 16:37:05.696',351346,NULL,''),('e71b294e-6cc8-11ee-8577-48a47209a1e7','test2:1:c5a76449-6cc6-11ee-ac98-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7','187b4f8f-6cc7-11ee-8577-48a47209a1e7','sid-84446ab7-1ca8-44ce-9758-41116ac6c93d','e71bc58f-6cc8-11ee-8577-48a47209a1e7',NULL,'生产确认','userTask','supper_manage','2023-10-17 16:41:02.164',NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
INSERT INTO `act_hi_detail` VALUES ('187ada54-6cc7-11ee-8577-48a47209a1e7','VariableUpdate','187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,NULL,'produce_man','string',0,'2023-10-17 16:28:06.006',NULL,NULL,NULL,'produce_man',NULL),('187b2876-6cc7-11ee-8577-48a47209a1e7','VariableUpdate','187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,NULL,'purchase_man','string',0,'2023-10-17 16:28:06.008',NULL,NULL,NULL,'purchase_man',NULL),('187b2878-6cc7-11ee-8577-48a47209a1e7','VariableUpdate','187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,NULL,'in_store','string',0,'2023-10-17 16:28:06.008',NULL,NULL,NULL,'in_store',NULL),('187b287a-6cc7-11ee-8577-48a47209a1e7','VariableUpdate','187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,NULL,'supper_manage','string',0,'2023-10-17 16:28:06.008',NULL,NULL,NULL,'supper_manage',NULL),('187b287c-6cc7-11ee-8577-48a47209a1e7','VariableUpdate','187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,NULL,'out_store','string',0,'2023-10-17 16:28:06.008',NULL,NULL,NULL,'out_store',NULL),('187b287e-6cc7-11ee-8577-48a47209a1e7','VariableUpdate','187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,NULL,'status','integer',0,'2023-10-17 16:28:06.008',NULL,NULL,1,'1',NULL);
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
INSERT INTO `act_hi_identitylink` VALUES ('187f4633-6cc7-11ee-8577-48a47209a1e7',NULL,'participant','supper_manage',NULL,'187a6522-6cc7-11ee-8577-48a47209a1e7'),('18984c77-6cc7-11ee-8577-48a47209a1e7',NULL,'participant','purchase_man',NULL,'187a6522-6cc7-11ee-8577-48a47209a1e7'),('5a2a137d-6cc8-11ee-8577-48a47209a1e7',NULL,'participant','out_store',NULL,'187a6522-6cc7-11ee-8577-48a47209a1e7'),('88be792a-6cc7-11ee-8577-48a47209a1e7',NULL,'participant','in_store',NULL,'187a6522-6cc7-11ee-8577-48a47209a1e7');
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
INSERT INTO `act_hi_procinst` VALUES ('187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,'test2:1:c5a76449-6cc6-11ee-ac98-48a47209a1e7','2023-10-17 16:28:06.003',NULL,NULL,NULL,'sid-1e09c08d-3f2b-4fe1-9e08-ac8928a24079',NULL,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
INSERT INTO `act_hi_taskinst` VALUES ('187f1f22-6cc7-11ee-8577-48a47209a1e7','test2:1:c5a76449-6cc6-11ee-ac98-48a47209a1e7','sid-001','187a6522-6cc7-11ee-8577-48a47209a1e7','187b4f8f-6cc7-11ee-8577-48a47209a1e7','合同确认',NULL,NULL,NULL,'supper_manage','2023-10-17 16:28:06.035',NULL,'2023-10-17 16:28:06.163',128,NULL,50,NULL,NULL,NULL,''),('1897fe56-6cc7-11ee-8577-48a47209a1e7','test2:1:c5a76449-6cc6-11ee-ac98-48a47209a1e7','sid-03','187a6522-6cc7-11ee-8577-48a47209a1e7','187b4f8f-6cc7-11ee-8577-48a47209a1e7','采购确认',NULL,NULL,NULL,'purchase_man','2023-10-17 16:28:06.197',NULL,'2023-10-17 16:31:14.339',188142,NULL,50,NULL,NULL,NULL,''),('5a29773c-6cc8-11ee-8577-48a47209a1e7','test2:1:c5a76449-6cc6-11ee-ac98-48a47209a1e7','sid-c4db8201-27cd-4c94-b5e0-a4c32be06784','187a6522-6cc7-11ee-8577-48a47209a1e7','187b4f8f-6cc7-11ee-8577-48a47209a1e7','出库确认',NULL,NULL,NULL,'out_store','2023-10-17 16:37:05.699',NULL,'2023-10-17 16:41:02.147',236448,NULL,50,NULL,NULL,NULL,''),('88bddce9-6cc7-11ee-8577-48a47209a1e7','test2:1:c5a76449-6cc6-11ee-ac98-48a47209a1e7','sid-04','187a6522-6cc7-11ee-8577-48a47209a1e7','187b4f8f-6cc7-11ee-8577-48a47209a1e7','入库确认',NULL,NULL,NULL,'in_store','2023-10-17 16:31:14.350',NULL,'2023-10-17 16:37:05.683',351333,NULL,50,NULL,NULL,NULL,''),('e71bc58f-6cc8-11ee-8577-48a47209a1e7','test2:1:c5a76449-6cc6-11ee-ac98-48a47209a1e7','sid-84446ab7-1ca8-44ce-9758-41116ac6c93d','187a6522-6cc7-11ee-8577-48a47209a1e7','187b4f8f-6cc7-11ee-8577-48a47209a1e7','生产确认',NULL,NULL,NULL,'supper_manage','2023-10-17 16:41:02.168',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
INSERT INTO `act_hi_varinst` VALUES ('187ada53-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,'produce_man','string',0,NULL,NULL,NULL,'produce_man',NULL,'2023-10-17 16:28:06.006','2023-10-17 16:28:06.006'),('187b2875-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,'purchase_man','string',0,NULL,NULL,NULL,'purchase_man',NULL,'2023-10-17 16:28:06.008','2023-10-17 16:28:06.008'),('187b2877-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,'in_store','string',0,NULL,NULL,NULL,'in_store',NULL,'2023-10-17 16:28:06.008','2023-10-17 16:28:06.008'),('187b2879-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,'supper_manage','string',0,NULL,NULL,NULL,'supper_manage',NULL,'2023-10-17 16:28:06.008','2023-10-17 16:28:06.008'),('187b287b-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,'out_store','string',0,NULL,NULL,NULL,'out_store',NULL,'2023-10-17 16:28:06.008','2023-10-17 16:28:06.008'),('187b287d-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,'status','integer',0,NULL,NULL,1,'1',NULL,'2023-10-17 16:28:06.008','2023-10-17 16:28:06.008');
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('c58a6667-6cc6-11ee-ac98-48a47209a1e7','SpringAutoDeployment',NULL,NULL,'','2023-10-17 08:25:46.853',NULL),('d6c6ef3e-6cc6-11ee-8873-48a47209a1e7',NULL,NULL,NULL,'','2023-10-17 08:26:15.775',NULL);
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('test2:1:c5a76449-6cc6-11ee-ac98-48a47209a1e7',1,'http://www.activiti.org/processdef','test2','test2',1,'c58a6667-6cc6-11ee-ac98-48a47209a1e7','D:\\project\\warehouse\\warehouse-backend\\target\\classes\\processes\\test2.bpmn20.xml',NULL,NULL,0,1,1,'',NULL),('test2:2:d6f55240-6cc6-11ee-8873-48a47209a1e7',1,'http://www.activiti.org/processdef','test2','test2',2,'d6c6ef3e-6cc6-11ee-8873-48a47209a1e7','/processes/test2.bpmn20.xml',NULL,NULL,0,1,1,'',NULL);
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_deadletter_job`
--

DROP TABLE IF EXISTS `act_ru_deadletter_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_deadletter_job`
--

LOCK TABLES `act_ru_deadletter_job` WRITE;
/*!40000 ALTER TABLE `act_ru_deadletter_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_deadletter_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint DEFAULT NULL,
  `IS_CONCURRENT_` tinyint DEFAULT NULL,
  `IS_SCOPE_` tinyint DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint DEFAULT NULL,
  `IS_MI_ROOT_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `CACHED_ENT_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int DEFAULT NULL,
  `TASK_COUNT_` int DEFAULT NULL,
  `JOB_COUNT_` int DEFAULT NULL,
  `TIMER_JOB_COUNT_` int DEFAULT NULL,
  `SUSP_JOB_COUNT_` int DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `ID_LINK_COUNT_` int DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
INSERT INTO `act_ru_execution` VALUES ('187a6522-6cc7-11ee-8577-48a47209a1e7',1,'187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,NULL,'test2:1:c5a76449-6cc6-11ee-ac98-48a47209a1e7',NULL,'187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,1,0,1,0,0,1,NULL,'',NULL,'2023-10-17 16:28:06.003',NULL,NULL,0,0,0,0,0,0,0,0,0),('187b4f8f-6cc7-11ee-8577-48a47209a1e7',5,'187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,'187a6522-6cc7-11ee-8577-48a47209a1e7','test2:1:c5a76449-6cc6-11ee-ac98-48a47209a1e7',NULL,'187a6522-6cc7-11ee-8577-48a47209a1e7','sid-84446ab7-1ca8-44ce-9758-41116ac6c93d',1,0,0,0,0,1,NULL,'',NULL,'2023-10-17 16:28:06.009',NULL,NULL,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
INSERT INTO `act_ru_identitylink` VALUES ('187f4633-6cc7-11ee-8577-48a47209a1e7',1,NULL,'participant','supper_manage',NULL,'187a6522-6cc7-11ee-8577-48a47209a1e7',NULL),('18984c77-6cc7-11ee-8577-48a47209a1e7',1,NULL,'participant','purchase_man',NULL,'187a6522-6cc7-11ee-8577-48a47209a1e7',NULL),('5a2a137d-6cc8-11ee-8577-48a47209a1e7',1,NULL,'participant','out_store',NULL,'187a6522-6cc7-11ee-8577-48a47209a1e7',NULL),('88be792a-6cc7-11ee-8577-48a47209a1e7',1,NULL,'participant','in_store',NULL,'187a6522-6cc7-11ee-8577-48a47209a1e7',NULL);
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_integration`
--

DROP TABLE IF EXISTS `act_ru_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_integration` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `FLOW_NODE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_DATE_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_INT_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_INT_PROC_INST` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_INT_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_INT_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_INT_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_INT_PROC_INST` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_integration`
--

LOCK TABLES `act_ru_integration` WRITE;
/*!40000 ALTER TABLE `act_ru_integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_suspended_job`
--

DROP TABLE IF EXISTS `act_ru_suspended_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_suspended_job`
--

LOCK TABLES `act_ru_suspended_job` WRITE;
/*!40000 ALTER TABLE `act_ru_suspended_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_suspended_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
INSERT INTO `act_ru_task` VALUES ('e71bc58f-6cc8-11ee-8577-48a47209a1e7',1,'187b4f8f-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7','test2:1:c5a76449-6cc6-11ee-ac98-48a47209a1e7','生产确认',NULL,NULL,'sid-84446ab7-1ca8-44ce-9758-41116ac6c93d',NULL,'supper_manage',NULL,50,'2023-10-17 08:41:02.164',NULL,NULL,1,'',NULL,NULL);
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_timer_job`
--

DROP TABLE IF EXISTS `act_ru_timer_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_timer_job`
--

LOCK TABLES `act_ru_timer_job` WRITE;
/*!40000 ALTER TABLE `act_ru_timer_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_timer_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
INSERT INTO `act_ru_variable` VALUES ('187ada53-6cc7-11ee-8577-48a47209a1e7',1,'string','produce_man','187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,NULL,NULL,NULL,'produce_man',NULL),('187b2875-6cc7-11ee-8577-48a47209a1e7',1,'string','purchase_man','187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,NULL,NULL,NULL,'purchase_man',NULL),('187b2877-6cc7-11ee-8577-48a47209a1e7',1,'string','in_store','187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,NULL,NULL,NULL,'in_store',NULL),('187b2879-6cc7-11ee-8577-48a47209a1e7',1,'string','supper_manage','187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,NULL,NULL,NULL,'supper_manage',NULL),('187b287b-6cc7-11ee-8577-48a47209a1e7',1,'string','out_store','187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,NULL,NULL,NULL,'out_store',NULL),('187b287d-6cc7-11ee-8577-48a47209a1e7',1,'integer','status','187a6522-6cc7-11ee-8577-48a47209a1e7','187a6522-6cc7-11ee-8577-48a47209a1e7',NULL,NULL,NULL,1,'1',NULL);
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_info`
--

DROP TABLE IF EXISTS `auth_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_info` (
  `auth_id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL COMMENT '父id为空或为0，表示一级权限',
  `auth_name` varchar(100) DEFAULT NULL,
  `auth_desc` varchar(300) DEFAULT NULL,
  `auth_grade` int DEFAULT NULL,
  `auth_type` char(1) DEFAULT NULL COMMENT '1 模块 、2  列表、 3  按钮',
  `auth_url` varchar(100) DEFAULT NULL,
  `auth_code` varchar(100) DEFAULT NULL,
  `auth_order` int DEFAULT NULL,
  `auth_state` char(1) DEFAULT '1' COMMENT '1 启用 、0 禁用',
  `create_by` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_info`
--

LOCK TABLES `auth_info` WRITE;
/*!40000 ALTER TABLE `auth_info` DISABLE KEYS */;
INSERT INTO `auth_info` VALUES (1,0,'用户管理','用户管理',1,'1',NULL,NULL,0,'1',1,'2017-11-14 16:54:13',1,'2017-11-14 16:54:17'),(2,1,'用户列表','用户列表',2,'2','/user/index',NULL,0,'1',1,'2017-11-14 16:56:11',1,'2017-11-14 16:56:15'),(3,2,'添加用户','添加用户',3,'3',NULL,'user-addUser',0,'1',1,'2017-11-14 16:56:59',1,'2017-11-14 16:57:02'),(4,0,'角色管理','角色管理',1,'1',NULL,NULL,0,'1',1,'2017-11-14 16:57:48',1,'2017-11-14 16:57:52'),(5,4,'角色列表','角色列表',2,'2','/role/index',NULL,0,'1',1,'2017-11-14 16:58:47',1,'2017-11-14 16:58:50'),(6,5,'添加角色','添加角色',3,'3',NULL,'role-addRole',0,'1',1,'2017-11-14 16:59:25',1,'2017-11-14 16:59:29'),(7,0,'权限管理','权限管理',1,'1',NULL,NULL,0,'0',1,'2017-11-14 17:00:13',1,'2017-11-14 17:00:18'),(8,7,'权限树','权限树',2,'2','/auth/index',NULL,0,'1',1,'2017-11-14 17:02:11',1,'2017-11-14 17:02:14'),(9,8,'添加权限','添加权限',3,'3',NULL,'auth-addAuth',0,'1',1,'2017-11-14 17:03:48',1,'2017-11-14 17:03:52'),(10,2,'删除用户','删除用户',3,'3','','user-deleteUser',0,'1',1,'2017-11-23 11:56:17',NULL,NULL),(19,0,'订单管理','订单管理',1,'1','','',0,'0',1,'2017-11-23 17:31:08',NULL,NULL),(20,19,'订单列表','订单列表',2,'2','','',0,'0',1,'2017-11-23 17:31:42',NULL,NULL),(21,20,'修改订单','修改订单',3,'3','','updateOrder',0,'0',0,'2017-11-24 14:33:23',NULL,NULL),(22,20,'删除订单','删除订单',3,'3','','auth-delete',0,'0',0,'2017-11-24 14:34:32',NULL,NULL),(23,2,'查询用户','查询用户',3,'3','','user-findUser',0,'1',1,'2017-11-28 10:10:53',NULL,NULL),(24,2,'修改用户','修改用户信息',3,'3','','user-updateUser',0,'1',0,'2017-11-28 10:12:51',NULL,NULL),(25,2,'分配角色','分配角色',3,'3','','user-assignRole',0,'1',1,'2017-11-28 10:15:27',NULL,NULL),(26,2,'更改权限','更改权限',3,'3','','user-updateAuth',0,'1',1,'2017-11-28 10:16:07',NULL,NULL),(27,5,'修改角色','修改角色',3,'3','','role-updateRole',0,'1',1,'2017-11-28 10:16:40',NULL,NULL),(28,5,'查询角色','查询角色',3,'3','','role-findRole',0,'1',1,'2017-11-28 10:17:12',NULL,NULL),(30,5,'删除角色','删除角色',3,'3','','role-deleteRole',0,'1',1,'2017-11-28 10:23:14',NULL,NULL),(31,5,'更改权限','更改权限',3,'3','','role-updateAuth',0,'1',1,'2017-11-28 10:24:35',NULL,NULL),(32,8,'修改权限','修改权限',3,'3','','auth-updateAuth',0,'1',1,'2017-11-28 10:25:08',NULL,NULL),(33,8,'删除权限','删除权限',3,'3',NULL,'auth-deleteAuth',0,'1',0,'2022-03-29 10:10:03',NULL,NULL),(34,8,'恢复权限','恢复权限',3,'3',NULL,'auth-restartAuth',0,'1',0,'2022-03-29 10:10:50',NULL,NULL),(35,2,'修改状态','修改状态',3,'3','','user-updateState',0,'1',1,'2017-11-28 10:49:40',NULL,NULL),(36,2,'重置密码','重置密码',3,'3','','user-resetPwd',0,'1',1,'2017-11-28 10:53:27',NULL,NULL),(37,5,'修改角色状态','修改角色状态',3,'3','','role-updateState',0,'1',1,'2017-11-28 11:12:23',NULL,NULL),(38,19,'订单详情','订单详情',2,'2','','',1,'0',1,'2017-11-29 11:35:57',NULL,NULL),(41,19,'订单分类','订单分类',2,'2','','',1,'0',1,'2017-11-29 11:56:04',NULL,NULL),(42,0,'材料管理','材料管理',1,'1','','',1,'1',1,'2017-11-29 11:56:44',NULL,NULL),(43,38,'查看详情','查看详情',3,'3','','order-selectDetils',1,'0',1,'2017-11-29 11:57:29',NULL,NULL),(44,38,'修改详情','修改详情',3,'3','','order-updateDetils',1,'0',1,'2017-11-29 11:58:36',NULL,NULL),(46,41,'分类','分类',3,'3','','auth-flAuth',1,'0',1,'2017-11-30 15:16:02',NULL,NULL),(50,42,'材料列表','材料列表',2,'2','/commodity/index','',1,'1',1,'2017-12-07 08:47:50',NULL,NULL),(53,0,'采购管理','采购管理',1,'1','','',1,'1',1,'2017-12-11 14:53:02',NULL,NULL),(54,0,'入库管理','入库管理',1,'1','','',1,'1',1,'2017-12-11 14:53:20',NULL,NULL),(55,0,'出库管理','出库管理',1,'1','','',1,'1',1,'2017-12-11 14:53:31',NULL,NULL),(56,53,'采购列表','采购列表',2,'2','/purchase/index','',1,'1',1,'2017-12-11 14:59:11',NULL,NULL),(57,54,'入库列表','入库列表',2,'2','/instore/index','',1,'1',1,'2017-12-11 15:01:27',NULL,NULL),(58,55,'出库列表','出库列表',2,'2','/outstore/index','',1,'1',1,'2017-12-11 15:02:03',NULL,NULL),(69,0,'仓库管理','仓库管理',1,'1','','',1,'1',1,'2017-12-13 14:34:48',NULL,NULL),(70,69,'仓库列表','仓库列表',2,'2','/store/index','',1,'1',1,'2017-12-13 14:36:32',NULL,NULL),(71,68,'调货单列表','调货单列表',2,'2','/transshipment/index',NULL,NULL,'1',NULL,NULL,NULL,NULL),(72,0,'供货商管理','供货商管理',1,'1','','',1,'1',1,'2017-12-13 17:09:36',NULL,NULL),(74,72,'供货商列表','供货商列表',2,'2','/supply/index','',1,'1',1,'2017-12-13 17:10:14',NULL,NULL),(76,42,'材料分类','材料分类',2,'2','/commodity/category','',1,'1',1,'2017-12-14 11:16:38',NULL,NULL),(93,50,'商品查询','商品查询',3,'3','/product/product-page-list','select_product',0,'1',1,'2022-04-22 12:21:37',NULL,NULL),(94,50,'添加商品','添加商品',3,'3','/product/product-add','product-add',0,'1',1,'2022-04-22 12:23:17',NULL,NULL),(95,57,'确定入库','确定入库',3,'3','/instore/instore-confirm','instore-confirm',0,'1',1,'2022-04-22 12:25:36',NULL,NULL),(97,50,'采购','采购',3,'3','/purchase/purchase-add','purchase-add',0,'1',1,'2022-04-22 12:30:42',NULL,NULL),(98,0,'合同管理','合同管理',1,'1',NULL,NULL,0,'1',1,NULL,NULL,NULL),(99,98,'合同列表','合同列表',2,'2','/contract/index',NULL,1,'1',1,'2023-09-19 16:22:53',NULL,NULL),(100,0,'考勤管理','考勤管理',1,'1',NULL,NULL,0,'1',1,NULL,NULL,NULL),(101,100,'考勤列表','考勤列表',2,'2','/attendance/index',NULL,1,'1',1,NULL,NULL,NULL),(102,0,'任务中心','任务中心',1,'1',NULL,NULL,0,'1',NULL,NULL,NULL,NULL),(104,102,'任务列表','任务列表',2,'2','/task/index',NULL,1,'1',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `auth_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_log`
--

DROP TABLE IF EXISTS `bus_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `bus_name` varchar(100) DEFAULT NULL COMMENT '业务名称',
  `bus_descrip` varchar(255) DEFAULT NULL COMMENT '业务操作描述',
  `oper_person` varchar(100) DEFAULT NULL COMMENT '操作人',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `ip_from` varchar(50) DEFAULT NULL COMMENT '操作来源ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 COMMENT='业务操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_log`
--

LOCK TABLES `bus_log` WRITE;
/*!40000 ALTER TABLE `bus_log` DISABLE KEYS */;
INSERT INTO `bus_log` VALUES (89,'登录管理','用户登录','管理员','2023-10-17 15:34:26',NULL),(90,'登录管理','用户注销','管理员','2023-10-17 15:34:37',NULL),(91,'登录管理','用户登录','管理员','2023-10-17 15:34:47',NULL),(92,'登录管理','用户登录','管理员','2023-10-17 15:34:56',NULL),(93,'登录管理','用户注销','管理员','2023-10-17 15:36:47',NULL),(94,'登录管理','用户登录','管理员','2023-10-17 15:36:57',NULL),(95,'登录管理','用户登录','管理员','2023-10-17 15:37:03',NULL),(96,'角色管理','为角色分配权限','管理员','2023-10-17 15:37:16',NULL),(97,'登录管理','用户注销','管理员','2023-10-17 15:37:17',NULL),(98,'登录管理','用户登录','管理员','2023-10-17 15:37:21',NULL),(99,'仓库管理','添加仓库','管理员','2023-10-17 15:43:08',NULL),(100,'仓库管理','修改仓库','管理员','2023-10-17 15:43:20',NULL),(101,'材料管理','添加材料','管理员','2023-10-17 15:50:53',NULL),(102,'材料管理','添加材料','管理员','2023-10-17 15:58:05',NULL),(103,'合同管理','上传合同文件','管理员','2023-10-17 15:59:40',NULL),(104,'合同管理','添加合同','管理员','2023-10-17 15:59:40',NULL),(105,'合同管理','下载合同图片','管理员','2023-10-17 15:59:44',NULL),(106,'合同管理','更新合同','管理员','2023-10-17 16:00:01',NULL),(107,'用户管理','添加用户',NULL,'2023-10-17 16:14:53',NULL),(108,'用户管理','修改用户状态',NULL,'2023-10-17 16:14:54',NULL),(109,'用户管理','分配角色',NULL,'2023-10-17 16:14:58',NULL),(110,'角色管理','为角色分配权限',NULL,'2023-10-17 16:15:07',NULL),(111,'登录管理','用户注销',NULL,'2023-10-17 16:15:10',NULL),(112,'登录管理','用户登录','outadmin','2023-10-17 16:15:16',NULL),(113,'出库管理','添加出库单','outadmin','2023-10-17 16:16:58',NULL),(114,'出库管理','出库单确认','outadmin','2023-10-17 16:17:02',NULL),(115,'登录管理','用户注销','outadmin','2023-10-17 16:17:05',NULL),(116,'登录管理','用户登录','管理员','2023-10-17 16:17:08',NULL),(117,'用户管理','添加用户','管理员','2023-10-17 16:18:04',NULL),(118,'用户管理','修改用户状态','管理员','2023-10-17 16:18:05',NULL),(119,'用户管理','分配角色','管理员','2023-10-17 16:18:10',NULL),(120,'角色管理','为角色分配权限','管理员','2023-10-17 16:18:19',NULL),(121,'用户管理','添加用户','管理员','2023-10-17 16:18:39',NULL),(122,'用户管理','修改用户状态','管理员','2023-10-17 16:18:40',NULL),(123,'用户管理','分配角色','管理员','2023-10-17 16:18:44',NULL),(124,'角色管理','为角色分配权限','管理员','2023-10-17 16:18:56',NULL),(125,'登录管理','用户注销','管理员','2023-10-17 16:19:00',NULL),(126,'登录管理','用户登录','puradmin','2023-10-17 16:19:05',NULL),(127,'登录管理','用户注销','puradmin','2023-10-17 16:19:46',NULL),(128,'登录管理','用户登录','inadmin','2023-10-17 16:19:54',NULL),(129,'登录管理','用户注销','inadmin','2023-10-17 16:20:14',NULL),(130,'登录管理','用户登录','puradmin','2023-10-17 16:20:23',NULL),(131,'登录管理','用户注销','puradmin','2023-10-17 16:20:49',NULL),(132,'登录管理','用户登录','puradmin','2023-10-17 16:24:01',NULL),(133,'登录管理','用户登录','puradmin','2023-10-17 16:24:07',NULL),(134,'登录管理','用户登录','管理员','2023-10-17 16:24:12',NULL),(135,'登录管理','用户登录','管理员','2023-10-17 16:27:26',NULL),(136,'合同管理','上传合同文件','管理员','2023-10-17 16:27:46',NULL),(137,'合同管理','添加合同','管理员','2023-10-17 16:27:46',NULL),(138,'登录管理','用户注销','管理员','2023-10-17 16:28:13',NULL),(139,'登录管理','用户登录','puradmin','2023-10-17 16:28:18',NULL),(140,'登录管理','用户注销','puradmin','2023-10-17 16:29:39',NULL),(141,'登录管理','用户登录','puradmin','2023-10-17 16:29:46',NULL),(142,'登录管理','用户注销','puradmin','2023-10-17 16:29:54',NULL),(143,'登录管理','用户登录','inadmin','2023-10-17 16:29:59',NULL),(144,'登录管理','用户注销','inadmin','2023-10-17 16:30:09',NULL),(145,'登录管理','用户登录','puradmin','2023-10-17 16:30:13',NULL),(146,'登录管理','用户注销','puradmin','2023-10-17 16:31:38',NULL),(147,'登录管理','用户登录','inadmin','2023-10-17 16:31:44',NULL),(148,'登录管理','用户注销','inadmin','2023-10-17 16:31:49',NULL),(149,'登录管理','用户登录','管理员','2023-10-17 16:31:53',NULL),(150,'角色管理','为角色分配权限','管理员','2023-10-17 16:32:05',NULL),(151,'登录管理','用户注销','管理员','2023-10-17 16:32:06',NULL),(152,'登录管理','用户登录','puradmin','2023-10-17 16:32:35',NULL),(153,'登录管理','用户注销','puradmin','2023-10-17 16:33:33',NULL),(154,'登录管理','用户登录','inadmin','2023-10-17 16:33:42',NULL),(155,'登录管理','用户注销','inadmin','2023-10-17 16:35:12',NULL),(156,'登录管理','用户登录','puradmin','2023-10-17 16:35:18',NULL),(157,'登录管理','用户注销','puradmin','2023-10-17 16:36:19',NULL),(158,'登录管理','用户登录','inadmin','2023-10-17 16:36:25',NULL),(159,'入库管理','入库确认','inadmin','2023-10-17 16:37:05',NULL),(160,'登录管理','用户注销','inadmin','2023-10-17 16:37:08',NULL),(161,'登录管理','用户登录','管理员','2023-10-17 16:37:11',NULL),(162,'登录管理','用户注销','管理员','2023-10-17 16:37:16',NULL),(163,'登录管理','用户登录','管理员','2023-10-17 16:37:46',NULL),(164,'登录管理','用户注销','管理员','2023-10-17 16:38:35',NULL),(165,'登录管理','用户登录','outadmin','2023-10-17 16:38:41',NULL),(166,'出库管理','添加出库单','outadmin','2023-10-17 16:40:39',NULL),(167,'出库管理','出库单确认','outadmin','2023-10-17 16:41:02',NULL),(168,'登录管理','用户注销','outadmin','2023-10-17 16:41:05',NULL),(169,'登录管理','用户登录','管理员','2023-10-17 16:41:08',NULL);
/*!40000 ALTER TABLE `bus_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy_list`
--

DROP TABLE IF EXISTS `buy_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy_list` (
  `buy_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `buy_num` int DEFAULT NULL,
  `fact_buy_num` int DEFAULT NULL,
  `buy_time` datetime DEFAULT NULL,
  `supply_id` int DEFAULT NULL,
  `place_id` int DEFAULT NULL,
  `buy_user` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `is_in` char(1) DEFAULT NULL COMMENT '0 否 1 是',
  PRIMARY KEY (`buy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='采购单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_list`
--

LOCK TABLES `buy_list` WRITE;
/*!40000 ALTER TABLE `buy_list` DISABLE KEYS */;
INSERT INTO `buy_list` VALUES (48,33,5,100,100,'2023-10-17 16:19:33',6,NULL,'测试采购','12345678910','1'),(49,33,5,30,30,'2023-10-17 16:20:38',6,NULL,'10','12345678910','1'),(50,33,5,100,90,'2023-10-17 16:28:43',6,NULL,'test','12345678910','1'),(51,33,5,20,NULL,'2023-10-17 16:30:32',6,NULL,'test','12345678910','0');
/*!40000 ALTER TABLE `buy_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkin`
--

DROP TABLE IF EXISTS `checkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `status` tinyint unsigned DEFAULT NULL,
  `risk` int unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin`
--

LOCK TABLES `checkin` WRITE;
/*!40000 ALTER TABLE `checkin` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `contract_id` int NOT NULL AUTO_INCREMENT,
  `contract_name` varchar(100) DEFAULT NULL,
  `contract_desc` varchar(100) DEFAULT NULL,
  `contract_state` char(1) DEFAULT NULL COMMENT '0未审核、1 待结算 、2 结算中、 3 已结算',
  `associated_area` varchar(100) DEFAULT NULL COMMENT '关联工区',
  `files` varchar(500) DEFAULT NULL COMMENT '相关附件',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='合同表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (105,'测试添加合同','测试添加合同','1','测试添加合同','/img/upload//img/upload/OIP.jpg','2023-10-17 15:59:40',NULL),(106,'test','test','1','test','/img/upload/OIP.jpg','2023-10-17 16:27:46',NULL);
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `face_model`
--

DROP TABLE IF EXISTS `face_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `face_model` (
  `id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `face_model` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `face_model`
--

LOCK TABLES `face_model` WRITE;
/*!40000 ALTER TABLE `face_model` DISABLE KEYS */;
INSERT INTO `face_model` VALUES (1,1,'/images/1.jpg');
/*!40000 ALTER TABLE `face_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow`
--

DROP TABLE IF EXISTS `flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flow` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `instance_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '流程实例id',
  `contract_id` int DEFAULT NULL COMMENT '合同id',
  `purchase_id` int DEFAULT NULL COMMENT '采购单id',
  `in_store_id` int DEFAULT NULL COMMENT '入库单id',
  `out_store_id` int DEFAULT NULL COMMENT '出库单id',
  `state` int DEFAULT NULL COMMENT '实例状态：1=进行中，0=已结束',
  `create_time` datetime DEFAULT NULL COMMENT '部署时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow`
--

LOCK TABLES `flow` WRITE;
/*!40000 ALTER TABLE `flow` DISABLE KEYS */;
INSERT INTO `flow` VALUES (32,'187a6522-6cc7-11ee-8577-48a47209a1e7',106,0,0,27,1,'2023-10-17 16:28:06');
/*!40000 ALTER TABLE `flow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidays` (
  `id` int unsigned DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `in_store`
--

DROP TABLE IF EXISTS `in_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_store` (
  `ins_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `in_num` int DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_in` char(1) DEFAULT NULL COMMENT '0 否 1 是',
  PRIMARY KEY (`ins_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='入库单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `in_store`
--

LOCK TABLES `in_store` WRITE;
/*!40000 ALTER TABLE `in_store` DISABLE KEYS */;
INSERT INTO `in_store` VALUES (48,5,33,100,38,'2023-10-17 16:19:42','0'),(49,5,33,30,38,'2023-10-17 16:28:52','0'),(50,5,33,90,39,'2023-10-17 16:36:54','1');
/*!40000 ALTER TABLE `in_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `out_store`
--

DROP TABLE IF EXISTS `out_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `out_store` (
  `outs_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `tally_id` int DEFAULT NULL,
  `out_price` decimal(8,2) DEFAULT NULL,
  `out_num` int DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_out` char(1) DEFAULT NULL COMMENT '0 否 1 是',
  PRIMARY KEY (`outs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='出库单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `out_store`
--

LOCK TABLES `out_store` WRITE;
/*!40000 ALTER TABLE `out_store` DISABLE KEYS */;
INSERT INTO `out_store` VALUES (26,33,5,NULL,NULL,20,37,'2023-10-17 16:16:58','1'),(27,33,5,NULL,NULL,20,37,'2023-10-17 16:40:39','1');
/*!40000 ALTER TABLE `out_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_num` varchar(50) DEFAULT NULL,
  `product_invent` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `supply_id` int DEFAULT NULL,
  `place_id` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `introduce` longtext,
  `up_down_state` char(1) DEFAULT NULL COMMENT '0 下架 1 上架',
  `in_price` decimal(10,2) DEFAULT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `mem_price` decimal(10,2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `imgs` varchar(500) DEFAULT NULL,
  `product_date` datetime DEFAULT NULL,
  `supp_date` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (33,5,NULL,'测试修改材料','test',150,NULL,6,NULL,8,'','0',10.00,10.00,0.00,'2023-10-17 15:50:53','2023-10-17 15:57:37',1,1,'/img/upload/','2023-10-17 08:00:00',NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `type_code` varchar(50) DEFAULT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `type_desc` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='商品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL,
  `role_desc` varchar(300) DEFAULT NULL,
  `role_code` varchar(100) DEFAULT NULL,
  `role_state` char(1) DEFAULT NULL COMMENT '1 启用 0 禁用',
  `create_by` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'管理员','管理员','supper_manage','1',1,'2017-11-14 16:49:12',1,'2017-11-14 16:49:20'),(11,'采购员','采购管理员','purchase_man','1',1,'2022-04-22 12:29:00',1,'2022-04-22 13:56:29'),(12,'入库管理员','入库管理员','in_store','1',1,'2022-04-22 13:56:17',NULL,NULL),(13,'商品','商品管理员','commodity_manager','1',1,'2022-04-22 13:57:42',NULL,NULL),(14,'出库管理员','出库管理员','out_store','1',1,'2022-04-22 14:00:00',NULL,NULL),(15,'调货','调货管理员','transshipment_manager','1',1,'2022-04-22 14:00:38',NULL,NULL),(16,'仓库','仓库管理员','store_manager','1',1,'2022-04-24 15:12:56',NULL,NULL),(17,'生产员','生产员','produce_man','1',1,'2023-10-10 15:41:14',1,'2023-10-10 15:41:21');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_auth`
--

DROP TABLE IF EXISTS `role_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_auth` (
  `role_auth_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `auth_id` int DEFAULT NULL,
  PRIMARY KEY (`role_auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1172 DEFAULT CHARSET=utf8 COMMENT='角色权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_auth`
--

LOCK TABLES `role_auth` WRITE;
/*!40000 ALTER TABLE `role_auth` DISABLE KEYS */;
INSERT INTO `role_auth` VALUES (1099,1,1),(1100,1,2),(1101,1,3),(1102,1,10),(1103,1,23),(1104,1,24),(1105,1,25),(1106,1,26),(1107,1,35),(1108,1,36),(1109,1,4),(1110,1,5),(1111,1,6),(1112,1,27),(1113,1,28),(1114,1,30),(1115,1,31),(1116,1,37),(1117,1,42),(1118,1,50),(1119,1,93),(1120,1,94),(1121,1,97),(1122,1,76),(1123,1,53),(1124,1,56),(1125,1,54),(1126,1,57),(1127,1,95),(1128,1,55),(1129,1,58),(1130,1,69),(1131,1,70),(1132,1,72),(1133,1,74),(1134,1,98),(1135,1,99),(1136,1,100),(1137,1,101),(1138,1,102),(1139,1,104),(1140,14,42),(1141,14,50),(1142,14,93),(1143,14,94),(1144,14,97),(1145,14,76),(1146,14,55),(1147,14,58),(1148,14,102),(1149,14,104),(1150,11,42),(1151,11,50),(1152,11,93),(1153,11,94),(1154,11,97),(1155,11,76),(1156,11,53),(1157,11,56),(1158,11,102),(1159,11,104),(1165,12,53),(1166,12,56),(1167,12,54),(1168,12,57),(1169,12,95),(1170,12,102),(1171,12,104);
/*!40000 ALTER TABLE `role_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `store_name` varchar(100) DEFAULT NULL,
  `store_num` varchar(20) DEFAULT NULL,
  `store_address` varchar(100) DEFAULT NULL,
  `concat` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='仓库表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (5,'测试1','test','测试1','测试','测试');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supply`
--

DROP TABLE IF EXISTS `supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supply` (
  `supply_id` int NOT NULL AUTO_INCREMENT,
  `supply_num` varchar(20) DEFAULT NULL,
  `supply_name` varchar(100) DEFAULT NULL,
  `supply_introduce` longtext,
  `concat` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `is_delete` char(1) DEFAULT '0' COMMENT '0:可用  1:不可用',
  PRIMARY KEY (`supply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='供货商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply`
--

LOCK TABLES `supply` WRITE;
/*!40000 ALTER TABLE `supply` DISABLE KEYS */;
INSERT INTO `supply` VALUES (6,'测试','测试修改供应商','测试','测试','测试','测试','0');
/*!40000 ALTER TABLE `supply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `id` int unsigned DEFAULT NULL,
  `param_key` varchar(200) DEFAULT NULL,
  `param_value` varchar(200) DEFAULT NULL,
  `status` tinyint unsigned DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'attendance_start_time','06:00',1,'上班考勤开始时间'),(2,'attendance_time','08:30',1,'上班时间'),(3,'attendance_end_time','23:59',1,'上班考勤截止时间'),(4,'closing_start_time','16:30',1,'下班考勤开始时间'),(5,'closing_time','17:30',1,'下班时间'),(6,'closing_end_time','23:59',1,'下班考勤截止时间');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit` (
  `unit_id` int NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(20) DEFAULT NULL,
  `unit_desc` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='规格单位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (8,'kg','千克');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_code` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_pwd` varchar(100) DEFAULT NULL,
  `user_type` char(1) DEFAULT NULL COMMENT '1 超级管理员 、 2  管理员 、 3 普通用户',
  `user_state` char(1) DEFAULT NULL COMMENT '0 未审核 、1 已审核',
  `is_delete` char(1) DEFAULT NULL COMMENT '0 正常、 1 已删除',
  `create_by` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'admin','管理员','c431d451c81e75ffac75a640590ed0a1',NULL,'1','0',1,'2017-11-14 15:14:31',1,'2022-04-24 15:33:12'),(37,'outadmin','outadmin','c431d451c81e75ffac75a640590ed0a1',NULL,'1','0',1,'2023-10-17 16:14:53',1,'2023-10-17 16:14:55'),(38,'puradmin','puradmin','c431d451c81e75ffac75a640590ed0a1',NULL,'1','0',1,'2023-10-17 16:18:04',1,'2023-10-17 16:18:06'),(39,'inadmin','inadmin','c431d451c81e75ffac75a640590ed0a1',NULL,'1','0',1,'2023-10-17 16:18:39',1,'2023-10-17 16:18:40');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_role_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='用户角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (60,1,1),(61,14,37),(62,11,38),(63,12,39);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workday`
--

DROP TABLE IF EXISTS `workday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workday` (
  `id` int DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workday`
--

LOCK TABLES `workday` WRITE;
/*!40000 ALTER TABLE `workday` DISABLE KEYS */;
/*!40000 ALTER TABLE `workday` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-17 16:45:21
