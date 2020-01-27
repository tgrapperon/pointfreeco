import Either
import GitHub
import Models
import PointFreePrelude
import Prelude
import Stripe

public struct Client {
  public var addUserIdToSubscriptionId: (Models.User.Id, Models.Subscription.Id) -> EitherIO<Error, Prelude.Unit>
  public var createEnterpriseAccount: (String, EnterpriseAccount.Domain, Models.Subscription.Id) -> EitherIO<Error, EnterpriseAccount?>
  public var createEnterpriseEmail: (EmailAddress, User.Id) -> EitherIO<Error, EnterpriseEmail?>
  public var createFeedRequestEvent: (FeedRequestEvent.FeedType, String, Models.User.Id) -> EitherIO<Error, Prelude.Unit>
  public var createSubscription: (Stripe.Subscription, Models.User.Id, Bool) -> EitherIO<Error, Models.Subscription?>
  public var deleteEnterpriseEmail: (User.Id) -> EitherIO<Error, Prelude.Unit>
  public var deleteTeamInvite: (TeamInvite.Id) -> EitherIO<Error, Prelude.Unit>
  public var fetchAdmins: () -> EitherIO<Error, [Models.User]>
  public var fetchEmailSettingsForUserId: (Models.User.Id) -> EitherIO<Error, [EmailSetting]>
  public var fetchEnterpriseAccountForDomain: (EnterpriseAccount.Domain) -> EitherIO<Error, EnterpriseAccount?>
  public var fetchEnterpriseAccountForSubscription: (Models.Subscription.Id) -> EitherIO<Error, EnterpriseAccount?>
  public var fetchEnterpriseEmails: () -> EitherIO<Error, [EnterpriseEmail]>
  public var fetchEpisodeCredits: (Models.User.Id) -> EitherIO<Error, [EpisodeCredit]>
  public var fetchFreeEpisodeUsers: () -> EitherIO<Error, [Models.User]>
  public var fetchSubscriptionById: (Models.Subscription.Id) -> EitherIO<Error, Models.Subscription?>
  public var fetchSubscriptionByOwnerId: (Models.User.Id) -> EitherIO<Error, Models.Subscription?>
  public var fetchSubscriptionTeammatesByOwnerId: (Models.User.Id) -> EitherIO<Error, [Models.User]>
  public var fetchTeamInvite: (TeamInvite.Id) -> EitherIO<Error, TeamInvite?>
  public var fetchTeamInvites: (Models.User.Id) -> EitherIO<Error, [TeamInvite]>
  public var fetchUserByGitHub: (GitHubUser.Id) -> EitherIO<Error, Models.User?>
  public var fetchUserById: (Models.User.Id) -> EitherIO<Error, Models.User?>
  public var fetchUsersSubscribedToNewsletter: (EmailSetting.Newsletter, Either<Prelude.Unit, Prelude.Unit>?) -> EitherIO<Error, [Models.User]>
  public var fetchUsersToWelcome: (Int) -> EitherIO<Error, [Models.User]>
  public var incrementEpisodeCredits: ([Models.User.Id]) -> EitherIO<Error, [Models.User]>
  public var insertTeamInvite: (EmailAddress, Models.User.Id) -> EitherIO<Error, TeamInvite>
  public var migrate: () -> EitherIO<Error, Prelude.Unit>
  public var redeemEpisodeCredit: (Int, Models.User.Id) -> EitherIO<Error, Prelude.Unit>
  public var registerUser: (GitHubUserEnvelope, EmailAddress) -> EitherIO<Error, Models.User?>
  public var removeTeammateUserIdFromSubscriptionId: (Models.User.Id, Models.Subscription.Id) -> EitherIO<Error, Prelude.Unit>
  public var sawUser: (Models.User.Id) -> EitherIO<Error, Prelude.Unit>
  public var updateStripeSubscription: (Stripe.Subscription) -> EitherIO<Error, Models.Subscription?>
  public var updateUser: (Models.User.Id, String?, EmailAddress?, [EmailSetting.Newsletter]?, Int?, Models.User.RssSalt?) -> EitherIO<Error, Prelude.Unit>
  public var upsertUser: (GitHubUserEnvelope, EmailAddress) -> EitherIO<Error, Models.User?>

  public init(
    addUserIdToSubscriptionId: @escaping (Models.User.Id, Models.Subscription.Id) -> EitherIO<Error, Prelude.Unit>,
    createEnterpriseAccount: @escaping (String, EnterpriseAccount.Domain, Models.Subscription.Id) -> EitherIO<Error, EnterpriseAccount?>,
    createEnterpriseEmail: @escaping (EmailAddress, User.Id) -> EitherIO<Error, EnterpriseEmail?>,
    createFeedRequestEvent: @escaping (FeedRequestEvent.FeedType, String, Models.User.Id) -> EitherIO<Error, Prelude.Unit>,
    createSubscription: @escaping (Stripe.Subscription, Models.User.Id, Bool) -> EitherIO<Error, Models.Subscription?>,
    deleteEnterpriseEmail: @escaping (User.Id) -> EitherIO<Error, Prelude.Unit>,
    deleteTeamInvite: @escaping (TeamInvite.Id) -> EitherIO<Error, Prelude.Unit>,
    fetchAdmins: @escaping () -> EitherIO<Error, [Models.User]>,
    fetchEmailSettingsForUserId: @escaping (Models.User.Id) -> EitherIO<Error, [EmailSetting]>,
    fetchEnterpriseAccountForDomain: @escaping (EnterpriseAccount.Domain) -> EitherIO<Error, EnterpriseAccount?>,
    fetchEnterpriseAccountForSubscription: @escaping (Models.Subscription.Id) -> EitherIO<Error, EnterpriseAccount?>,
    fetchEnterpriseEmails: @escaping () -> EitherIO<Error, [EnterpriseEmail]>,
    fetchEpisodeCredits: @escaping (Models.User.Id) -> EitherIO<Error, [EpisodeCredit]>,
    fetchFreeEpisodeUsers: @escaping () -> EitherIO<Error, [Models.User]>,
    fetchSubscriptionById: @escaping (Models.Subscription.Id) -> EitherIO<Error, Models.Subscription?>,
    fetchSubscriptionByOwnerId: @escaping (Models.User.Id) -> EitherIO<Error, Models.Subscription?>,
    fetchSubscriptionTeammatesByOwnerId: @escaping (Models.User.Id) -> EitherIO<Error, [Models.User]>,
    fetchTeamInvite: @escaping (TeamInvite.Id) -> EitherIO<Error, TeamInvite?>,
    fetchTeamInvites: @escaping (Models.User.Id) -> EitherIO<Error, [TeamInvite]>,
    fetchUserByGitHub: @escaping (GitHubUser.Id) -> EitherIO<Error, Models.User?>,
    fetchUserById: @escaping (Models.User.Id) -> EitherIO<Error, Models.User?>,
    fetchUsersSubscribedToNewsletter: @escaping (EmailSetting.Newsletter, Either<Prelude.Unit, Prelude.Unit>?) -> EitherIO<Error, [Models.User]>,
    fetchUsersToWelcome: @escaping (Int) -> EitherIO<Error, [Models.User]>,
    incrementEpisodeCredits: @escaping ([Models.User.Id]) -> EitherIO<Error, [Models.User]>,
    insertTeamInvite: @escaping (EmailAddress, Models.User.Id) -> EitherIO<Error, TeamInvite>,
    migrate: @escaping () -> EitherIO<Error, Prelude.Unit>,
    redeemEpisodeCredit: @escaping (Int, Models.User.Id) -> EitherIO<Error, Prelude.Unit>,
    registerUser: @escaping (GitHubUserEnvelope, EmailAddress) -> EitherIO<Error, Models.User?>,
    removeTeammateUserIdFromSubscriptionId: @escaping (Models.User.Id, Models.Subscription.Id) -> EitherIO<Error, Prelude.Unit>,
    sawUser: @escaping (Models.User.Id) -> EitherIO<Error, Prelude.Unit>,
    updateStripeSubscription: @escaping (Stripe.Subscription) -> EitherIO<Error, Models.Subscription?>,
    updateUser: @escaping (Models.User.Id, String?, EmailAddress?, [EmailSetting.Newsletter]?, Int?, Models.User.RssSalt?) -> EitherIO<Error, Prelude.Unit>,
    upsertUser: @escaping (GitHubUserEnvelope, EmailAddress) -> EitherIO<Error, Models.User?>
    ) {
    self.addUserIdToSubscriptionId = addUserIdToSubscriptionId
    self.createEnterpriseAccount = createEnterpriseAccount
    self.createEnterpriseEmail = createEnterpriseEmail
    self.createFeedRequestEvent = createFeedRequestEvent
    self.createSubscription = createSubscription
    self.deleteEnterpriseEmail = deleteEnterpriseEmail
    self.deleteTeamInvite = deleteTeamInvite
    self.fetchAdmins = fetchAdmins
    self.fetchEmailSettingsForUserId = fetchEmailSettingsForUserId
    self.fetchEnterpriseAccountForDomain = fetchEnterpriseAccountForDomain
    self.fetchEnterpriseAccountForSubscription = fetchEnterpriseAccountForSubscription
    self.fetchEnterpriseEmails = fetchEnterpriseEmails
    self.fetchEpisodeCredits = fetchEpisodeCredits
    self.fetchFreeEpisodeUsers = fetchFreeEpisodeUsers
    self.fetchSubscriptionById = fetchSubscriptionById
    self.fetchSubscriptionByOwnerId = fetchSubscriptionByOwnerId
    self.fetchSubscriptionTeammatesByOwnerId = fetchSubscriptionTeammatesByOwnerId
    self.fetchTeamInvite = fetchTeamInvite
    self.fetchTeamInvites = fetchTeamInvites
    self.fetchUserByGitHub = fetchUserByGitHub
    self.fetchUserById = fetchUserById
    self.fetchUsersSubscribedToNewsletter = fetchUsersSubscribedToNewsletter
    self.fetchUsersToWelcome = fetchUsersToWelcome
    self.incrementEpisodeCredits = incrementEpisodeCredits
    self.insertTeamInvite = insertTeamInvite
    self.migrate = migrate
    self.redeemEpisodeCredit = redeemEpisodeCredit
    self.registerUser = registerUser
    self.removeTeammateUserIdFromSubscriptionId = removeTeammateUserIdFromSubscriptionId
    self.sawUser = sawUser
    self.updateStripeSubscription = updateStripeSubscription
    self.updateUser = updateUser
    self.upsertUser = upsertUser
  }
}
