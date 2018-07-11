<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alert_manager_if_employee_deactivated</fullName>
        <description>Alert manager if employee deactivated</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/employee_deactivated</template>
    </alerts>
    <fieldUpdates>
        <fullName>Record_type_non_technical</fullName>
        <description>If employee is not active set Record type to non technical</description>
        <field>RecordTypeId</field>
        <lookupValue>Non_Technical</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Record type non technical</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>manager_email</fullName>
        <field>Manager_email__c</field>
        <formula>Manager__r.email__c</formula>
        <name>manager email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>role</fullName>
        <field>Employee_Role__c</field>
        <formula>Full_Name__c &amp;  &quot; &quot; &amp;  Employee_Role__c</formula>
        <name>role</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>emp_role</fullName>
        <actions>
            <name>role</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>True</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
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
        <fullName>non technical if not current employee</fullName>
        <actions>
            <name>Record_type_non_technical</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Employee__c.Current_Employee__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>non technical if not current employee</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>record_deactivated</fullName>
        <actions>
            <name>Alert_manager_if_employee_deactivated</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Employee__c.Is_Active__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
