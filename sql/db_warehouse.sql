-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_warehouse
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_evt_log`
(
    `LOG_NR_`       bigint       NOT NULL AUTO_INCREMENT,
    `TYPE_`         varchar(64) COLLATE utf8_bin  DEFAULT NULL,
    `PROC_DEF_ID_`  varchar(64) COLLATE utf8_bin  DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin  DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin  DEFAULT NULL,
    `TASK_ID_`      varchar(64) COLLATE utf8_bin  DEFAULT NULL,
    `TIME_STAMP_`   timestamp(3) NOT NULL,
    `USER_ID_`      varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `DATA_`         longblob,
    `LOCK_OWNER_`   varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `LOCK_TIME_`    timestamp(3) NULL             DEFAULT NULL,
    `IS_PROCESSED_` tinyint                       DEFAULT '0',
    PRIMARY KEY (`LOG_NR_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ge_bytearray`
(
    `ID_`            varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_`           int                           DEFAULT NULL,
    `NAME_`          varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin  DEFAULT NULL,
    `BYTES_`         longblob,
    `GENERATED_`     tinyint                       DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
    CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray`
    DISABLE KEYS */;
INSERT INTO `act_ge_bytearray`
VALUES ('8a6d5fe6-69a8-11ee-b65c-48a47209a1e7', 1,
        'D:\\project\\warehouse\\warehouse-backend\\target\\classes\\processes\\test2.bpmn20.xml',
        '8a6d5fe5-69a8-11ee-b65c-48a47209a1e7',
        _binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\r\n  <process id=\"test2\" name=\"test2\" isExecutable=\"true\">\r\n    <startEvent id=\"sid-1e09c08d-3f2b-4fe1-9e08-ac8928a24079\"/>\r\n    <userTask id=\"sid-001\" name=\"合同确认\" activiti:assignee=\"supper_manage\"/>\r\n    <sequenceFlow id=\"sid-f2266cbf-1832-444c-8557-8c2c63cb9e4c\" sourceRef=\"sid-1e09c08d-3f2b-4fe1-9e08-ac8928a24079\" targetRef=\"sid-001\"/>\r\n    <exclusiveGateway id=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\"/>\r\n    <sequenceFlow id=\"sid-85a068be-7050-495a-adf8-a6d3274c50b5\" sourceRef=\"sid-001\" targetRef=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\"/>\r\n    <sequenceFlow id=\"sid-07ed102e-5c07-4b3d-8ea7-a7f5084131ed\" sourceRef=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\" targetRef=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\" name=\"状态为0，不需要采购\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">${status&lt;1}</conditionExpression>\r\n    </sequenceFlow>\r\n    <userTask id=\"sid-03\" name=\"采购确认\" activiti:assignee=\"purchase_man\"/>\r\n    <sequenceFlow id=\"sid-3336c44f-efd1-46d6-8936-5898eda984fc\" sourceRef=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\" targetRef=\"sid-03\" name=\"状态为1，需要采购\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">${status&gt;0}</conditionExpression>\r\n    </sequenceFlow>\r\n    <userTask id=\"sid-04\" name=\"入库确认\" activiti:assignee=\"in_store\"/>\r\n    <userTask id=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\" name=\"出库确认\" activiti:assignee=\"out_store\"/>\r\n    <sequenceFlow id=\"sid-f8134f82-5c6e-4e1d-95db-6711258ab146\" sourceRef=\"sid-03\" targetRef=\"sid-04\"/>\r\n    <sequenceFlow id=\"sid-a1ef8239-1c5c-4fc3-89c0-59f1ce4935a4\" sourceRef=\"sid-04\" targetRef=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\"/>\r\n    <userTask id=\"sid-84446ab7-1ca8-44ce-9758-41116ac6c93d\" name=\"生产确认\" activiti:assignee=\"supper_manage\"/>\r\n    <sequenceFlow id=\"sid-a19e4b01-c0c9-481c-a0a7-33b019b1eacc\" sourceRef=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\" targetRef=\"sid-84446ab7-1ca8-44ce-9758-41116ac6c93d\"/>\r\n    <endEvent id=\"sid-62652f38-4a57-4de4-814d-0238e76e9684\"/>\r\n    <sequenceFlow id=\"sid-d451b9b6-f941-40f5-8d9d-fb0e8284da6f\" sourceRef=\"sid-84446ab7-1ca8-44ce-9758-41116ac6c93d\" targetRef=\"sid-0cf982c9-1429-49c3-bd13-baf82b13c441\"/>\r\n    <userTask id=\"sid-0cf982c9-1429-49c3-bd13-baf82b13c441\" name=\"结算确认\" activiti:assignee=\"supper_manage\"/>\r\n    <sequenceFlow id=\"sid-36990bdc-9b68-4224-bfe1-53b32d21ccbe\" sourceRef=\"sid-0cf982c9-1429-49c3-bd13-baf82b13c441\" targetRef=\"sid-62652f38-4a57-4de4-814d-0238e76e9684\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test2\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"test2\" id=\"BPMNPlane_test2\">\r\n      <bpmndi:BPMNShape id=\"shape-eb913ff1-5b45-4637-b9ac-05ee88293705\" bpmnElement=\"sid-1e09c08d-3f2b-4fe1-9e08-ac8928a24079\">\r\n        <omgdc:Bounds x=\"0.0\" y=\"-75.0\" width=\"30.0\" height=\"30.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape id=\"shape-e885664f-e517-4061-8000-9f99bcca5661\" bpmnElement=\"sid-001\">\r\n        <omgdc:Bounds x=\"-35.0\" y=\"-15.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-474d8589-7cea-41a9-9c9c-91b4bb177409\" bpmnElement=\"sid-f2266cbf-1832-444c-8557-8c2c63cb9e4c\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"-45.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"-15.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-a98ebdf3-89d7-4de4-89d7-112688535da2\" bpmnElement=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\">\r\n        <omgdc:Bounds x=\"-5.0\" y=\"110.0\" width=\"40.0\" height=\"40.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-4494a9c3-a064-4b7e-943a-fb28bb59a6dd\" bpmnElement=\"sid-85a068be-7050-495a-adf8-a6d3274c50b5\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"110.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-e2722641-0337-461d-b87d-8db8b656b49f\" bpmnElement=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\">\r\n        <omgdc:Bounds x=\"-35.0\" y=\"430.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-b3246a6e-2351-4ddd-9720-ba4090c6ccfb\" bpmnElement=\"sid-07ed102e-5c07-4b3d-8ea7-a7f5084131ed\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"150.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"430.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-49fa569c-24d4-44d9-98c5-ae8878a45a83\" bpmnElement=\"sid-03\">\r\n        <omgdc:Bounds x=\"155.0\" y=\"205.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-f488e788-9e2c-4e9b-a416-45a5b1456113\" bpmnElement=\"sid-3336c44f-efd1-46d6-8936-5898eda984fc\">\r\n        <omgdi:waypoint x=\"35.0\" y=\"130.0\"/>\r\n        <omgdi:waypoint x=\"155.0\" y=\"225.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-65c37638-4c19-4758-b623-ca3a25b0e34d\" bpmnElement=\"sid-04\">\r\n        <omgdc:Bounds x=\"155.0\" y=\"390.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-8bb5b775-67a2-4bee-9daf-4e315f3e52a0\" bpmnElement=\"sid-f8134f82-5c6e-4e1d-95db-6711258ab146\">\r\n        <omgdi:waypoint x=\"205.0\" y=\"285.0\"/>\r\n        <omgdi:waypoint x=\"205.0\" y=\"390.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge id=\"edge-8883547e-90df-4cbe-a5f6-a9115e753bd7\" bpmnElement=\"sid-a1ef8239-1c5c-4fc3-89c0-59f1ce4935a4\">\r\n        <omgdi:waypoint x=\"155.0\" y=\"450.0\"/>\r\n        <omgdi:waypoint x=\"65.0\" y=\"450.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-29428fe0-b1df-4c25-b156-b2a2a8f8c8e6\" bpmnElement=\"sid-84446ab7-1ca8-44ce-9758-41116ac6c93d\">\r\n        <omgdc:Bounds x=\"-35.0\" y=\"585.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-9ce9d85c-1051-4c0e-b868-0af7c2ebc492\" bpmnElement=\"sid-a19e4b01-c0c9-481c-a0a7-33b019b1eacc\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"510.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"585.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-160de2f7-aac4-4c76-889f-5e016c43a008\" bpmnElement=\"sid-62652f38-4a57-4de4-814d-0238e76e9684\">\r\n        <omgdc:Bounds x=\"0.0\" y=\"885.0\" width=\"30.0\" height=\"30.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-967dbe17-1458-494c-9b9f-1b3f8d6216ce\" bpmnElement=\"sid-d451b9b6-f941-40f5-8d9d-fb0e8284da6f\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"665.0\"/>\r\n        <omgdi:waypoint x=\"14.999985\" y=\"725.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-c876b611-831b-4419-a251-6e65d64332a1\" bpmnElement=\"sid-0cf982c9-1429-49c3-bd13-baf82b13c441\">\r\n        <omgdc:Bounds x=\"-35.0\" y=\"735.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-344e4609-9949-4b8c-86cc-3731347f354f\" bpmnElement=\"sid-36990bdc-9b68-4224-bfe1-53b32d21ccbe\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"815.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"885.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',
        0),
       ('c14a2cc1-69a8-11ee-b7ac-48a47209a1e7', 1, 'processes/test2.bpmn20.xml', 'c14a05b0-69a8-11ee-b7ac-48a47209a1e7',
        _binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\r\n  <process id=\"test2\" name=\"test2\" isExecutable=\"true\">\r\n    <startEvent id=\"sid-1e09c08d-3f2b-4fe1-9e08-ac8928a24079\"/>\r\n    <userTask id=\"sid-001\" name=\"合同确认\" activiti:assignee=\"supper_manage\"/>\r\n    <sequenceFlow id=\"sid-f2266cbf-1832-444c-8557-8c2c63cb9e4c\" sourceRef=\"sid-1e09c08d-3f2b-4fe1-9e08-ac8928a24079\" targetRef=\"sid-001\"/>\r\n    <exclusiveGateway id=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\"/>\r\n    <sequenceFlow id=\"sid-85a068be-7050-495a-adf8-a6d3274c50b5\" sourceRef=\"sid-001\" targetRef=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\"/>\r\n    <sequenceFlow id=\"sid-07ed102e-5c07-4b3d-8ea7-a7f5084131ed\" sourceRef=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\" targetRef=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\" name=\"状态为0，不需要采购\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">${status&lt;1}</conditionExpression>\r\n    </sequenceFlow>\r\n    <userTask id=\"sid-03\" name=\"采购确认\" activiti:assignee=\"purchase_man\"/>\r\n    <sequenceFlow id=\"sid-3336c44f-efd1-46d6-8936-5898eda984fc\" sourceRef=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\" targetRef=\"sid-03\" name=\"状态为1，需要采购\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">${status&gt;0}</conditionExpression>\r\n    </sequenceFlow>\r\n    <userTask id=\"sid-04\" name=\"入库确认\" activiti:assignee=\"in_store\"/>\r\n    <userTask id=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\" name=\"出库确认\" activiti:assignee=\"out_store\"/>\r\n    <sequenceFlow id=\"sid-f8134f82-5c6e-4e1d-95db-6711258ab146\" sourceRef=\"sid-03\" targetRef=\"sid-04\"/>\r\n    <sequenceFlow id=\"sid-a1ef8239-1c5c-4fc3-89c0-59f1ce4935a4\" sourceRef=\"sid-04\" targetRef=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\"/>\r\n    <userTask id=\"sid-84446ab7-1ca8-44ce-9758-41116ac6c93d\" name=\"生产确认\" activiti:assignee=\"supper_manage\"/>\r\n    <sequenceFlow id=\"sid-a19e4b01-c0c9-481c-a0a7-33b019b1eacc\" sourceRef=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\" targetRef=\"sid-84446ab7-1ca8-44ce-9758-41116ac6c93d\"/>\r\n    <endEvent id=\"sid-62652f38-4a57-4de4-814d-0238e76e9684\"/>\r\n    <sequenceFlow id=\"sid-d451b9b6-f941-40f5-8d9d-fb0e8284da6f\" sourceRef=\"sid-84446ab7-1ca8-44ce-9758-41116ac6c93d\" targetRef=\"sid-0cf982c9-1429-49c3-bd13-baf82b13c441\"/>\r\n    <userTask id=\"sid-0cf982c9-1429-49c3-bd13-baf82b13c441\" name=\"结算确认\" activiti:assignee=\"supper_manage\"/>\r\n    <sequenceFlow id=\"sid-36990bdc-9b68-4224-bfe1-53b32d21ccbe\" sourceRef=\"sid-0cf982c9-1429-49c3-bd13-baf82b13c441\" targetRef=\"sid-62652f38-4a57-4de4-814d-0238e76e9684\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test2\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"test2\" id=\"BPMNPlane_test2\">\r\n      <bpmndi:BPMNShape id=\"shape-eb913ff1-5b45-4637-b9ac-05ee88293705\" bpmnElement=\"sid-1e09c08d-3f2b-4fe1-9e08-ac8928a24079\">\r\n        <omgdc:Bounds x=\"0.0\" y=\"-75.0\" width=\"30.0\" height=\"30.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape id=\"shape-e885664f-e517-4061-8000-9f99bcca5661\" bpmnElement=\"sid-001\">\r\n        <omgdc:Bounds x=\"-35.0\" y=\"-15.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-474d8589-7cea-41a9-9c9c-91b4bb177409\" bpmnElement=\"sid-f2266cbf-1832-444c-8557-8c2c63cb9e4c\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"-45.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"-15.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-a98ebdf3-89d7-4de4-89d7-112688535da2\" bpmnElement=\"sid-38ca953b-2358-448d-a355-a4f5994269d8\">\r\n        <omgdc:Bounds x=\"-5.0\" y=\"110.0\" width=\"40.0\" height=\"40.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-4494a9c3-a064-4b7e-943a-fb28bb59a6dd\" bpmnElement=\"sid-85a068be-7050-495a-adf8-a6d3274c50b5\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"110.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-e2722641-0337-461d-b87d-8db8b656b49f\" bpmnElement=\"sid-c4db8201-27cd-4c94-b5e0-a4c32be06784\">\r\n        <omgdc:Bounds x=\"-35.0\" y=\"430.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-b3246a6e-2351-4ddd-9720-ba4090c6ccfb\" bpmnElement=\"sid-07ed102e-5c07-4b3d-8ea7-a7f5084131ed\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"150.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"430.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-49fa569c-24d4-44d9-98c5-ae8878a45a83\" bpmnElement=\"sid-03\">\r\n        <omgdc:Bounds x=\"155.0\" y=\"205.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-f488e788-9e2c-4e9b-a416-45a5b1456113\" bpmnElement=\"sid-3336c44f-efd1-46d6-8936-5898eda984fc\">\r\n        <omgdi:waypoint x=\"35.0\" y=\"130.0\"/>\r\n        <omgdi:waypoint x=\"155.0\" y=\"225.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-65c37638-4c19-4758-b623-ca3a25b0e34d\" bpmnElement=\"sid-04\">\r\n        <omgdc:Bounds x=\"155.0\" y=\"390.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-8bb5b775-67a2-4bee-9daf-4e315f3e52a0\" bpmnElement=\"sid-f8134f82-5c6e-4e1d-95db-6711258ab146\">\r\n        <omgdi:waypoint x=\"205.0\" y=\"285.0\"/>\r\n        <omgdi:waypoint x=\"205.0\" y=\"390.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge id=\"edge-8883547e-90df-4cbe-a5f6-a9115e753bd7\" bpmnElement=\"sid-a1ef8239-1c5c-4fc3-89c0-59f1ce4935a4\">\r\n        <omgdi:waypoint x=\"155.0\" y=\"450.0\"/>\r\n        <omgdi:waypoint x=\"65.0\" y=\"450.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-29428fe0-b1df-4c25-b156-b2a2a8f8c8e6\" bpmnElement=\"sid-84446ab7-1ca8-44ce-9758-41116ac6c93d\">\r\n        <omgdc:Bounds x=\"-35.0\" y=\"585.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-9ce9d85c-1051-4c0e-b868-0af7c2ebc492\" bpmnElement=\"sid-a19e4b01-c0c9-481c-a0a7-33b019b1eacc\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"510.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"585.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-160de2f7-aac4-4c76-889f-5e016c43a008\" bpmnElement=\"sid-62652f38-4a57-4de4-814d-0238e76e9684\">\r\n        <omgdc:Bounds x=\"0.0\" y=\"885.0\" width=\"30.0\" height=\"30.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-967dbe17-1458-494c-9b9f-1b3f8d6216ce\" bpmnElement=\"sid-d451b9b6-f941-40f5-8d9d-fb0e8284da6f\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"665.0\"/>\r\n        <omgdi:waypoint x=\"14.999985\" y=\"725.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"shape-c876b611-831b-4419-a251-6e65d64332a1\" bpmnElement=\"sid-0cf982c9-1429-49c3-bd13-baf82b13c441\">\r\n        <omgdc:Bounds x=\"-35.0\" y=\"735.0\" width=\"100.0\" height=\"80.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge id=\"edge-344e4609-9949-4b8c-86cc-3731347f354f\" bpmnElement=\"sid-36990bdc-9b68-4224-bfe1-53b32d21ccbe\">\r\n        <omgdi:waypoint x=\"15.0\" y=\"815.0\"/>\r\n        <omgdi:waypoint x=\"15.0\" y=\"885.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',
        0);
/*!40000 ALTER TABLE `act_ge_bytearray`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ge_property`
(
    `NAME_`  varchar(64) COLLATE utf8_bin NOT NULL,
    `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
    `REV_`   int                           DEFAULT NULL,
    PRIMARY KEY (`NAME_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property`
    DISABLE KEYS */;
INSERT INTO `act_ge_property`
VALUES ('cfg.execution-related-entities-count', 'false', 1),
       ('next.dbid', '1', 1),
       ('schema.history', 'create(7.0.0.0)', 1),
       ('schema.version', '7.0.0.0', 1);
/*!40000 ALTER TABLE `act_ge_property`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_actinst`
(
    `ID_`                varchar(64) COLLATE utf8_bin  NOT NULL,
    `PROC_DEF_ID_`       varchar(64) COLLATE utf8_bin  NOT NULL,
    `PROC_INST_ID_`      varchar(64) COLLATE utf8_bin  NOT NULL,
    `EXECUTION_ID_`      varchar(64) COLLATE utf8_bin  NOT NULL,
    `ACT_ID_`            varchar(255) COLLATE utf8_bin NOT NULL,
    `TASK_ID_`           varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `ACT_NAME_`          varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `ACT_TYPE_`          varchar(255) COLLATE utf8_bin NOT NULL,
    `ASSIGNEE_`          varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `START_TIME_`        datetime(3)                   NOT NULL,
    `END_TIME_`          datetime(3)                    DEFAULT NULL,
    `DURATION_`          bigint                         DEFAULT NULL,
    `DELETE_REASON_`     varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_`         varchar(255) COLLATE utf8_bin  DEFAULT '',
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
    KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
    KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`, `ACT_ID_`),
    KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`, `ACT_ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst`
    DISABLE KEYS */;
INSERT INTO `act_hi_actinst`
VALUES ('3def8190-69a9-11ee-b433-48a47209a1e7', 'test2:2:c1bc0162-69a8-11ee-b7ac-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', '3def0c5f-69a9-11ee-b433-48a47209a1e7',
        'sid-1e09c08d-3f2b-4fe1-9e08-ac8928a24079', NULL, NULL, NULL, 'startEvent', NULL, '2023-10-13 17:16:50.456',
        '2023-10-13 17:16:50.459', 3, NULL, ''),
       ('3df06bf1-69a9-11ee-b433-48a47209a1e7', 'test2:2:c1bc0162-69a8-11ee-b7ac-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', '3def0c5f-69a9-11ee-b433-48a47209a1e7', 'sid-001',
        '3df35222-69a9-11ee-b433-48a47209a1e7', NULL, '合同确认', 'userTask', 'supper_manage',
        '2023-10-13 17:16:50.462', '2023-10-13 17:16:50.639', 177, NULL, ''),
       ('3e0b6e04-69a9-11ee-b433-48a47209a1e7', 'test2:2:c1bc0162-69a8-11ee-b7ac-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', '3def0c5f-69a9-11ee-b433-48a47209a1e7',
        'sid-38ca953b-2358-448d-a355-a4f5994269d8', NULL, NULL, NULL, 'exclusiveGateway', NULL,
        '2023-10-13 17:16:50.640', '2023-10-13 17:16:50.659', 19, NULL, ''),
       ('3e0ec965-69a9-11ee-b433-48a47209a1e7', 'test2:2:c1bc0162-69a8-11ee-b7ac-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', '3def0c5f-69a9-11ee-b433-48a47209a1e7', 'sid-03',
        '3e0ec966-69a9-11ee-b433-48a47209a1e7', NULL, '采购确认', 'userTask', 'purchase_man', '2023-10-13 17:16:50.661',
        NULL, NULL, NULL, '');
/*!40000 ALTER TABLE `act_hi_actinst`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_attachment`
(
    `ID_`           varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_`          int                            DEFAULT NULL,
    `USER_ID_`      varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `NAME_`         varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `DESCRIPTION_`  varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TYPE_`         varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `TASK_ID_`      varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `URL_`          varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `CONTENT_ID_`   varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `TIME_`         datetime(3)                    DEFAULT NULL,
    PRIMARY KEY (`ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_comment`
(
    `ID_`           varchar(64) COLLATE utf8_bin NOT NULL,
    `TYPE_`         varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `TIME_`         datetime(3)                  NOT NULL,
    `USER_ID_`      varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `TASK_ID_`      varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `ACTION_`       varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `MESSAGE_`      varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `FULL_MSG_`     longblob,
    PRIMARY KEY (`ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_detail`
(
    `ID_`           varchar(64) COLLATE utf8_bin  NOT NULL,
    `TYPE_`         varchar(255) COLLATE utf8_bin NOT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `TASK_ID_`      varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `ACT_INST_ID_`  varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `NAME_`         varchar(255) COLLATE utf8_bin NOT NULL,
    `VAR_TYPE_`     varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `REV_`          int                            DEFAULT NULL,
    `TIME_`         datetime(3)                   NOT NULL,
    `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `DOUBLE_`       double                         DEFAULT NULL,
    `LONG_`         bigint                         DEFAULT NULL,
    `TEXT_`         varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TEXT2_`        varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
    KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
    KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
    KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
    KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail`
    DISABLE KEYS */;
INSERT INTO `act_hi_detail`
VALUES ('3dee7014-69a9-11ee-b433-48a47209a1e7', 'VariableUpdate', '3dedd3d2-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, NULL, 'produce_man', 'string', 0, '2023-10-13 17:16:50.449', NULL,
        NULL, NULL, 'produce_man', NULL),
       ('3deebe36-69a9-11ee-b433-48a47209a1e7', 'VariableUpdate', '3dedd3d2-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, NULL, 'purchase_man', 'string', 0, '2023-10-13 17:16:50.451',
        NULL, NULL, NULL, 'purchase_man', NULL),
       ('3deebe38-69a9-11ee-b433-48a47209a1e7', 'VariableUpdate', '3dedd3d2-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, NULL, 'in_store', 'string', 0, '2023-10-13 17:16:50.451', NULL,
        NULL, NULL, 'in_store', NULL),
       ('3deebe3a-69a9-11ee-b433-48a47209a1e7', 'VariableUpdate', '3dedd3d2-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, NULL, 'supper_manage', 'string', 0, '2023-10-13 17:16:50.451',
        NULL, NULL, NULL, 'supper_manage', NULL),
       ('3deee54c-69a9-11ee-b433-48a47209a1e7', 'VariableUpdate', '3dedd3d2-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, NULL, 'out_store', 'string', 0, '2023-10-13 17:16:50.452', NULL,
        NULL, NULL, 'out_store', NULL),
       ('3deee54e-69a9-11ee-b433-48a47209a1e7', 'VariableUpdate', '3dedd3d2-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, NULL, 'status', 'integer', 0, '2023-10-13 17:16:50.452', NULL,
        NULL, 1, '1', NULL);
/*!40000 ALTER TABLE `act_hi_detail`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_identitylink`
(
    `ID_`           varchar(64) COLLATE utf8_bin NOT NULL,
    `GROUP_ID_`     varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TYPE_`         varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `USER_ID_`      varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TASK_ID_`      varchar(64) COLLATE utf8_bin  DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin  DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
    KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
    KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink`
    DISABLE KEYS */;
INSERT INTO `act_hi_identitylink`
VALUES ('3df35223-69a9-11ee-b433-48a47209a1e7', NULL, 'participant', 'supper_manage', NULL,
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7'),
       ('3e0f1787-69a9-11ee-b433-48a47209a1e7', NULL, 'participant', 'purchase_man', NULL,
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7');
/*!40000 ALTER TABLE `act_hi_identitylink`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_procinst`
(
    `ID_`                        varchar(64) COLLATE utf8_bin NOT NULL,
    `PROC_INST_ID_`              varchar(64) COLLATE utf8_bin NOT NULL,
    `BUSINESS_KEY_`              varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `PROC_DEF_ID_`               varchar(64) COLLATE utf8_bin NOT NULL,
    `START_TIME_`                datetime(3)                  NOT NULL,
    `END_TIME_`                  datetime(3)                    DEFAULT NULL,
    `DURATION_`                  bigint                         DEFAULT NULL,
    `START_USER_ID_`             varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `START_ACT_ID_`              varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `END_ACT_ID_`                varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `DELETE_REASON_`             varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_`                 varchar(255) COLLATE utf8_bin  DEFAULT '',
    `NAME_`                      varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
    KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
    KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst`
    DISABLE KEYS */;
INSERT INTO `act_hi_procinst`
VALUES ('3dedd3d2-69a9-11ee-b433-48a47209a1e7', '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL,
        'test2:2:c1bc0162-69a8-11ee-b7ac-48a47209a1e7', '2023-10-13 17:16:50.445', NULL, NULL, NULL,
        'sid-1e09c08d-3f2b-4fe1-9e08-ac8928a24079', NULL, NULL, NULL, '', NULL);
/*!40000 ALTER TABLE `act_hi_procinst`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_taskinst`
(
    `ID_`             varchar(64) COLLATE utf8_bin NOT NULL,
    `PROC_DEF_ID_`    varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `TASK_DEF_KEY_`   varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `PROC_INST_ID_`   varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `EXECUTION_ID_`   varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `NAME_`           varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `DESCRIPTION_`    varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `OWNER_`          varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `ASSIGNEE_`       varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `START_TIME_`     datetime(3)                  NOT NULL,
    `CLAIM_TIME_`     datetime(3)                    DEFAULT NULL,
    `END_TIME_`       datetime(3)                    DEFAULT NULL,
    `DURATION_`       bigint                         DEFAULT NULL,
    `DELETE_REASON_`  varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `PRIORITY_`       int                            DEFAULT NULL,
    `DUE_DATE_`       datetime(3)                    DEFAULT NULL,
    `FORM_KEY_`       varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `CATEGORY_`       varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `TENANT_ID_`      varchar(255) COLLATE utf8_bin  DEFAULT '',
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst`
    DISABLE KEYS */;
INSERT INTO `act_hi_taskinst`
VALUES ('3df35222-69a9-11ee-b433-48a47209a1e7', 'test2:2:c1bc0162-69a8-11ee-b7ac-48a47209a1e7', 'sid-001',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', '3def0c5f-69a9-11ee-b433-48a47209a1e7', '合同确认', NULL, NULL, NULL,
        'supper_manage', '2023-10-13 17:16:50.481', NULL, '2023-10-13 17:16:50.626', 145, NULL, 50, NULL, NULL, NULL,
        ''),
       ('3e0ec966-69a9-11ee-b433-48a47209a1e7', 'test2:2:c1bc0162-69a8-11ee-b7ac-48a47209a1e7', 'sid-03',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', '3def0c5f-69a9-11ee-b433-48a47209a1e7', '采购确认', NULL, NULL, NULL,
        'purchase_man', '2023-10-13 17:16:50.661', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '');
/*!40000 ALTER TABLE `act_hi_taskinst`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_varinst`
(
    `ID_`                varchar(64) COLLATE utf8_bin  NOT NULL,
    `PROC_INST_ID_`      varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `EXECUTION_ID_`      varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `TASK_ID_`           varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `NAME_`              varchar(255) COLLATE utf8_bin NOT NULL,
    `VAR_TYPE_`          varchar(100) COLLATE utf8_bin  DEFAULT NULL,
    `REV_`               int                            DEFAULT NULL,
    `BYTEARRAY_ID_`      varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `DOUBLE_`            double                         DEFAULT NULL,
    `LONG_`              bigint                         DEFAULT NULL,
    `TEXT_`              varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TEXT2_`             varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `CREATE_TIME_`       datetime(3)                    DEFAULT NULL,
    `LAST_UPDATED_TIME_` datetime(3)                    DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
    KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`, `VAR_TYPE_`),
    KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst`
    DISABLE KEYS */;
INSERT INTO `act_hi_varinst`
VALUES ('3dee7013-69a9-11ee-b433-48a47209a1e7', '3dedd3d2-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, 'produce_man', 'string', 0, NULL, NULL, NULL, 'produce_man', NULL,
        '2023-10-13 17:16:50.449', '2023-10-13 17:16:50.449'),
       ('3deebe35-69a9-11ee-b433-48a47209a1e7', '3dedd3d2-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, 'purchase_man', 'string', 0, NULL, NULL, NULL, 'purchase_man',
        NULL, '2023-10-13 17:16:50.451', '2023-10-13 17:16:50.451'),
       ('3deebe37-69a9-11ee-b433-48a47209a1e7', '3dedd3d2-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, 'in_store', 'string', 0, NULL, NULL, NULL, 'in_store', NULL,
        '2023-10-13 17:16:50.451', '2023-10-13 17:16:50.451'),
       ('3deebe39-69a9-11ee-b433-48a47209a1e7', '3dedd3d2-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, 'supper_manage', 'string', 0, NULL, NULL, NULL, 'supper_manage',
        NULL, '2023-10-13 17:16:50.451', '2023-10-13 17:16:50.451'),
       ('3deee54b-69a9-11ee-b433-48a47209a1e7', '3dedd3d2-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, 'out_store', 'string', 0, NULL, NULL, NULL, 'out_store', NULL,
        '2023-10-13 17:16:50.452', '2023-10-13 17:16:50.452'),
       ('3deee54d-69a9-11ee-b433-48a47209a1e7', '3dedd3d2-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, 'status', 'integer', 0, NULL, NULL, 1, '1', NULL,
        '2023-10-13 17:16:50.452', '2023-10-13 17:16:50.452');
/*!40000 ALTER TABLE `act_hi_varinst`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_procdef_info`
(
    `ID_`           varchar(64) COLLATE utf8_bin NOT NULL,
    `PROC_DEF_ID_`  varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_`          int                          DEFAULT NULL,
    `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
    KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
    KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
    CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
    CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_re_deployment`
(
    `ID_`             varchar(64) COLLATE utf8_bin NOT NULL,
    `NAME_`           varchar(255) COLLATE utf8_bin     DEFAULT NULL,
    `CATEGORY_`       varchar(255) COLLATE utf8_bin     DEFAULT NULL,
    `KEY_`            varchar(255) COLLATE utf8_bin     DEFAULT NULL,
    `TENANT_ID_`      varchar(255) COLLATE utf8_bin     DEFAULT '',
    `DEPLOY_TIME_`    timestamp(3)                 NULL DEFAULT NULL,
    `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin     DEFAULT NULL,
    PRIMARY KEY (`ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment`
    DISABLE KEYS */;
INSERT INTO `act_re_deployment`
VALUES ('8a6d5fe5-69a8-11ee-b65c-48a47209a1e7', 'SpringAutoDeployment', NULL, NULL, '', '2023-10-13 09:11:49.287',
        NULL),
       ('c14a05b0-69a8-11ee-b7ac-48a47209a1e7', NULL, NULL, NULL, '', '2023-10-13 09:13:21.334', NULL);
/*!40000 ALTER TABLE `act_re_deployment`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_re_model`
(
    `ID_`                           varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_`                          int                               DEFAULT NULL,
    `NAME_`                         varchar(255) COLLATE utf8_bin     DEFAULT NULL,
    `KEY_`                          varchar(255) COLLATE utf8_bin     DEFAULT NULL,
    `CATEGORY_`                     varchar(255) COLLATE utf8_bin     DEFAULT NULL,
    `CREATE_TIME_`                  timestamp(3)                 NULL DEFAULT NULL,
    `LAST_UPDATE_TIME_`             timestamp(3)                 NULL DEFAULT NULL,
    `VERSION_`                      int                               DEFAULT NULL,
    `META_INFO_`                    varchar(4000) COLLATE utf8_bin    DEFAULT NULL,
    `DEPLOYMENT_ID_`                varchar(64) COLLATE utf8_bin      DEFAULT NULL,
    `EDITOR_SOURCE_VALUE_ID_`       varchar(64) COLLATE utf8_bin      DEFAULT NULL,
    `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin      DEFAULT NULL,
    `TENANT_ID_`                    varchar(255) COLLATE utf8_bin     DEFAULT '',
    PRIMARY KEY (`ID_`),
    KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
    KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
    KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
    CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
    CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
    CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_re_procdef`
(
    `ID_`                     varchar(64) COLLATE utf8_bin  NOT NULL,
    `REV_`                    int                            DEFAULT NULL,
    `CATEGORY_`               varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `NAME_`                   varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    `KEY_`                    varchar(255) COLLATE utf8_bin NOT NULL,
    `VERSION_`                int                           NOT NULL,
    `DEPLOYMENT_ID_`          varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `RESOURCE_NAME_`          varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `DGRM_RESOURCE_NAME_`     varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `DESCRIPTION_`            varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `HAS_START_FORM_KEY_`     tinyint                        DEFAULT NULL,
    `HAS_GRAPHICAL_NOTATION_` tinyint                        DEFAULT NULL,
    `SUSPENSION_STATE_`       int                            DEFAULT NULL,
    `TENANT_ID_`              varchar(255) COLLATE utf8_bin  DEFAULT '',
    `ENGINE_VERSION_`         varchar(255) COLLATE utf8_bin  DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`, `VERSION_`, `TENANT_ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef`
    DISABLE KEYS */;
INSERT INTO `act_re_procdef`
VALUES ('test2:1:8a8a84d7-69a8-11ee-b65c-48a47209a1e7', 1, 'http://www.activiti.org/processdef', 'test2', 'test2', 1,
        '8a6d5fe5-69a8-11ee-b65c-48a47209a1e7',
        'D:\\project\\warehouse\\warehouse-backend\\target\\classes\\processes\\test2.bpmn20.xml', NULL, NULL, 0, 1, 1,
        '', NULL),
       ('test2:2:c1bc0162-69a8-11ee-b7ac-48a47209a1e7', 1, 'http://www.activiti.org/processdef', 'test2', 'test2', 2,
        'c14a05b0-69a8-11ee-b7ac-48a47209a1e7', 'processes/test2.bpmn20.xml', NULL, NULL, 0, 1, 1, '', NULL);
/*!40000 ALTER TABLE `act_re_procdef`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_deadletter_job`
--

DROP TABLE IF EXISTS `act_ru_deadletter_job`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_deadletter_job`
(
    `ID_`                  varchar(64) COLLATE utf8_bin  NOT NULL,
    `REV_`                 int                                DEFAULT NULL,
    `TYPE_`                varchar(255) COLLATE utf8_bin NOT NULL,
    `EXCLUSIVE_`           tinyint(1)                         DEFAULT NULL,
    `EXECUTION_ID_`        varchar(64) COLLATE utf8_bin       DEFAULT NULL,
    `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin       DEFAULT NULL,
    `PROC_DEF_ID_`         varchar(64) COLLATE utf8_bin       DEFAULT NULL,
    `EXCEPTION_STACK_ID_`  varchar(64) COLLATE utf8_bin       DEFAULT NULL,
    `EXCEPTION_MSG_`       varchar(4000) COLLATE utf8_bin     DEFAULT NULL,
    `DUEDATE_`             timestamp(3)                  NULL DEFAULT NULL,
    `REPEAT_`              varchar(255) COLLATE utf8_bin      DEFAULT NULL,
    `HANDLER_TYPE_`        varchar(255) COLLATE utf8_bin      DEFAULT NULL,
    `HANDLER_CFG_`         varchar(4000) COLLATE utf8_bin     DEFAULT NULL,
    `TENANT_ID_`           varchar(255) COLLATE utf8_bin      DEFAULT '',
    PRIMARY KEY (`ID_`),
    KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
    KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
    KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
    KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
    CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
    CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
    CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
    CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_deadletter_job`
--

LOCK TABLES `act_ru_deadletter_job` WRITE;
/*!40000 ALTER TABLE `act_ru_deadletter_job`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_deadletter_job`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_event_subscr`
(
    `ID_`            varchar(64) COLLATE utf8_bin  NOT NULL,
    `REV_`           int                                    DEFAULT NULL,
    `EVENT_TYPE_`    varchar(255) COLLATE utf8_bin NOT NULL,
    `EVENT_NAME_`    varchar(255) COLLATE utf8_bin          DEFAULT NULL,
    `EXECUTION_ID_`  varchar(64) COLLATE utf8_bin           DEFAULT NULL,
    `PROC_INST_ID_`  varchar(64) COLLATE utf8_bin           DEFAULT NULL,
    `ACTIVITY_ID_`   varchar(64) COLLATE utf8_bin           DEFAULT NULL,
    `CONFIGURATION_` varchar(255) COLLATE utf8_bin          DEFAULT NULL,
    `CREATED_`       timestamp(3)                  NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `PROC_DEF_ID_`   varchar(64) COLLATE utf8_bin           DEFAULT NULL,
    `TENANT_ID_`     varchar(255) COLLATE utf8_bin          DEFAULT '',
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
    KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
    CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_execution`
(
    `ID_`                   varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_`                  int                               DEFAULT NULL,
    `PROC_INST_ID_`         varchar(64) COLLATE utf8_bin      DEFAULT NULL,
    `BUSINESS_KEY_`         varchar(255) COLLATE utf8_bin     DEFAULT NULL,
    `PARENT_ID_`            varchar(64) COLLATE utf8_bin      DEFAULT NULL,
    `PROC_DEF_ID_`          varchar(64) COLLATE utf8_bin      DEFAULT NULL,
    `SUPER_EXEC_`           varchar(64) COLLATE utf8_bin      DEFAULT NULL,
    `ROOT_PROC_INST_ID_`    varchar(64) COLLATE utf8_bin      DEFAULT NULL,
    `ACT_ID_`               varchar(255) COLLATE utf8_bin     DEFAULT NULL,
    `IS_ACTIVE_`            tinyint                           DEFAULT NULL,
    `IS_CONCURRENT_`        tinyint                           DEFAULT NULL,
    `IS_SCOPE_`             tinyint                           DEFAULT NULL,
    `IS_EVENT_SCOPE_`       tinyint                           DEFAULT NULL,
    `IS_MI_ROOT_`           tinyint                           DEFAULT NULL,
    `SUSPENSION_STATE_`     int                               DEFAULT NULL,
    `CACHED_ENT_STATE_`     int                               DEFAULT NULL,
    `TENANT_ID_`            varchar(255) COLLATE utf8_bin     DEFAULT '',
    `NAME_`                 varchar(255) COLLATE utf8_bin     DEFAULT NULL,
    `START_TIME_`           datetime(3)                       DEFAULT NULL,
    `START_USER_ID_`        varchar(255) COLLATE utf8_bin     DEFAULT NULL,
    `LOCK_TIME_`            timestamp(3)                 NULL DEFAULT NULL,
    `IS_COUNT_ENABLED_`     tinyint                           DEFAULT NULL,
    `EVT_SUBSCR_COUNT_`     int                               DEFAULT NULL,
    `TASK_COUNT_`           int                               DEFAULT NULL,
    `JOB_COUNT_`            int                               DEFAULT NULL,
    `TIMER_JOB_COUNT_`      int                               DEFAULT NULL,
    `SUSP_JOB_COUNT_`       int                               DEFAULT NULL,
    `DEADLETTER_JOB_COUNT_` int                               DEFAULT NULL,
    `VAR_COUNT_`            int                               DEFAULT NULL,
    `ID_LINK_COUNT_`        int                               DEFAULT NULL,
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
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution`
    DISABLE KEYS */;
INSERT INTO `act_ru_execution`
VALUES ('3dedd3d2-69a9-11ee-b433-48a47209a1e7', 1, '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, NULL,
        'test2:2:c1bc0162-69a8-11ee-b7ac-48a47209a1e7', NULL, '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, 1, 0, 1, 0,
        0, 1, NULL, '', NULL, '2023-10-13 17:16:50.445', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
       ('3def0c5f-69a9-11ee-b433-48a47209a1e7', 2, '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL,
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', 'test2:2:c1bc0162-69a8-11ee-b7ac-48a47209a1e7', NULL,
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', 'sid-03', 1, 0, 0, 0, 0, 1, NULL, '', NULL, '2023-10-13 17:16:50.453',
        NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `act_ru_execution`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_identitylink`
(
    `ID_`           varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_`          int                           DEFAULT NULL,
    `GROUP_ID_`     varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TYPE_`         varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `USER_ID_`      varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TASK_ID_`      varchar(64) COLLATE utf8_bin  DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin  DEFAULT NULL,
    `PROC_DEF_ID_`  varchar(64) COLLATE utf8_bin  DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
    KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
    KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
    KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
    KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
    CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
    CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
    CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink`
    DISABLE KEYS */;
INSERT INTO `act_ru_identitylink`
VALUES ('3df35223-69a9-11ee-b433-48a47209a1e7', 1, NULL, 'participant', 'supper_manage', NULL,
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL),
       ('3e0f1787-69a9-11ee-b433-48a47209a1e7', 1, NULL, 'participant', 'purchase_man', NULL,
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL);
/*!40000 ALTER TABLE `act_ru_identitylink`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_integration`
--

DROP TABLE IF EXISTS `act_ru_integration`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_integration`
(
    `ID_`                  varchar(64) COLLATE utf8_bin NOT NULL,
    `EXECUTION_ID_`        varchar(64) COLLATE utf8_bin      DEFAULT NULL,
    `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin      DEFAULT NULL,
    `PROC_DEF_ID_`         varchar(64) COLLATE utf8_bin      DEFAULT NULL,
    `FLOW_NODE_ID_`        varchar(64) COLLATE utf8_bin      DEFAULT NULL,
    `CREATED_DATE_`        timestamp(3)                 NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_FK_INT_EXECUTION` (`EXECUTION_ID_`),
    KEY `ACT_FK_INT_PROC_INST` (`PROCESS_INSTANCE_ID_`),
    KEY `ACT_FK_INT_PROC_DEF` (`PROC_DEF_ID_`),
    CONSTRAINT `ACT_FK_INT_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
    CONSTRAINT `ACT_FK_INT_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
    CONSTRAINT `ACT_FK_INT_PROC_INST` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_integration`
--

LOCK TABLES `act_ru_integration` WRITE;
/*!40000 ALTER TABLE `act_ru_integration`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_integration`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_job`
(
    `ID_`                  varchar(64) COLLATE utf8_bin  NOT NULL,
    `REV_`                 int                                DEFAULT NULL,
    `TYPE_`                varchar(255) COLLATE utf8_bin NOT NULL,
    `LOCK_EXP_TIME_`       timestamp(3)                  NULL DEFAULT NULL,
    `LOCK_OWNER_`          varchar(255) COLLATE utf8_bin      DEFAULT NULL,
    `EXCLUSIVE_`           tinyint(1)                         DEFAULT NULL,
    `EXECUTION_ID_`        varchar(64) COLLATE utf8_bin       DEFAULT NULL,
    `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin       DEFAULT NULL,
    `PROC_DEF_ID_`         varchar(64) COLLATE utf8_bin       DEFAULT NULL,
    `RETRIES_`             int                                DEFAULT NULL,
    `EXCEPTION_STACK_ID_`  varchar(64) COLLATE utf8_bin       DEFAULT NULL,
    `EXCEPTION_MSG_`       varchar(4000) COLLATE utf8_bin     DEFAULT NULL,
    `DUEDATE_`             timestamp(3)                  NULL DEFAULT NULL,
    `REPEAT_`              varchar(255) COLLATE utf8_bin      DEFAULT NULL,
    `HANDLER_TYPE_`        varchar(255) COLLATE utf8_bin      DEFAULT NULL,
    `HANDLER_CFG_`         varchar(4000) COLLATE utf8_bin     DEFAULT NULL,
    `TENANT_ID_`           varchar(255) COLLATE utf8_bin      DEFAULT '',
    PRIMARY KEY (`ID_`),
    KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
    KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
    KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
    KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
    CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
    CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
    CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
    CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_suspended_job`
--

DROP TABLE IF EXISTS `act_ru_suspended_job`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_suspended_job`
(
    `ID_`                  varchar(64) COLLATE utf8_bin  NOT NULL,
    `REV_`                 int                                DEFAULT NULL,
    `TYPE_`                varchar(255) COLLATE utf8_bin NOT NULL,
    `EXCLUSIVE_`           tinyint(1)                         DEFAULT NULL,
    `EXECUTION_ID_`        varchar(64) COLLATE utf8_bin       DEFAULT NULL,
    `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin       DEFAULT NULL,
    `PROC_DEF_ID_`         varchar(64) COLLATE utf8_bin       DEFAULT NULL,
    `RETRIES_`             int                                DEFAULT NULL,
    `EXCEPTION_STACK_ID_`  varchar(64) COLLATE utf8_bin       DEFAULT NULL,
    `EXCEPTION_MSG_`       varchar(4000) COLLATE utf8_bin     DEFAULT NULL,
    `DUEDATE_`             timestamp(3)                  NULL DEFAULT NULL,
    `REPEAT_`              varchar(255) COLLATE utf8_bin      DEFAULT NULL,
    `HANDLER_TYPE_`        varchar(255) COLLATE utf8_bin      DEFAULT NULL,
    `HANDLER_CFG_`         varchar(4000) COLLATE utf8_bin     DEFAULT NULL,
    `TENANT_ID_`           varchar(255) COLLATE utf8_bin      DEFAULT '',
    PRIMARY KEY (`ID_`),
    KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
    KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
    KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
    KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
    CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
    CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
    CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
    CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_suspended_job`
--

LOCK TABLES `act_ru_suspended_job` WRITE;
/*!40000 ALTER TABLE `act_ru_suspended_job`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_suspended_job`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_task`
(
    `ID_`               varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_`              int                               DEFAULT NULL,
    `EXECUTION_ID_`     varchar(64) COLLATE utf8_bin      DEFAULT NULL,
    `PROC_INST_ID_`     varchar(64) COLLATE utf8_bin      DEFAULT NULL,
    `PROC_DEF_ID_`      varchar(64) COLLATE utf8_bin      DEFAULT NULL,
    `NAME_`             varchar(255) COLLATE utf8_bin     DEFAULT NULL,
    `PARENT_TASK_ID_`   varchar(64) COLLATE utf8_bin      DEFAULT NULL,
    `DESCRIPTION_`      varchar(4000) COLLATE utf8_bin    DEFAULT NULL,
    `TASK_DEF_KEY_`     varchar(255) COLLATE utf8_bin     DEFAULT NULL,
    `OWNER_`            varchar(255) COLLATE utf8_bin     DEFAULT NULL,
    `ASSIGNEE_`         varchar(255) COLLATE utf8_bin     DEFAULT NULL,
    `DELEGATION_`       varchar(64) COLLATE utf8_bin      DEFAULT NULL,
    `PRIORITY_`         int                               DEFAULT NULL,
    `CREATE_TIME_`      timestamp(3)                 NULL DEFAULT NULL,
    `DUE_DATE_`         datetime(3)                       DEFAULT NULL,
    `CATEGORY_`         varchar(255) COLLATE utf8_bin     DEFAULT NULL,
    `SUSPENSION_STATE_` int                               DEFAULT NULL,
    `TENANT_ID_`        varchar(255) COLLATE utf8_bin     DEFAULT '',
    `FORM_KEY_`         varchar(255) COLLATE utf8_bin     DEFAULT NULL,
    `CLAIM_TIME_`       datetime(3)                       DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
    KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
    KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
    KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
    CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
    CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
    CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task`
    DISABLE KEYS */;
INSERT INTO `act_ru_task`
VALUES ('3e0ec966-69a9-11ee-b433-48a47209a1e7', 1, '3def0c5f-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', 'test2:2:c1bc0162-69a8-11ee-b7ac-48a47209a1e7', '采购确认', NULL, NULL,
        'sid-03', NULL, 'purchase_man', NULL, 50, '2023-10-13 09:16:50.661', NULL, NULL, 1, '', NULL, NULL);
/*!40000 ALTER TABLE `act_ru_task`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_timer_job`
--

DROP TABLE IF EXISTS `act_ru_timer_job`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_timer_job`
(
    `ID_`                  varchar(64) COLLATE utf8_bin  NOT NULL,
    `REV_`                 int                                DEFAULT NULL,
    `TYPE_`                varchar(255) COLLATE utf8_bin NOT NULL,
    `LOCK_EXP_TIME_`       timestamp(3)                  NULL DEFAULT NULL,
    `LOCK_OWNER_`          varchar(255) COLLATE utf8_bin      DEFAULT NULL,
    `EXCLUSIVE_`           tinyint(1)                         DEFAULT NULL,
    `EXECUTION_ID_`        varchar(64) COLLATE utf8_bin       DEFAULT NULL,
    `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin       DEFAULT NULL,
    `PROC_DEF_ID_`         varchar(64) COLLATE utf8_bin       DEFAULT NULL,
    `RETRIES_`             int                                DEFAULT NULL,
    `EXCEPTION_STACK_ID_`  varchar(64) COLLATE utf8_bin       DEFAULT NULL,
    `EXCEPTION_MSG_`       varchar(4000) COLLATE utf8_bin     DEFAULT NULL,
    `DUEDATE_`             timestamp(3)                  NULL DEFAULT NULL,
    `REPEAT_`              varchar(255) COLLATE utf8_bin      DEFAULT NULL,
    `HANDLER_TYPE_`        varchar(255) COLLATE utf8_bin      DEFAULT NULL,
    `HANDLER_CFG_`         varchar(4000) COLLATE utf8_bin     DEFAULT NULL,
    `TENANT_ID_`           varchar(255) COLLATE utf8_bin      DEFAULT '',
    PRIMARY KEY (`ID_`),
    KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
    KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
    KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
    KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
    CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
    CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
    CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
    CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_timer_job`
--

LOCK TABLES `act_ru_timer_job` WRITE;
/*!40000 ALTER TABLE `act_ru_timer_job`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_timer_job`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_variable`
(
    `ID_`           varchar(64) COLLATE utf8_bin  NOT NULL,
    `REV_`          int                            DEFAULT NULL,
    `TYPE_`         varchar(255) COLLATE utf8_bin NOT NULL,
    `NAME_`         varchar(255) COLLATE utf8_bin NOT NULL,
    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `TASK_ID_`      varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin   DEFAULT NULL,
    `DOUBLE_`       double                         DEFAULT NULL,
    `LONG_`         bigint                         DEFAULT NULL,
    `TEXT_`         varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TEXT2_`        varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
    KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
    KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
    KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
    CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
    CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
    CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable`
    DISABLE KEYS */;
INSERT INTO `act_ru_variable`
VALUES ('3dee7013-69a9-11ee-b433-48a47209a1e7', 1, 'string', 'produce_man', '3dedd3d2-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, NULL, NULL, NULL, 'produce_man', NULL),
       ('3deebe35-69a9-11ee-b433-48a47209a1e7', 1, 'string', 'purchase_man', '3dedd3d2-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, NULL, NULL, NULL, 'purchase_man', NULL),
       ('3deebe37-69a9-11ee-b433-48a47209a1e7', 1, 'string', 'in_store', '3dedd3d2-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, NULL, NULL, NULL, 'in_store', NULL),
       ('3deebe39-69a9-11ee-b433-48a47209a1e7', 1, 'string', 'supper_manage', '3dedd3d2-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, NULL, NULL, NULL, 'supper_manage', NULL),
       ('3deee54b-69a9-11ee-b433-48a47209a1e7', 1, 'string', 'out_store', '3dedd3d2-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, NULL, NULL, NULL, 'out_store', NULL),
       ('3deee54d-69a9-11ee-b433-48a47209a1e7', 1, 'integer', 'status', '3dedd3d2-69a9-11ee-b433-48a47209a1e7',
        '3dedd3d2-69a9-11ee-b433-48a47209a1e7', NULL, NULL, NULL, 1, '1', NULL);
/*!40000 ALTER TABLE `act_ru_variable`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_info`
--

DROP TABLE IF EXISTS `auth_info`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_info`
(
    `auth_id`     int NOT NULL AUTO_INCREMENT,
    `parent_id`   int          DEFAULT NULL COMMENT '父id为空或为0，表示一级权限',
    `auth_name`   varchar(100) DEFAULT NULL,
    `auth_desc`   varchar(300) DEFAULT NULL,
    `auth_grade`  int          DEFAULT NULL,
    `auth_type`   char(1)      DEFAULT NULL COMMENT '1 模块 、2  列表、 3  按钮',
    `auth_url`    varchar(100) DEFAULT NULL,
    `auth_code`   varchar(100) DEFAULT NULL,
    `auth_order`  int          DEFAULT NULL,
    `auth_state`  char(1)      DEFAULT '1' COMMENT '1 启用 、0 禁用',
    `create_by`   int          DEFAULT NULL,
    `create_time` datetime     DEFAULT NULL,
    `update_by`   int          DEFAULT NULL,
    `update_time` datetime     DEFAULT NULL,
    PRIMARY KEY (`auth_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 105
  DEFAULT CHARSET = utf8 COMMENT ='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_info`
--

LOCK TABLES `auth_info` WRITE;
/*!40000 ALTER TABLE `auth_info`
    DISABLE KEYS */;
INSERT INTO `auth_info`
VALUES (1, 0, '用户管理', '用户管理', 1, '1', NULL, NULL, 0, '1', 1, '2017-11-14 16:54:13', 1, '2017-11-14 16:54:17'),
       (2, 1, '用户列表', '用户列表', 2, '2', '/user/index', NULL, 0, '1', 1, '2017-11-14 16:56:11', 1,
        '2017-11-14 16:56:15'),
       (3, 2, '添加用户', '添加用户', 3, '3', NULL, 'user-addUser', 0, '1', 1, '2017-11-14 16:56:59', 1,
        '2017-11-14 16:57:02'),
       (4, 0, '角色管理', '角色管理', 1, '1', NULL, NULL, 0, '1', 1, '2017-11-14 16:57:48', 1, '2017-11-14 16:57:52'),
       (5, 4, '角色列表', '角色列表', 2, '2', '/role/index', NULL, 0, '1', 1, '2017-11-14 16:58:47', 1,
        '2017-11-14 16:58:50'),
       (6, 5, '添加角色', '添加角色', 3, '3', NULL, 'role-addRole', 0, '1', 1, '2017-11-14 16:59:25', 1,
        '2017-11-14 16:59:29'),
       (7, 0, '权限管理', '权限管理', 1, '1', NULL, NULL, 0, '0', 1, '2017-11-14 17:00:13', 1, '2017-11-14 17:00:18'),
       (8, 7, '权限树', '权限树', 2, '2', '/auth/index', NULL, 0, '1', 1, '2017-11-14 17:02:11', 1,
        '2017-11-14 17:02:14'),
       (9, 8, '添加权限', '添加权限', 3, '3', NULL, 'auth-addAuth', 0, '1', 1, '2017-11-14 17:03:48', 1,
        '2017-11-14 17:03:52'),
       (10, 2, '删除用户', '删除用户', 3, '3', '', 'user-deleteUser', 0, '1', 1, '2017-11-23 11:56:17', NULL, NULL),
       (19, 0, '订单管理', '订单管理', 1, '1', '', '', 0, '0', 1, '2017-11-23 17:31:08', NULL, NULL),
       (20, 19, '订单列表', '订单列表', 2, '2', '', '', 0, '0', 1, '2017-11-23 17:31:42', NULL, NULL),
       (21, 20, '修改订单', '修改订单', 3, '3', '', 'updateOrder', 0, '0', 0, '2017-11-24 14:33:23', NULL, NULL),
       (22, 20, '删除订单', '删除订单', 3, '3', '', 'auth-delete', 0, '0', 0, '2017-11-24 14:34:32', NULL, NULL),
       (23, 2, '查询用户', '查询用户', 3, '3', '', 'user-findUser', 0, '1', 1, '2017-11-28 10:10:53', NULL, NULL),
       (24, 2, '修改用户', '修改用户信息', 3, '3', '', 'user-updateUser', 0, '1', 0, '2017-11-28 10:12:51', NULL, NULL),
       (25, 2, '分配角色', '分配角色', 3, '3', '', 'user-assignRole', 0, '1', 1, '2017-11-28 10:15:27', NULL, NULL),
       (26, 2, '更改权限', '更改权限', 3, '3', '', 'user-updateAuth', 0, '1', 1, '2017-11-28 10:16:07', NULL, NULL),
       (27, 5, '修改角色', '修改角色', 3, '3', '', 'role-updateRole', 0, '1', 1, '2017-11-28 10:16:40', NULL, NULL),
       (28, 5, '查询角色', '查询角色', 3, '3', '', 'role-findRole', 0, '1', 1, '2017-11-28 10:17:12', NULL, NULL),
       (30, 5, '删除角色', '删除角色', 3, '3', '', 'role-deleteRole', 0, '1', 1, '2017-11-28 10:23:14', NULL, NULL),
       (31, 5, '更改权限', '更改权限', 3, '3', '', 'role-updateAuth', 0, '1', 1, '2017-11-28 10:24:35', NULL, NULL),
       (32, 8, '修改权限', '修改权限', 3, '3', '', 'auth-updateAuth', 0, '1', 1, '2017-11-28 10:25:08', NULL, NULL),
       (33, 8, '删除权限', '删除权限', 3, '3', NULL, 'auth-deleteAuth', 0, '1', 0, '2022-03-29 10:10:03', NULL, NULL),
       (34, 8, '恢复权限', '恢复权限', 3, '3', NULL, 'auth-restartAuth', 0, '1', 0, '2022-03-29 10:10:50', NULL, NULL),
       (35, 2, '修改状态', '修改状态', 3, '3', '', 'user-updateState', 0, '1', 1, '2017-11-28 10:49:40', NULL, NULL),
       (36, 2, '重置密码', '重置密码', 3, '3', '', 'user-resetPwd', 0, '1', 1, '2017-11-28 10:53:27', NULL, NULL),
       (37, 5, '修改角色状态', '修改角色状态', 3, '3', '', 'role-updateState', 0, '1', 1, '2017-11-28 11:12:23', NULL,
        NULL),
       (38, 19, '订单详情', '订单详情', 2, '2', '', '', 1, '0', 1, '2017-11-29 11:35:57', NULL, NULL),
       (41, 19, '订单分类', '订单分类', 2, '2', '', '', 1, '0', 1, '2017-11-29 11:56:04', NULL, NULL),
       (42, 0, '材料管理', '材料管理', 1, '1', '', '', 1, '1', 1, '2017-11-29 11:56:44', NULL, NULL),
       (43, 38, '查看详情', '查看详情', 3, '3', '', 'order-selectDetils', 1, '0', 1, '2017-11-29 11:57:29', NULL, NULL),
       (44, 38, '修改详情', '修改详情', 3, '3', '', 'order-updateDetils', 1, '0', 1, '2017-11-29 11:58:36', NULL, NULL),
       (46, 41, '分类', '分类', 3, '3', '', 'auth-flAuth', 1, '0', 1, '2017-11-30 15:16:02', NULL, NULL),
       (50, 42, '材料列表', '材料列表', 2, '2', '/commodity/index', '', 1, '1', 1, '2017-12-07 08:47:50', NULL, NULL),
       (53, 0, '采购管理', '采购管理', 1, '1', '', '', 1, '1', 1, '2017-12-11 14:53:02', NULL, NULL),
       (54, 0, '入库管理', '入库管理', 1, '1', '', '', 1, '1', 1, '2017-12-11 14:53:20', NULL, NULL),
       (55, 0, '出库管理', '出库管理', 1, '1', '', '', 1, '1', 1, '2017-12-11 14:53:31', NULL, NULL),
       (56, 53, '采购列表', '采购列表', 2, '2', '/purchase/index', '', 1, '1', 1, '2017-12-11 14:59:11', NULL, NULL),
       (57, 54, '入库列表', '入库列表', 2, '2', '/instore/index', '', 1, '1', 1, '2017-12-11 15:01:27', NULL, NULL),
       (58, 55, '出库列表', '出库列表', 2, '2', '/outstore/index', '', 1, '1', 1, '2017-12-11 15:02:03', NULL, NULL),
       (61, 0, '盘点管理', '盘点管理', 1, '1', '', '', 1, '1', 1, '2017-12-11 18:04:38', NULL, NULL),
       (62, 61, '盘点列表', '盘点列表', 2, '2', '', '', 1, '1', 1, '2017-12-11 18:05:05', NULL, NULL),
       (63, 0, '统计查询', '统计查询', 1, '1', '', '', 1, '1', 1, '2017-12-12 14:17:13', NULL, NULL),
       (64, 63, '统计报表', '统计报表', 2, '2', '/statistics/index', '', 1, '1', 1, '2017-12-12 14:17:43', NULL, NULL),
       (68, 0, '调货管理', '调货管理', 1, '1', '', '', 1, '0', 1, '2017-12-13 14:34:21', NULL, NULL),
       (69, 0, '仓库管理', '仓库管理', 1, '1', '', '', 1, '1', 1, '2017-12-13 14:34:48', NULL, NULL),
       (70, 69, '仓库列表', '仓库列表', 2, '2', '/store/index', '', 1, '1', 1, '2017-12-13 14:36:32', NULL, NULL),
       (71, 68, '调货单列表', '调货单列表', 2, '2', '/transshipment/index', NULL, NULL, '1', NULL, NULL, NULL, NULL),
       (72, 0, '供货商管理', '供货商管理', 1, '1', '', '', 1, '1', 1, '2017-12-13 17:09:36', NULL, NULL),
       (74, 72, '供货商列表', '供货商列表', 2, '2', '/supply/index', '', 1, '1', 1, '2017-12-13 17:10:14', NULL, NULL),
       (76, 42, '材料分类', '材料分类', 2, '2', '/commodity/category', '', 1, '1', 1, '2017-12-14 11:16:38', NULL,
        NULL),
       (92, 50, '调货', '调货', 3, '3', '/transshipment/transfer', 'transfer_commodity', 0, '1', 1,
        '2022-04-22 12:17:19', NULL, NULL),
       (93, 50, '商品查询', '商品查询', 3, '3', '/product/product-page-list', 'select_product', 0, '1', 1,
        '2022-04-22 12:21:37', NULL, NULL),
       (94, 50, '添加商品', '添加商品', 3, '3', '/product/product-add', 'product-add', 0, '1', 1, '2022-04-22 12:23:17',
        NULL, NULL),
       (95, 57, '确定入库', '确定入库', 3, '3', '/instore/instore-confirm', 'instore-confirm', 0, '1', 1,
        '2022-04-22 12:25:36', NULL, NULL),
       (96, 71, '确认调货', '确认调货', 3, '3', '/transshipment/transshipment-confirm', 'transshipment-confirm', 0, '1',
        1, '2022-04-22 12:26:59', NULL, NULL),
       (97, 50, '采购', '采购', 3, '3', '/purchase/purchase-add', 'purchase-add', 0, '1', 1, '2022-04-22 12:30:42',
        NULL, NULL),
       (98, 0, '合同管理', '合同管理', 1, '1', NULL, NULL, 0, '1', 1, NULL, NULL, NULL),
       (99, 98, '合同列表', '合同列表', 2, '2', '/contract/index', NULL, 1, '1', 1, '2023-09-19 16:22:53', NULL, NULL),
       (100, 0, '考勤管理', '考勤管理', 1, '1', NULL, NULL, 0, '1', 1, NULL, NULL, NULL),
       (101, 100, '考勤列表', '考勤列表', 2, '2', '/attendance/index', NULL, 1, '1', 1, NULL, NULL, NULL),
       (102, 0, '任务中心', '任务中心', 1, '1', NULL, NULL, 0, '1', NULL, NULL, NULL, NULL),
       (104, 102, '任务列表', '任务列表', 2, '2', '/task/index', NULL, 1, '1', 1, NULL, NULL, NULL);
/*!40000 ALTER TABLE `auth_info`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand`
(
    `brand_id`    int NOT NULL AUTO_INCREMENT,
    `brand_name`  varchar(100)  DEFAULT NULL,
    `brand_leter` char(1)       DEFAULT NULL,
    `brand_desc`  varchar(1000) DEFAULT NULL,
    PRIMARY KEY (`brand_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8 COMMENT ='品牌';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand`
    DISABLE KEYS */;
INSERT INTO `brand`
VALUES (1, '东东果蔬', 'D', '别买了，不能吃...'),
       (2, '美的', 'M', '还可以'),
       (3, '海尔', 'H', '我家洗衣机就是海尔啊'),
       (4, '华为', 'H', '中华有为');
/*!40000 ALTER TABLE `brand`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy_list`
--

DROP TABLE IF EXISTS `buy_list`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy_list`
(
    `buy_id`       int NOT NULL AUTO_INCREMENT,
    `product_id`   int         DEFAULT NULL,
    `store_id`     int         DEFAULT NULL,
    `buy_num`      int         DEFAULT NULL,
    `fact_buy_num` int         DEFAULT NULL,
    `buy_time`     datetime    DEFAULT NULL,
    `supply_id`    int         DEFAULT NULL,
    `place_id`     int         DEFAULT NULL,
    `buy_user`     varchar(20) DEFAULT NULL,
    `phone`        varchar(20) DEFAULT NULL,
    `is_in`        char(1)     DEFAULT NULL COMMENT '0 否 1 是',
    PRIMARY KEY (`buy_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 48
  DEFAULT CHARSET = utf8 COMMENT ='采购单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_list`
--

LOCK TABLES `buy_list` WRITE;
/*!40000 ALTER TABLE `buy_list`
    DISABLE KEYS */;
INSERT INTO `buy_list`
VALUES (1, 1, 1, 200, 198, '2017-12-19 09:45:49', 1, 2, 'rose', '13474421775', '1'),
       (2, 5, 2, 366, 299, '2018-12-11 09:47:55', 2, 3, 'Jack', '13425431443', '0'),
       (3, 6, 3, 499, 0, '2019-12-26 08:14:54', 3, 5, 'json', '12435642334', '0'),
       (4, 7, 2, 899, 400, '2020-12-18 08:21:12', 3, 4, 'Abby', '13657867789', '0'),
       (5, 11, 1, 299, 123, '2021-12-07 21:27:53', 1, 1, '杨洋', '13567589887', '1'),
       (6, 12, 1, 299, 200, '2022-02-07 21:28:43', 1, 1, '杨洋', '13567589887', '1'),
       (7, 13, 1, 3666, 399, '2018-12-07 21:29:24', 1, 1, '赵丽颖', '15757483376', '1'),
       (8, 14, 1, 8, 0, '2019-12-07 21:54:16', 1, 1, '张三', '12455546785', '0'),
       (9, 1, 1, 234, 33, '2020-12-07 22:10:22', 1, 1, '李四', '15647864467', '1'),
       (10, 1, 1, 235, 0, '2021-12-07 22:14:02', 1, 1, '王麻子', '18349274483', '0'),
       (11, 5, 1, 600, 600, '2022-04-11 15:37:10', 2, 2, 'zhang', '14647386684', '1'),
       (12, 5, 1, 555, 550, '2019-12-11 15:39:51', 2, 3, 'liu', '46462275758', '0'),
       (13, 5, 1, 666, 600, '2020-12-11 15:40:43', 2, 3, 'james', '35436375757', '0'),
       (14, 5, 1, 666, 666, '2021-12-11 17:27:13', 2, 3, 'kobe', '35436375757', '1'),
       (15, 6, 2, 33, 33, '2021-12-12 10:19:32', 2, 2, 'tom', NULL, '0'),
       (16, 6, 3, 44, 44, '2020-12-12 10:19:44', 2, 2, 'frank', NULL, '0'),
       (17, 6, 2, 55, 53, '2021-12-12 10:20:09', 1, 3, 'hello', NULL, '0'),
       (18, 7, 1, 66, 1, '2022-04-12 10:20:26', 1, 2, 'mary', NULL, '1'),
       (19, 14, 1, 22, 10, '2022-04-13 10:20:38', 2, 1, 'alise', NULL, '1'),
       (20, 19, 1, 499, 0, '2022-04-13 10:28:39', 2, 2, 'mark', '46462275758', '0'),
       (21, 22, 1, 700, 666, '2022-04-14 10:29:49', 2, 2, 'scott', '14647386684', '1'),
       (22, 23, 1, 388, 300, '2022-03-12 10:31:06', 2, 3, 'jerry', '14647386684', '1'),
       (23, 21, 1, 700, 400, '2021-04-12 10:32:17', 2, 2, 'john', '46462275758', '1'),
       (25, 19, 1, 700, 700, '2019-04-12 10:43:45', 2, 2, 'zhang', '14647386684', '1'),
       (26, 14, 1, 389, 300, '2022-01-14 11:10:47', 2, 2, 'messi', '12412412412', '1'),
       (27, 21, NULL, NULL, NULL, '2022-04-19 11:42:19', NULL, NULL, NULL, NULL, '0'),
       (28, 22, 1, 100, 50, '2022-04-19 11:58:05', 5, 6, 'wk', '12345678987', '1'),
       (29, 21, 1, 2, NULL, '2022-04-19 12:06:14', 2, 4, 'vick', '1234565432354', '0'),
       (30, 21, 1, 3, NULL, '2022-04-19 12:09:29', 2, 4, 'mel', '33333333333', '0'),
       (31, 22, 1, 5, NULL, '2022-04-19 12:13:23', 5, 6, 'vick', '44444444444', '0'),
       (32, 21, 1, 8, 6, '2022-04-19 12:17:53', 2, 4, 'wr', '55555555555', '1'),
       (35, 21, 1, 34, 20, '2022-04-19 18:00:09', 2, 4, 'href', '12345678234', '1'),
       (36, 21, 1, 50, 10, '2022-04-19 18:01:15', 2, 4, 'alise', '12345678932', '1'),
       (37, 22, 1, 500, 50, '2022-04-19 18:02:48', 5, 6, 'sam', '17654895432', '1'),
       (38, 23, 2, 100, NULL, '2022-04-19 18:21:04', 5, 6, 'butt', '12345654327', '0'),
       (39, 23, 2, 188, NULL, '2022-04-19 18:27:00', 5, 6, 'berne', '12345678742', '0'),
       (40, 21, 1, 100, 90, '2022-04-19 18:39:30', 2, 4, 'justin', '19875673733', '0'),
       (41, 19, 2, 100, NULL, '2022-04-19 18:41:17', 2, 3, 'messi2', '16274987263', '0'),
       (42, 6, 2, 40, NULL, '2022-04-19 18:43:17', 2, 4, 'kate', '12876543216', '0'),
       (43, 6, 2, 20, NULL, '2022-04-19 18:45:54', 2, 4, 'zhang', '17654328765', '0'),
       (44, 7, 1, 20, 15, '2022-04-21 08:53:20', 4, 5, 'jerry', '12345678652', '1'),
       (45, 22, 1, 23, 20, '2022-04-22 08:48:22', 5, 6, 'ww', '12345678921', '1'),
       (46, 25, 1, 20, 15, '2022-04-22 11:53:08', 5, 6, 'lisi', '12345678954', '1'),
       (47, 25, 1, 100, 80, '2022-04-24 15:50:33', 5, 6, 'h5', '19893748542', '1');
/*!40000 ALTER TABLE `buy_list`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkin`
--

DROP TABLE IF EXISTS `checkin`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin`
(
    `id`          int unsigned NOT NULL AUTO_INCREMENT,
    `user_id`     int unsigned     DEFAULT NULL,
    `address`     varchar(255)     DEFAULT NULL,
    `country`     varchar(255)     DEFAULT NULL,
    `province`    varchar(255)     DEFAULT NULL,
    `city`        varchar(255)     DEFAULT NULL,
    `district`    varchar(255)     DEFAULT NULL,
    `status`      tinyint unsigned DEFAULT NULL,
    `risk`        int unsigned     DEFAULT NULL,
    `date`        date             DEFAULT NULL,
    `create_time` datetime         DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin`
--

LOCK TABLES `checkin` WRITE;
/*!40000 ALTER TABLE `checkin`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `checkin`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract`
(
    `contract_id`     int NOT NULL AUTO_INCREMENT,
    `contract_name`   varchar(100) DEFAULT NULL,
    `contract_desc`   varchar(100) DEFAULT NULL,
    `contract_state`  char(1)      DEFAULT NULL COMMENT '0未审核、1 待结算 、2 结算中、 3 已结算',
    `associated_area` varchar(100) DEFAULT NULL COMMENT '关联工区',
    `files`           varchar(500) DEFAULT NULL COMMENT '相关附件',
    `create_time`     datetime     DEFAULT NULL,
    `update_time`     datetime     DEFAULT NULL,
    PRIMARY KEY (`contract_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 104
  DEFAULT CHARSET = utf8 COMMENT ='合同表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract`
    DISABLE KEYS */;
INSERT INTO `contract`
VALUES (98, '测试修改合同 1', '测试添加合同描述 1', '2', '测试添加关联工区 1', NULL, '2023-09-19 15:49:43',
        '2023-09-19 15:54:12'),
       (99, '测试添加合同 2', '测试添加合同描述 2', '1', '测试添加关联工区 2', NULL, '2023-09-19 15:50:09', NULL),
       (101, '网页测试添加合同 2', ' 网页测试添加合同描述 2', '1', '', NULL, '2023-09-20 15:43:58', NULL),
       (102, '测试合同', '测试合同', '1', '测试', '/img/upload/OIP.jpg', '2023-10-12 15:40:52', NULL),
       (103, '测试合同2', '测试合同2', '0', '测试合同2', '/img/upload/OIP.jpeg', '2023-10-12 16:14:13', NULL);
/*!40000 ALTER TABLE `contract`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `face_model`
--

DROP TABLE IF EXISTS `face_model`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `face_model`
(
    `id`         int unsigned DEFAULT NULL,
    `user_id`    int unsigned DEFAULT NULL,
    `face_model` text
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `face_model`
--

LOCK TABLES `face_model` WRITE;
/*!40000 ALTER TABLE `face_model`
    DISABLE KEYS */;
INSERT INTO `face_model`
VALUES (1, 1, '/images/1.jpg');
/*!40000 ALTER TABLE `face_model`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow`
--

DROP TABLE IF EXISTS `flow`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flow`
(
    `id`           int NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `instance_id`  varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '流程实例id',
    `contract_id`  int                                     DEFAULT NULL COMMENT '合同id',
    `purchase_id`  int                                     DEFAULT NULL COMMENT '采购单id',
    `in_store_id`  int                                     DEFAULT NULL COMMENT '入库单id',
    `out_store_id` int                                     DEFAULT NULL COMMENT '出库单id',
    `state`        int                                     DEFAULT NULL COMMENT '实例状态：1=进行中，0=已结束',
    `create_time`  datetime                                DEFAULT NULL COMMENT '部署时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 26
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow`
--

LOCK TABLES `flow` WRITE;
/*!40000 ALTER TABLE `flow`
    DISABLE KEYS */;
INSERT INTO `flow`
VALUES (25, '3dedd3d2-69a9-11ee-b433-48a47209a1e7', 102, 0, 0, 0, 1, '2023-10-13 17:16:50');
/*!40000 ALTER TABLE `flow`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidays`
(
    `id`   int unsigned DEFAULT NULL,
    `date` date         DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `holidays`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `in_store`
--

DROP TABLE IF EXISTS `in_store`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_store`
(
    `ins_id`      int NOT NULL AUTO_INCREMENT,
    `store_id`    int      DEFAULT NULL,
    `product_id`  int      DEFAULT NULL,
    `in_num`      int      DEFAULT NULL,
    `create_by`   int      DEFAULT NULL,
    `create_time` datetime DEFAULT NULL,
    `is_in`       char(1)  DEFAULT NULL COMMENT '0 否 1 是',
    PRIMARY KEY (`ins_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 48
  DEFAULT CHARSET = utf8 COMMENT ='入库单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `in_store`
--

LOCK TABLES `in_store` WRITE;
/*!40000 ALTER TABLE `in_store`
    DISABLE KEYS */;
INSERT INTO `in_store`
VALUES (1, 1, 1, 150, 1, '2017-12-08 14:17:02', '1'),
       (2, 2, 5, 150, 1, '2017-12-08 14:17:31', '1'),
       (3, 1, 1, 198, NULL, '2017-12-11 13:16:20', '1'),
       (4, 1, 1, 198, NULL, '2017-12-11 13:25:32', '0'),
       (5, 1, 1, 198, NULL, '2017-12-11 13:28:30', '1'),
       (6, 1, 1, 198, NULL, '2017-12-11 13:36:04', '0'),
       (7, 1, 1, 198, NULL, '2017-12-11 13:48:12', '0'),
       (8, 1, 1, 198, 1, '2017-12-11 13:52:14', '0'),
       (9, 1, 1, 198, 1, '2017-12-11 13:57:52', '0'),
       (10, 1, 1, 198, 1, '2017-12-11 14:00:03', '0'),
       (11, 1, 1, 198, 1, '2017-12-11 14:00:42', '0'),
       (12, 1, 1, 198, 1, '2017-12-11 14:02:27', '0'),
       (13, 1, 1, 198, 1, '2017-12-11 14:32:05', '0'),
       (14, 1, 1, 198, 1, '2017-12-11 14:35:35', '0'),
       (15, 1, 1, 198, 1, '2017-12-11 14:36:09', '0'),
       (16, 1, 1, 123, 1, '2017-12-11 15:04:01', '1'),
       (17, 1, 1, 200, 1, '2017-12-12 10:32:37', '0'),
       (18, 1, 2, 700, 1, '2017-12-12 10:43:06', '0'),
       (19, 1, 1, 700, 1, '2017-12-12 10:44:07', '1'),
       (20, 1, 9, 100, 1, '2017-12-13 14:42:11', '1'),
       (21, 1, 10, 21, 1, '2017-12-13 14:46:18', '1'),
       (22, 1, 11, 32, 1, '2017-12-13 15:22:12', '1'),
       (23, 1, 12, 11, 1, '2017-12-13 15:33:10', '1'),
       (24, 1, 13, 100, 1, '2017-12-13 15:37:11', '1'),
       (25, 1, 14, 222, 1, '2017-12-13 18:57:06', '0'),
       (26, 1, 15, 78, 1, '2017-12-13 19:18:12', '1'),
       (27, 1, 16, 100, 1, '2017-12-13 19:27:14', '1'),
       (28, 1, 1, 400, 1, '2017-12-14 11:08:55', '0'),
       (29, 1, 13, 300, 1, '2017-12-14 11:37:53', '1'),
       (30, 1, 3, 300, 1, '2017-12-14 11:40:15', '1'),
       (31, 2, 18, 43, 1, '2017-12-14 15:39:13', '1'),
       (32, 1, 22, 666, 1, '2022-04-20 12:00:02', '1'),
       (33, 1, 14, 10, 1, '2022-04-20 12:03:15', '1'),
       (34, 1, 7, 1, 1, '2022-04-20 17:19:36', '1'),
       (35, 1, 22, 50, 1, '2022-04-20 17:30:25', '0'),
       (36, 1, 13, 399, 1, '2022-04-20 17:38:22', '0'),
       (37, 1, 21, 6, 1, '2022-04-20 17:44:24', '0'),
       (38, 1, 7, 15, 1, '2022-04-21 08:56:47', '0'),
       (39, 1, 22, 50, 1, '2022-04-21 09:15:07', '1'),
       (40, 1, 5, 600, 1, '2022-04-21 09:35:35', '1'),
       (41, 1, 1, 33, 1, '2022-04-21 09:37:09', '1'),
       (42, 1, 28, 20, 1, '2022-04-22 11:25:20', '1'),
       (43, 1, 25, 15, 1, '2022-04-22 11:55:01', '1'),
       (44, 1, 22, 20, 28, '2022-04-22 13:54:56', '1'),
       (45, 1, 25, 80, 28, '2022-04-24 15:50:54', '1'),
       (46, 1, 30, 20, 32, '2022-04-24 15:55:58', '1'),
       (47, 1, 5, 666, 1, '2023-10-10 15:15:10', '1');
/*!40000 ALTER TABLE `in_store`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `out_store`
--

DROP TABLE IF EXISTS `out_store`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `out_store`
(
    `outs_id`     int NOT NULL AUTO_INCREMENT,
    `product_id`  int           DEFAULT NULL,
    `store_id`    int           DEFAULT NULL,
    `tally_id`    int           DEFAULT NULL,
    `out_price`   decimal(8, 2) DEFAULT NULL,
    `out_num`     int           DEFAULT NULL,
    `create_by`   int           DEFAULT NULL,
    `create_time` datetime      DEFAULT NULL,
    `is_out`      char(1)       DEFAULT NULL COMMENT '0 否 1 是',
    PRIMARY KEY (`outs_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 25
  DEFAULT CHARSET = utf8 COMMENT ='出库单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `out_store`
--

LOCK TABLES `out_store` WRITE;
/*!40000 ALTER TABLE `out_store`
    DISABLE KEYS */;
INSERT INTO `out_store`
VALUES (1, 1, 1, 3, NULL, 100, 1, '2017-12-08 14:18:08', '1'),
       (2, 5, 1, 3, NULL, 160, 1, '2018-12-11 08:56:07', '1'),
       (3, 11, 2, 3, NULL, 200, 1, '2019-12-11 08:56:15', '0'),
       (4, 6, 1, 3, NULL, 270, 3, '2020-12-11 08:56:29', '0'),
       (5, 7, 1, 3, NULL, 450, 3, '2021-12-11 08:56:36', '1'),
       (6, 12, 1, 3, NULL, 340, 5, '2022-02-11 08:56:44', '0'),
       (7, 13, 1, 3, NULL, 120, 5, '2021-12-11 08:57:10', '1'),
       (8, 14, 1, 23, NULL, 800, 5, '2021-12-12 10:47:43', '0'),
       (9, 19, 1, 3, NULL, 300, 10, '2020-12-14 11:43:55', '1'),
       (10, 21, 1, 23, NULL, 30, 1, '2022-04-20 16:41:47', '1'),
       (11, 22, 1, 23, NULL, 20, 1, '2022-04-20 16:45:41', '1'),
       (12, 23, 1, 23, NULL, 15, 1, '2022-04-20 16:46:56', '1'),
       (13, 25, 1, NULL, NULL, 23, 1, '2022-04-24 15:53:17', '1'),
       (14, 1, 1, NULL, NULL, 19, 34, '2023-10-11 15:01:54', '1'),
       (15, 1, 1, NULL, NULL, 19, 1, '2023-10-11 15:24:41', '1'),
       (16, 1, 1, NULL, NULL, 10, 34, '2023-10-11 15:27:26', '1'),
       (17, 1, 1, NULL, NULL, 10, 34, '2023-10-11 15:37:46', '1'),
       (18, 1, 1, NULL, NULL, 10, 34, '2023-10-11 15:41:05', '1'),
       (19, 1, 1, NULL, NULL, 10, 34, '2023-10-11 15:44:17', '1'),
       (20, 1, 1, NULL, NULL, 10, 34, '2023-10-11 16:01:46', '1'),
       (21, 1, 1, NULL, NULL, 10, 34, '2023-10-12 10:25:38', '1'),
       (22, 1, 1, NULL, NULL, 10, 34, '2023-10-12 14:29:59', '1'),
       (23, 1, 1, NULL, NULL, 10, 34, '2023-10-13 16:51:41', '1'),
       (24, 1, 1, NULL, NULL, 10, 34, '2023-10-13 17:05:02', '1');
/*!40000 ALTER TABLE `out_store`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place`
(
    `place_id`   int NOT NULL AUTO_INCREMENT,
    `place_name` varchar(200) DEFAULT NULL,
    `place_num`  varchar(20)  DEFAULT NULL,
    `introduce`  varchar(300) DEFAULT NULL,
    `is_delete`  char(1)      DEFAULT '0' COMMENT '0:可用  1:不可用',
    PRIMARY KEY (`place_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8 COMMENT ='产地';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place`
    DISABLE KEYS */;
INSERT INTO `place`
VALUES (1, '湖南', 'hunan', '湖南挺好的啊123123123', '0'),
       (2, '湖北', 'hubei', '湖北没有湖南好', '0'),
       (3, '陕西', 'shanxi', '还是陕西更好', '0'),
       (4, '浙江', 'zhejiang', '好地方', '0'),
       (5, '山东', 'shandong', '很好', '0'),
       (6, '广东', 'guangdong', '非常好', '0');
/*!40000 ALTER TABLE `place`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product`
(
    `product_id`     int NOT NULL AUTO_INCREMENT,
    `store_id`       int            DEFAULT NULL,
    `brand_id`       int            DEFAULT NULL,
    `product_name`   varchar(200)   DEFAULT NULL,
    `product_num`    varchar(50)    DEFAULT NULL,
    `product_invent` int            DEFAULT NULL,
    `type_id`        int            DEFAULT NULL,
    `supply_id`      int            DEFAULT NULL,
    `place_id`       int            DEFAULT NULL,
    `unit_id`        int            DEFAULT NULL,
    `introduce`      longtext,
    `up_down_state`  char(1)        DEFAULT NULL COMMENT '0 下架 1 上架',
    `in_price`       decimal(10, 2) DEFAULT NULL,
    `sale_price`     decimal(10, 2) DEFAULT NULL,
    `mem_price`      decimal(10, 2) DEFAULT NULL,
    `create_time`    datetime       DEFAULT NULL,
    `update_time`    datetime       DEFAULT NULL,
    `create_by`      int            DEFAULT NULL,
    `update_by`      int            DEFAULT NULL,
    `imgs`           varchar(500)   DEFAULT NULL,
    `product_date`   datetime       DEFAULT NULL,
    `supp_date`      datetime       DEFAULT NULL,
    PRIMARY KEY (`product_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 33
  DEFAULT CHARSET = utf8 COMMENT ='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product`
    DISABLE KEYS */;
INSERT INTO `product`
VALUES (1, 1, 3, '海尔电视d1-1111', 'haier1001', 172, 3, 4, 5, 6, '43242342342343', '1', 3899.00, 4999.00, 4599.00,
        '2017-12-06 12:09:12', '2022-04-08 15:24:14', 1, 1, '/img/upload/haier_tv.jpg', '2016-02-22 08:00:00',
        '2028-10-11 08:00:00'),
       (5, 2, 3, '海尔洗衣机h1-1131', 'haierh11132', 1423, 2, 2, 3, 6, 'weqweqweqwe', '1', 3899.00, 4999.00, 4599.00,
        '2017-12-06 12:09:12', '2017-12-08 17:14:12', 1, 1, '', '2016-02-23 00:00:00', '2027-02-23 00:00:00'),
       (6, 2, 1, '香蕉', 'xj456', 200, 6, 2, 4, 3, '香蕉啊222', '0', 2.50, 5.50, 3.50, '2017-12-12 11:16:45',
        '2022-04-08 12:24:45', 1, 1, '/img/upload/banana.png', '2017-12-19 08:00:00', '2017-12-31 08:00:00'),
       (7, 1, 3, '海尔洗衣机h1-1132', 'haier1002', 101, 2, 4, 5, 6, 'weqweqweqwe', '0', 3899.00, 4999.00, 4599.00,
        '2017-12-06 12:09:12', '2022-04-08 15:25:14', 1, 1, '/img/upload/haier_wm.jpg', '2016-02-22 08:00:00',
        '2030-09-17 08:00:00'),
       (11, 1, 3, '海尔洗衣机h1-1136', 'haier1003', 111, 2, 4, 3, 6, '洗的很干净', '1', 3899.00, 4999.00, 4599.00,
        '2017-12-06 12:09:12', '2022-04-08 15:41:02', 1, 1, '/img/upload/haier_wm.jpg', '2019-10-22 08:00:00',
        '2027-02-22 08:00:00'),
       (12, 1, 3, '海尔洗衣机h1-1137', 'haierh11138', 222, 2, 2, 3, 6, 'weqweqweqwe', '1', 3899.00, 4999.00, 4599.00,
        '2017-12-06 12:09:12', '2022-04-08 15:44:51', 1, 1, '/img/upload/h1130.png', '2016-02-22 08:00:00',
        '2017-02-22 08:00:00'),
       (13, 2, 1, '西瓜', 'xigua', 80, 6, 1, 2, 2, '不好吃，别买了', '0', 2.50, 20.50, 8.50, '2017-12-14 10:39:14',
        '2017-12-14 10:43:31', 1, 1, '', '2017-12-10 00:00:00', '2027-12-19 00:00:00'),
       (14, 2, 3, '海尔洗衣机h1-1138', 'haierh11132a', 43, 2, 2, 2, 6, '海尔洗衣机好啊', '0', 3899.00, 4999.00, 4599.00,
        '2017-12-06 12:09:12', '2017-12-14 09:42:24', 1, 1, '', '2017-12-31 00:00:00', '2029-09-23 00:00:00'),
       (19, 2, 1, '西瓜2号', 'xg9527', 2000, 6, 2, 3, 2, '皮薄保甜', '0', 3.00, 5.00, 4.00, '2022-04-08 11:19:38', NULL,
        1, NULL, '/img/upload/watermelon.png', '2022-04-09 08:00:00', '2022-04-30 08:00:00'),
       (21, 1, 1, '香蕉', 'xg123', 270, 6, 2, 4, 3, '香蕉啊', '0', 2.50, 5.50, 3.50, '2022-04-08 11:58:47',
        '2022-04-08 15:11:48', 1, 1, '/img/upload/banana.png', '2017-12-19 08:00:00', '2017-12-29 08:00:00'),
       (22, 1, 2, '空调', 'midea1001', 170, 7, 5, 6, 6, '很凉快', '0', 2000.00, 3999.00, 3699.00, '2022-04-08 15:39:56',
        NULL, 1, NULL, '/img/upload/midea_ac.png', '2022-03-24 08:00:00', '2034-12-20 08:00:00'),
       (23, 2, 2, '风扇', 'midea1002', 980, 8, 5, 6, 6, '没有风，只有声。。。', '0', 100.00, 299.00, 249.00,
        '2022-04-08 15:44:22', NULL, 1, NULL, '/img/upload/midea_blower.png', '2022-04-01 08:00:00',
        '2038-09-15 08:00:00'),
       (24, 2, 1, '香蕉', 'xg124', NULL, 6, 2, 4, 3, '香蕉啊', '0', 2.50, 5.50, 3.50, '2022-04-08 11:58:47',
        '2022-04-08 15:11:48', 1, 1, '/img/upload/banana.png', '2017-12-19 08:00:00', '2017-12-29 08:00:00'),
       (25, 1, 2, '风扇', 'midea1004', 87, 8, 5, 6, 6, '没有风，只有声。。。', '1', 100.00, 299.00, 249.00,
        '2022-04-08 15:44:22', '2022-04-24 15:44:07', 1, 31, '/img/upload/midea_blower.png', '2022-04-01 08:00:00',
        '2038-09-15 08:00:00'),
       (27, 1, 1, '西瓜2号', 'xg9528', 100, 6, 2, 3, 2, '皮薄保甜', '0', 3.00, 5.00, 4.00, '2022-04-08 11:19:38',
        '2022-04-24 15:48:59', 1, 31, '/img/upload/watermelon.png', '2022-04-09 08:00:00', '2022-06-05 08:00:00'),
       (28, 3, 1, '西瓜', 'xigua6', 220, 6, 1, 2, 2, '不好吃，别买了', '0', 2.50, 20.50, 8.50, '2017-12-14 10:39:14',
        '2022-04-24 16:02:49', 1, 1, '/img/upload/xigua2.jpeg', '2017-12-09 08:00:00', '2027-12-18 08:00:00'),
       (29, 3, 4, '华为手机', 'huawei_mate40_1', 30, 12, 5, 3, 6, '高端大气上档次', '0', 2000.00, 5999.00, 5699.00,
        '2022-04-24 15:43:05', '2022-04-24 15:57:44', 31, 1, '/img/upload/mate40.jpg', '2022-03-17 08:00:00',
        '2042-07-24 08:00:00'),
       (30, 1, 2, '风扇', 'midea1003', 20, 8, 5, 6, 6, '没有风，只有声。。。', '0', 100.00, 299.00, 249.00,
        '2022-04-08 15:44:22', NULL, 1, NULL, '/img/upload/midea_blower.png', '2022-04-01 08:00:00',
        '2038-09-15 08:00:00'),
       (31, 1, NULL, 'test', 'etste2023', 1, 2, 1, 1, 1, '123123', '0', 10.00, 20.00, 15.00, '2023-10-16 11:46:01',
        NULL, 1, NULL, '/img/upload/', '2023-10-16 08:00:00', NULL),
       (32, 1, NULL, '123', '123', 123, 2, 1, 1, 1, '123', '0', 123.00, 123.00, 123.00, '2023-10-16 11:49:03', NULL, 1,
        NULL, '/img/upload/', '2023-10-16 08:00:00', NULL);
/*!40000 ALTER TABLE `product`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_type`
(
    `type_id`   int NOT NULL AUTO_INCREMENT,
    `parent_id` int          DEFAULT NULL,
    `type_code` varchar(50)  DEFAULT NULL,
    `type_name` varchar(100) DEFAULT NULL,
    `type_desc` varchar(300) DEFAULT NULL,
    PRIMARY KEY (`type_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 14
  DEFAULT CHARSET = utf8 COMMENT ='商品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type`
    DISABLE KEYS */;
INSERT INTO `product_type`
VALUES (1, 0, 'appliance', '家电类', '种类齐全，货源充足'),
       (2, 1, 'washer', '洗衣机', '全是洗衣机啊~~'),
       (3, 1, 'televison', '电视机', '全是电视机啊~~'),
       (4, 0, 'fruit-vegetable', '果蔬类', '全是果蔬啊~~'),
       (5, 4, 'vegetable', '蔬菜', '全是蔬菜啊~~'),
       (6, 4, 'fruit', '水果', '全是水果啊~~'),
       (7, 1, 'air-condition', '空调', '很凉快'),
       (8, 1, 'blower', '风扇', '也很凉快'),
       (11, 0, 'phone', '手机', '大家都机不离手'),
       (12, 11, 'huawei', '华为手机', '中华有为'),
       (13, 11, 'apple', '苹果手机', '一般般，小心被定位');
/*!40000 ALTER TABLE `product_type`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role`
(
    `role_id`     int NOT NULL AUTO_INCREMENT,
    `role_name`   varchar(100) DEFAULT NULL,
    `role_desc`   varchar(300) DEFAULT NULL,
    `role_code`   varchar(100) DEFAULT NULL,
    `role_state`  char(1)      DEFAULT NULL COMMENT '1 启用 0 禁用',
    `create_by`   int          DEFAULT NULL,
    `create_time` datetime     DEFAULT NULL,
    `update_by`   int          DEFAULT NULL,
    `update_time` datetime     DEFAULT NULL,
    PRIMARY KEY (`role_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 18
  DEFAULT CHARSET = utf8 COMMENT ='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role`
    DISABLE KEYS */;
INSERT INTO `role`
VALUES (1, '超级管理员', '超级管理员', 'supper_manage', '1', 1, '2017-11-14 16:49:12', 1, '2017-11-14 16:49:20'),
       (11, '采购员', '采购管理员', 'purchase_man', '1', 1, '2022-04-22 12:29:00', 1, '2022-04-22 13:56:29'),
       (12, '入库管理员', '入库管理员', 'in_store', '1', 1, '2022-04-22 13:56:17', NULL, NULL),
       (13, '商品', '商品管理员', 'commodity_manager', '1', 1, '2022-04-22 13:57:42', NULL, NULL),
       (14, '出库管理员', '出库管理员', 'out_store', '1', 1, '2022-04-22 14:00:00', NULL, NULL),
       (15, '调货', '调货管理员', 'transshipment_manager', '1', 1, '2022-04-22 14:00:38', NULL, NULL),
       (16, '仓库', '仓库管理员', 'store_manager', '1', 1, '2022-04-24 15:12:56', NULL, NULL),
       (17, '生产员', '生产员', 'produce_man', '1', 1, '2023-10-10 15:41:14', 1, '2023-10-10 15:41:21');
/*!40000 ALTER TABLE `role`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_auth`
--

DROP TABLE IF EXISTS `role_auth`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_auth`
(
    `role_auth_id` int NOT NULL AUTO_INCREMENT,
    `role_id`      int DEFAULT NULL,
    `auth_id`      int DEFAULT NULL,
    PRIMARY KEY (`role_auth_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 968
  DEFAULT CHARSET = utf8 COMMENT ='角色权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_auth`
--

LOCK TABLES `role_auth` WRITE;
/*!40000 ALTER TABLE `role_auth`
    DISABLE KEYS */;
INSERT INTO `role_auth`
VALUES (118, 4, 1),
       (119, 4, 2),
       (120, 4, 3),
       (121, 4, 10),
       (122, 4, 23),
       (123, 4, 24),
       (124, 4, 35),
       (125, 4, 36),
       (126, 4, 4),
       (127, 4, 5),
       (128, 4, 6),
       (129, 4, 27),
       (130, 4, 28),
       (131, 4, 7),
       (132, 4, 8),
       (133, 4, 9),
       (134, 5, 1),
       (135, 5, 2),
       (136, 5, 3),
       (137, 5, 10),
       (138, 8, 1),
       (139, 8, 2),
       (140, 8, 3),
       (141, 8, 10),
       (142, 8, 23),
       (143, 8, 24),
       (694, 16, 63),
       (695, 16, 64),
       (696, 16, 69),
       (697, 16, 70),
       (698, 11, 42),
       (699, 11, 50),
       (700, 11, 92),
       (701, 11, 93),
       (702, 11, 94),
       (703, 11, 97),
       (704, 11, 76),
       (705, 11, 53),
       (706, 11, 56),
       (707, 11, 63),
       (708, 11, 64),
       (709, 12, 54),
       (710, 12, 57),
       (711, 12, 95),
       (712, 12, 63),
       (713, 12, 64),
       (714, 13, 42),
       (715, 13, 50),
       (716, 13, 92),
       (717, 13, 93),
       (718, 13, 94),
       (719, 13, 97),
       (720, 13, 76),
       (721, 13, 63),
       (722, 13, 64),
       (734, 15, 42),
       (735, 15, 50),
       (736, 15, 92),
       (737, 15, 93),
       (738, 15, 94),
       (739, 15, 97),
       (740, 15, 76),
       (741, 15, 63),
       (742, 15, 64),
       (743, 15, 68),
       (744, 15, 71),
       (745, 15, 96),
       (911, 1, 1),
       (912, 1, 2),
       (913, 1, 3),
       (914, 1, 10),
       (915, 1, 23),
       (916, 1, 24),
       (917, 1, 25),
       (918, 1, 26),
       (919, 1, 35),
       (920, 1, 36),
       (921, 1, 4),
       (922, 1, 5),
       (923, 1, 6),
       (924, 1, 27),
       (925, 1, 28),
       (926, 1, 30),
       (927, 1, 31),
       (928, 1, 37),
       (929, 1, 42),
       (930, 1, 50),
       (931, 1, 92),
       (932, 1, 93),
       (933, 1, 94),
       (934, 1, 97),
       (935, 1, 76),
       (936, 1, 53),
       (937, 1, 56),
       (938, 1, 54),
       (939, 1, 57),
       (940, 1, 95),
       (941, 1, 55),
       (942, 1, 58),
       (943, 1, 63),
       (944, 1, 64),
       (945, 1, 69),
       (946, 1, 70),
       (947, 1, 72),
       (948, 1, 74),
       (949, 1, 98),
       (950, 1, 99),
       (951, 1, 100),
       (952, 1, 101),
       (953, 1, 102),
       (954, 1, 104),
       (955, 14, 42),
       (956, 14, 50),
       (957, 14, 92),
       (958, 14, 93),
       (959, 14, 94),
       (960, 14, 97),
       (961, 14, 76),
       (962, 14, 55),
       (963, 14, 58),
       (964, 14, 63),
       (965, 14, 64),
       (966, 14, 102),
       (967, 14, 104);
/*!40000 ALTER TABLE `role_auth`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store`
(
    `store_id`      int NOT NULL AUTO_INCREMENT,
    `store_name`    varchar(100) DEFAULT NULL,
    `store_num`     varchar(20)  DEFAULT NULL,
    `store_address` varchar(100) DEFAULT NULL,
    `concat`        varchar(50)  DEFAULT NULL,
    `phone`         varchar(20)  DEFAULT NULL,
    PRIMARY KEY (`store_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8 COMMENT ='仓库表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store`
    DISABLE KEYS */;
INSERT INTO `store`
VALUES (1, '西安仓库', 'xa1', '西安市雁塔区', '张三', '13829086629'),
       (2, '北京仓库', 'bj2', '北京市朝阳区 ', '王麻子', '15229267291'),
       (3, '上海仓库', 'sh3', '上海市浦东区', '李四', '18092647320');
/*!40000 ALTER TABLE `store`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supply`
--

DROP TABLE IF EXISTS `supply`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supply`
(
    `supply_id`        int NOT NULL AUTO_INCREMENT,
    `supply_num`       varchar(20)  DEFAULT NULL,
    `supply_name`      varchar(100) DEFAULT NULL,
    `supply_introduce` longtext,
    `concat`           varchar(50)  DEFAULT NULL,
    `phone`            varchar(20)  DEFAULT NULL,
    `address`          varchar(100) DEFAULT NULL,
    `is_delete`        char(1)      DEFAULT '0' COMMENT '0:可用  1:不可用',
    PRIMARY KEY (`supply_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8 COMMENT ='供货商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply`
--

LOCK TABLES `supply` WRITE;
/*!40000 ALTER TABLE `supply`
    DISABLE KEYS */;
INSERT INTO `supply`
VALUES (1, 'zjsh', '浙江三禾竹木有限公司', '贷款是否会为加快和规范健康环境如何根据', '任伟', '15287653921',
        '浙江省丽水市', '0'),
       (2, 'lqlo', '龙泉绿欧食品有限公司', NULL, '张三', '18134532830', '浙江省龙泉市', '0'),
       (3, 'dhgy', '帝豪供应链公司', NULL, '李四', '17493976543', '陕西省西安市', '0'),
       (4, 'haier', '海尔集团',
        '海尔智家为用户提供衣、食、住、娱的智慧全场景解决方案，全面提升用户生活品质，以“云”体验、全链路服务、个性化智慧终端，实现交互、体验、销售、服务于一体的全流程生态平台。',
        '周云杰', '4006999511', '山东省青岛市', '0'),
       (5, 'midea', '美的集团股份有限公司',
        '科技尽善，生活尽美”– 美的集团秉承用科技创造美好生活的经营理念，如今已成为一家集智能家居事业群、机电事业群、暖通与楼宇事业部、机器人及自动化事业部、数字化创新业务五大板块为一体的全球化科技集团，产品及服务惠及全球200多个国家和地区约4亿用户。形成美的、小天鹅、东芝、华凌、布谷、COLMO、Clivet、Eureka、库卡、GMCC、威灵在内的多品牌组合。',
        '方洪波', '075726338788', '广东省佛山市', '0');
/*!40000 ALTER TABLE `supply`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config`
(
    `id`          int unsigned     DEFAULT NULL,
    `param_key`   varchar(200)     DEFAULT NULL,
    `param_value` varchar(200)     DEFAULT NULL,
    `status`      tinyint unsigned DEFAULT NULL,
    `remark`      varchar(200)     DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config`
    DISABLE KEYS */;
INSERT INTO `sys_config`
VALUES (1, 'attendance_start_time', '06:00', 1, '上班考勤开始时间'),
       (2, 'attendance_time', '08:30', 1, '上班时间'),
       (3, 'attendance_end_time', '23:59', 1, '上班考勤截止时间'),
       (4, 'closing_start_time', '16:30', 1, '下班考勤开始时间'),
       (5, 'closing_time', '17:30', 1, '下班时间'),
       (6, 'closing_end_time', '23:59', 1, '下班考勤截止时间');
/*!40000 ALTER TABLE `sys_config`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit`
(
    `unit_id`   int NOT NULL AUTO_INCREMENT,
    `unit_name` varchar(20) DEFAULT NULL,
    `unit_desc` varchar(20) DEFAULT NULL,
    PRIMARY KEY (`unit_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8 COMMENT ='规格单位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit`
    DISABLE KEYS */;
INSERT INTO `unit`
VALUES (1, '箱/件', '箱/件'),
       (2, '个', '个'),
       (3, '公斤', '公斤'),
       (4, '只', '只'),
       (5, '克', '克'),
       (6, '台', '台');
/*!40000 ALTER TABLE `unit`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info`
(
    `user_id`     int NOT NULL AUTO_INCREMENT,
    `user_code`   varchar(50)  DEFAULT NULL,
    `user_name`   varchar(50)  DEFAULT NULL,
    `user_pwd`    varchar(100) DEFAULT NULL,
    `user_type`   char(1)      DEFAULT NULL COMMENT '1 超级管理员 、 2  管理员 、 3 普通用户',
    `user_state`  char(1)      DEFAULT NULL COMMENT '0 未审核 、1 已审核',
    `is_delete`   char(1)      DEFAULT NULL COMMENT '0 正常、 1 已删除',
    `create_by`   int          DEFAULT NULL,
    `create_time` datetime     DEFAULT NULL,
    `update_by`   int          DEFAULT NULL,
    `update_time` datetime     DEFAULT NULL,
    PRIMARY KEY (`user_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 37
  DEFAULT CHARSET = utf8 COMMENT ='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info`
    DISABLE KEYS */;
INSERT INTO `user_info`
VALUES (1, 'admin', '超级管理员', 'c431d451c81e75ffac75a640590ed0a1', NULL, '1', '0', 1, '2017-11-14 15:14:31', 1,
        '2022-04-24 15:33:12'),
       (3, 'root', 'root', 'c431d451c81e75ffac75a640590ed0a1', NULL, '1', '0', 1, '2017-11-16 19:31:49', 1,
        '2022-03-16 17:28:34'),
       (5, 'asdsjkb', '可爱吧1', 'c431d451c81e75ffac75a640590ed0a1', NULL, '1', '1', 1, '2017-11-16 21:25:41', 1,
        '2022-03-15 14:57:44'),
       (6, 'dasdasf', 'start', 'c431d451c81e75ffac75a640590ed0a1', '1', '1', '1', 1, '2017-11-16 21:36:41', 1,
        '2017-11-21 10:45:57'),
       (7, 'fsdfs', 'start', 'c431d451c81e75ffac75a640590ed0a1', '1', '0', '1', 1, '2017-11-16 21:39:09', 1,
        '2017-11-21 10:44:35'),
       (10, 'root', 'root', 'c431d451c81e75ffac75a640590ed0a1', '3', '0', '1', 1, '2017-11-17 10:48:24', NULL, NULL),
       (19, 'static', 'static', 'c431d451c81e75ffac75a640590ed0a1', '2', '0', '0', 1, '2017-11-29 22:10:51', NULL,
        NULL),
       (20, 'public', 'public', 'c431d451c81e75ffac75a640590ed0a1', '2', '1', '0', 1, '2017-12-01 14:40:15', NULL,
        NULL),
       (21, 'wk', '晴空', NULL, NULL, '0', '0', 1, '2022-03-17 17:24:00', NULL, NULL),
       (23, 'zhangsan', '张三', NULL, NULL, '0', '1', 1, '2022-04-08 16:18:52', NULL, NULL),
       (24, 'lisi', '李四', NULL, NULL, '0', '1', 1, '2022-04-08 16:20:19', NULL, NULL),
       (25, 'wangwu', '王五', NULL, NULL, '0', '1', 1, '2022-04-08 16:20:43', NULL, NULL),
       (26, 'liuliu', '刘六', NULL, NULL, '0', '1', 1, '2022-04-08 16:21:14', NULL, NULL),
       (27, 'wzl', '我这里', NULL, NULL, '1', '1', 1, '2022-04-19 17:09:13', NULL, NULL),
       (28, 'caigou', '采购', 'c431d451c81e75ffac75a640590ed0a1', NULL, '1', '0', 1, '2022-04-22 13:42:35', NULL, NULL),
       (29, 'ruku', '入库管理员', 'c431d451c81e75ffac75a640590ed0a1', NULL, '1', '0', 1, '2022-04-22 13:50:25', NULL,
        NULL),
       (30, 'chuku', '出库管理员', 'c431d451c81e75ffac75a640590ed0a1', NULL, '1', '0', 1, '2022-04-22 13:53:20', NULL,
        NULL),
       (31, 'shangpin', '商品管理员', 'c431d451c81e75ffac75a640590ed0a1', NULL, '1', '0', 1, '2022-04-22 13:57:11',
        NULL, NULL),
       (32, 'diaohuo', '调货管理员', 'c431d451c81e75ffac75a640590ed0a1', NULL, '1', '0', 1, '2022-04-24 15:23:22', NULL,
        NULL),
       (33, 'cangku', '仓库管理员', 'c431d451c81e75ffac75a640590ed0a1', NULL, '1', '0', 1, '2022-04-24 15:23:48', NULL,
        NULL),
       (34, 'outadmin', 'outadmin', '90b3836e4fa684bc2d6cbe7b2cf95a91', NULL, '1', '0', 1, '2023-10-11 11:40:55', 1,
        '2023-10-11 11:41:01'),
       (35, 'puradmin', 'puradmin', 'a335f642c4e0ed121dead221836b3e53', NULL, '1', '0', 1, '2023-10-12 15:57:38', 1,
        '2023-10-12 15:57:40'),
       (36, 'inadmin', 'inadmin', '682225b9ccd49f7e641f428e30ce4968', NULL, '1', '0', 1, '2023-10-12 16:03:35', 1,
        '2023-10-12 16:03:37');
/*!40000 ALTER TABLE `user_info`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role`
(
    `user_role_id` int NOT NULL AUTO_INCREMENT,
    `role_id`      int DEFAULT NULL,
    `user_id`      int DEFAULT NULL,
    PRIMARY KEY (`user_role_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 60
  DEFAULT CHARSET = utf8 COMMENT ='用户角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role`
    DISABLE KEYS */;
INSERT INTO `user_role`
VALUES (11, 3, 7),
       (12, 5, 7),
       (13, 3, 6),
       (14, 5, 6),
       (15, 5, 9),
       (20, 1, 1),
       (23, 3, 5),
       (25, 4, 5),
       (26, 5, 5),
       (27, 5, 19),
       (28, 5, 20),
       (45, 4, 3),
       (46, 3, 3),
       (47, 6, 3),
       (48, 2, 3),
       (49, 11, 28),
       (51, 14, 30),
       (52, 12, 29),
       (53, 13, 31),
       (54, 15, 32),
       (55, 16, 33),
       (57, 11, 35),
       (58, 12, 36),
       (59, 14, 34);
/*!40000 ALTER TABLE `user_role`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workday`
--

DROP TABLE IF EXISTS `workday`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workday`
(
    `id`   int  DEFAULT NULL,
    `date` date DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

create table if not exists bus_log
(
    id          bigint auto_increment comment '自增id'
        primary key,
    bus_name    varchar(100) null comment '业务名称',
    bus_descrip varchar(255) null comment '业务操作描述',
    oper_person varchar(100) null comment '操作人',
    oper_time   datetime     null comment '操作时间',
    ip_from     varchar(50)  null comment '操作来源ip',
    param_file  varchar(255) null comment '操作参数报文文件'
)
    comment '业务操作日志' default charset = 'utf8';


--
-- Dumping data for table `workday`
--

LOCK TABLES `workday` WRITE;
/*!40000 ALTER TABLE `workday`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `workday`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2023-10-16 14:32:16
