<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>New_project_created</fullName>
        <description>New project created</description>
        <protected>false</protected>
        <recipients>
            <recipient>priyanka.bokand@eternussolutions.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_project</template>
    </alerts>
    <alerts>
        <fullName>Project_end_date_in_5_days</fullName>
        <description>Project end date in 5 days</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Project_Due_date</template>
    </alerts>
    <fieldUpdates>
        <fullName>change_status</fullName>
        <field>Status__c</field>
        <literalValue>Closed</literalValue>
        <name>change status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>manager_email</fullName>
        <field>Manager_email__c</field>
        <formula>Manager__r.email__c</formula>
        <name>manager email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>End date today</fullName>
        <actions>
            <name>change_status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF( End_Date__c ==  TODAY() , True, False)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>New project</fullName>
        <actions>
            <name>New_project_created</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>New_project_created</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <formula>True</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>manager email</fullName>
        <actions>
            <name>manager_email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>True</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>project due date</fullName>
        <actions>
            <name>Project_end_date_in_5_days</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Project_end_date_in_5_days</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <formula>True</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>New_project_created</fullName>
        <assignedTo>priyanka.bokand@eternussolutions.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>30</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Project_Details__c.Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>New project created</subject>
    </tasks>
    <tasks>
        <fullName>Project_end_date_in_5_days</fullName>
        <assignedTo>priyanka.bokand@eternussolutions.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>-5</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Project_Details__c.End_Date__c</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>Project end date in 5 days</subject>
    </tasks>
</Workflow>
