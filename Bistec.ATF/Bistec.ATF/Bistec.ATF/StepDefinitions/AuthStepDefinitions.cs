using Bistec.ATF.APIs;
using Bistec.ATF.Fixture;
using System;
using System.Net;
using TechTalk.SpecFlow;

namespace Bistec.ATF.StepDefinitions
{
    [Binding]
    public class AuthStepDefinitions : RefitFixture<IAuthApi>
    {
        private readonly ScenarioContext context;
        private readonly SettingsFixture settings;

        

        public AuthStepDefinitions(ScenarioContext context, SettingsFixture settings)
        {
            this.context = context;
            this.settings = settings;
        }
        [Given(@"The User is abc(.*)")]
        public void GivenTheUserIsAbc(string username) => context.Add("USERNAME", username);

        [Given(@"The Password is pass(.*)")]
        public void GivenThePasswordIsPass(string password) => context.Add("PASSWORD", password);

        public ScenarioContext GetContext() => context;

        private object GetRestClient(string baseAddress) => throw new NotImplementedException();

        [Then(@"The Responses status code should be (.*)")]
        public void ThenTheResponsesStatusCodeShouldBe(int status)
        {
            var statusCode = (int)context.Get<System.Net.HttpStatusCode>("STATUS_CODE");
            statusCode. Should().Be(status);
        }
    }
}
