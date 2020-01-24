using System.Collections.Generic;
using Xamarin.Forms;
using Microsoft.AppCenter;
using Microsoft.AppCenter.Analytics;
using Microsoft.AppCenter.Crashes;

namespace sampleAppXamarin
{
    public partial class App : Application
    {
        public App()
        {
            AppCenter.LogLevel = LogLevel.Verbose;
            AppCenter.Start("ios=faed6376-9b95-4b6f-bd36-ee952fb55f9c;android=63e09256-414a-4f31-ab3b-39918598ac24", typeof(Analytics), typeof(Crashes));
            MainPage = new ButtonPage();
        }
    }
}
