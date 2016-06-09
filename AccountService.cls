/************************************************************************************
 * Copyright by Autodesk, Inc.
 * 
 * The information contained herein is confidential, proprietary to
 * Autodesk, Inc., and considered a trade secret as defined in section
 * 499C of the penal code of the State of California. Use of
 * this information by anyone other than authorized employees of 
 * Autodesk, Inc. is granted only under a written non-disclosure
 * agreement, expressly prescribing the scope and manner of such use.
 * 
 * $Id$ : AccountService 
 * $Created Date$ : 8/5/2013
 * $Author$ : Sarma Peri
 * $Description$ : This is the Account Service Interface which has all the service methods related to Account
 *
 * $Modified By$ : Chaithanya Godla
 * $Modified Date$ :  10/29/2013 
 * Description$: Added getAccountContacts() for US24274  
 *************************************************************************************************/

public interface AccountService {

	/**
     * @description - Accepts account object type as an input and checks for the Named Account Group 
     * field i. Named_Account_Group__c and returns true if the account is a major account. 
	 * @param - SObject Account
     * @return- Boolean
     */
	Boolean isMajorAccount(Account acc);
	
	
	/**
     * @description - Accepts account object type as an input and checks for the field Parent Named 
     * Account Group i.e. Parent_Named_Account_Group__c and returns true if the account is child to major account. 
	 * @param - SObject Account
     * @return- Boolean
     */	
	Boolean isChildOfMajorAccount(Account acc);
	
	
	/**
     * @description - Accepts account object type as an input, checks the field Platinum_Subscription_Counts__c and 
     * returns true if the count is greater than 0 and hence the account has Platinum Subscription.
	 * @param - SObject Account
     * @return- Boolean
     */	
	Boolean hasPlatinumSubscription(Account acc);
	
	
	/**
     * Accepts accountId as an input and returns list of Contacts(First Name, Last Name,Email and Phone Number) 
     * associated with this account. You can limit the number of contacts that are returned by specifying the
     * contact limit. Limit 0 means all the contacts are returned( Maximum of 10000)
     */	
	List<Contact> getAccountContacts(Id accountId , Integer contactLimit);
	
	Map<Id, CaseDTO.CaseAccount> searchAccounts(CaseDTO.SearchCriteria searchCriteria);
	Map<Id, CaseDTO.CaseAccount> searchAccounts(Set<Id> accountIds);
	
	/*
     * updates the Account record. Input is Account Object.
    */
    void updateCaseAccount(CaseDTO.CaseAccount accountObj);
	
}