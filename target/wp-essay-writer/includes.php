<?php
	// Framework API
	include_once('includes/api/AdminAPI.php');
	include_once('includes/api/MailAPI.php');
	include_once('includes/api/SecurityAPI.php');
	include_once('includes/api/UIDisplayAPI.php');
	// Party API
	include_once('includes/api/PartyAPI.php');
	include_once('includes/api/PartyEditAPI.php');
	include_once('includes/api/PartyCreateAPI.php');
	include_once('includes/api/PersonAPI.php');
	include_once('includes/api/PartyGroupAPI.php');
	include_once('includes/api/ContentUserAPI.php');
	include_once('includes/api/UserPartyAPI.php');
	include_once('includes/api/UserLoginAPI.php');
	// File management API
	include_once('includes/api/FileAPI.php');
	include_once('includes/api/FileUploadValidatorAPI.php');
	// Controllers
	include_once('includes/controller/URLRewriteProcessor.php');
	include_once('includes/controller/ArtifactRequestProcessor.php');
	include_once('includes/controller/ArtifactAjaxRequestProcessor.php');
	// Utility Classes
	include_once('includes/utils/PageUtils.php');
	include_once('includes/utils/LogUtils.php');
	include_once('includes/utils/UserUtils.php');
	include_once('includes/utils/MenuUtils.php');
	include_once('includes/utils/DateUtils.php');
	include_once('includes/utils/EnqueueUtils.php');
	include_once('includes/utils/ArtifactUtils.php');
	include_once('includes/utils/EntityAPIUtils.php');
	include_once('includes/utils/EntityStringUtils.php');
	include_once('includes/utils/EntityRequestUtils.php');
	include_once('includes/utils/CustomFieldsUtils.php');
	include_once('includes/utils/CustomPostTypesUtils.php');
	include_once('includes/utils/TemplateFunctions.php');
	include_once('includes/utils/UIComponentRegistry.php');
	include_once('includes/utils/ArtifactRequestProcessorUtils.php');
	include_once('includes/utils/ArtifactAjaxRequestProcessorUtils.php');
	// UI Components
	include_once('includes/uicomponent/AbstractUIComponentModel.php');
	include_once('includes/uicomponent/AbstractUIComponent.php');
	include_once('includes/uicomponent/UIComponentModel.php');
	include_once('includes/uicomponent/UIComponent.php');
	// View
	include_once('includes/view/AbstractPage.php');
	include_once('includes/view/AbstractPageModel.php');
	include_once('includes/view/PortalPage.php');
	include_once('includes/view/PortalPageModel.php');
	include_once('includes/view/PortalErrorPage.php');
	include_once('includes/view/PortalErrorPageModel.php');
	include_once('includes/view/EntityPortalPage.php');
	include_once('includes/view/EntityPortalPageModel.php');
	include_once('includes/view/ListEntityPage.php');
	include_once('includes/view/ListEntityPageModel.php');
	include_once('includes/view/CreateEntityPage.php');
	include_once('includes/view/CreateEntityPageModel.php');
	include_once('includes/view/EditEntityPage.php');
	include_once('includes/view/EditEntityPageModel.php');
	include_once('includes/view/ViewEntityPage.php');
	include_once('includes/view/ViewEntityPageModel.php');
	include_once('includes/view/FrontendPage.php');
	include_once('includes/view/ViewActionsController.php');

        // Model
        include_once('includes/abstracts/CurrencyCPT.php');
        include_once('includes/abstracts/Currency.php');
        include_once('includes/abstracts/CountryCPT.php');
        include_once('includes/abstracts/Country.php');
        include_once('includes/abstracts/BusinessCPT.php');
        include_once('includes/abstracts/Business.php');
        include_once('includes/abstracts/PartyCategoryCPT.php');
        include_once('includes/abstracts/PartyCategory.php');
        include_once('includes/abstracts/PartyTypeCPT.php');
        include_once('includes/abstracts/PartyType.php');
        include_once('includes/abstracts/RoleTypeCPT.php');
        include_once('includes/abstracts/RoleType.php');
        include_once('includes/abstracts/PartyCPT.php');
        include_once('includes/abstracts/Party.php');
        include_once('includes/abstracts/PartyRoleCPT.php');
        include_once('includes/abstracts/PartyRole.php');
        include_once('includes/abstracts/PartyGroupCPT.php');
        include_once('includes/abstracts/PartyGroup.php');
        include_once('includes/abstracts/PersonCPT.php');
        include_once('includes/abstracts/Person.php');
        include_once('includes/abstracts/PartyProfileCPT.php');
        include_once('includes/abstracts/PartyProfile.php');
        include_once('includes/abstracts/BillingAccountCPT.php');
        include_once('includes/abstracts/BillingAccount.php');
        include_once('includes/abstracts/PartyImageCPT.php');
        include_once('includes/abstracts/PartyImage.php');
        include_once('includes/abstracts/PartyFileCPT.php');
        include_once('includes/abstracts/PartyFile.php');
        include_once('includes/abstracts/SocialMediaAccountTypeCPT.php');
        include_once('includes/abstracts/SocialMediaAccountType.php');
        include_once('includes/abstracts/SocialMediaAccountCPT.php');
        include_once('includes/abstracts/SocialMediaAccount.php');
        include_once('includes/abstracts/ContactRequestCPT.php');
        include_once('includes/abstracts/ContactRequest.php');
        include_once('includes/abstracts/QualificationTypeCPT.php');
        include_once('includes/abstracts/QualificationType.php');
        include_once('includes/abstracts/AcademicLevelCPT.php');
        include_once('includes/abstracts/AcademicLevel.php');
        include_once('includes/abstracts/DocumentTypeCPT.php');
        include_once('includes/abstracts/DocumentType.php');
        include_once('includes/abstracts/NoOfPagesCPT.php');
        include_once('includes/abstracts/NoOfPages.php');
        include_once('includes/abstracts/UrgencyCPT.php');
        include_once('includes/abstracts/Urgency.php');
        include_once('includes/abstracts/SubjectAreaCPT.php');
        include_once('includes/abstracts/SubjectArea.php');
        include_once('includes/abstracts/SubjectAreaImageCPT.php');
        include_once('includes/abstracts/SubjectAreaImage.php');
        include_once('includes/abstracts/SubjectCPT.php');
        include_once('includes/abstracts/Subject.php');
        include_once('includes/abstracts/WritingStyleCPT.php');
        include_once('includes/abstracts/WritingStyle.php');
        include_once('includes/abstracts/PartyEducationCPT.php');
        include_once('includes/abstracts/PartyEducation.php');
        include_once('includes/abstracts/PartySubjectCPT.php');
        include_once('includes/abstracts/PartySubject.php');
        include_once('includes/abstracts/PartyReviewCPT.php');
        include_once('includes/abstracts/PartyReview.php');
        include_once('includes/abstracts/ClassificationTypeCPT.php');
        include_once('includes/abstracts/ClassificationType.php');
        include_once('includes/abstracts/ClassificationCPT.php');
        include_once('includes/abstracts/Classification.php');
        include_once('includes/abstracts/ContentCategoryCPT.php');
        include_once('includes/abstracts/ContentCategory.php');
        include_once('includes/abstracts/ContentTypeCPT.php');
        include_once('includes/abstracts/ContentType.php');
        include_once('includes/abstracts/ContentCPT.php');
        include_once('includes/abstracts/Content.php');
        include_once('includes/abstracts/ContentFileCPT.php');
        include_once('includes/abstracts/ContentFile.php');
        include_once('includes/abstracts/ContentClassificationCPT.php');
        include_once('includes/abstracts/ContentClassification.php');
        include_once('includes/abstracts/ContentOrderTypeCPT.php');
        include_once('includes/abstracts/ContentOrderType.php');
        include_once('includes/abstracts/ContentOrderStatusCPT.php');
        include_once('includes/abstracts/ContentOrderStatus.php');
        include_once('includes/abstracts/PaymentStatusCPT.php');
        include_once('includes/abstracts/PaymentStatus.php');
        include_once('includes/abstracts/ContentOrderCPT.php');
        include_once('includes/abstracts/ContentOrder.php');
        include_once('includes/abstracts/ContentOrderFileCPT.php');
        include_once('includes/abstracts/ContentOrderFile.php');
        include_once('includes/abstracts/AccountTransactionTypeCPT.php');
        include_once('includes/abstracts/AccountTransactionType.php');
        include_once('includes/abstracts/AccountTransactionStatusCPT.php');
        include_once('includes/abstracts/AccountTransactionStatus.php');
        include_once('includes/abstracts/AccountTransactionCPT.php');
        include_once('includes/abstracts/AccountTransaction.php');
        include_once('includes/abstracts/DisputeTypeCPT.php');
        include_once('includes/abstracts/DisputeType.php');
        include_once('includes/abstracts/DisputeStatusCPT.php');
        include_once('includes/abstracts/DisputeStatus.php');
        include_once('includes/abstracts/DisputeCPT.php');
        include_once('includes/abstracts/Dispute.php');
        // Entity API
        include_once('includes/api/EntityAPI.php');
        include_once('includes/api/EntityPersistenceAPI.php');

        // API
        include_once('includes/api/BusinessAPI.php');
        include_once('includes/api/PartyRoleAPI.php');
        include_once('includes/api/PartyProfileAPI.php');
        include_once('includes/api/BillingAccountAPI.php');
        include_once('includes/api/PartyImageAPI.php');
        include_once('includes/api/ContactRequestAPI.php');
        include_once('includes/api/SubjectAreaAPI.php');
        include_once('includes/api/SubjectAPI.php');
        include_once('includes/api/ContentOrderAPI.php');
        include_once('includes/api/ContentOrderFileAPI.php');
        include_once('includes/api/AccountTransactionAPI.php');
        include_once('includes/api/DisputeAPI.php');
        include_once('includes/api/BusinessSummaryAPI.php');
        include_once('includes/api/MenuAPI.php');
        include_once('includes/api/BasicStatsAPI.php');
        include_once('includes/api/StudentAPI.php');
        include_once('includes/api/TutorAPI.php');
        include_once('includes/api/RatingAPI.php');
        include_once('includes/api/QuestionAPI.php');
        include_once('includes/api/ContentOrderUserAPI.php');
        include_once('includes/api/ContentOrderPaymentAPI.php');
        include_once('includes/api/IPNListenerAPI.php');
        include_once('includes/controller/SigninAjaxRequestProcessor.php');
        include_once('includes/controller/SignupAjaxRequestProcessor.php');
        include_once('includes/controller/PasswordAjaxRequestProcessor.php');
        include_once('includes/controller/PersonAjaxRequestProcessor.php');
        include_once('includes/controller/ContentOrderAjaxRequestProcessor.php');
	// Pages
        include_once('includes/view/SigninPage.php');
        include_once('includes/view/SignupPage.php');
        include_once('includes/view/PasswordPage.php');
        include_once('includes/view/DashboardPage.php');
	// UI Components
    include_once('includes/uicomponent/PortalMenuHeader.php');
    include_once('includes/uicomponent/PortalMenuHeaderModel.php');
    include_once('includes/uicomponent/PortalMenuMain.php');
    include_once('includes/uicomponent/PortalMenuMainModel.php');
    include_once('includes/uicomponent/DashboardMetricsTable.php');
    include_once('includes/uicomponent/DashboardMetricsTableModel.php');
    include_once('includes/uicomponent/DashboardMetricsChart.php');
    include_once('includes/uicomponent/DashboardMetricsChartModel.php');
    include_once('includes/uicomponent/EntityFormFieldsPanel.php');
    include_once('includes/uicomponent/EntityFormFieldsPanelModel.php');
	// View
    include_once('includes/view/party/ListPartyPage.php');
    include_once('includes/view/party/ListPartyPageModel.php');


?>