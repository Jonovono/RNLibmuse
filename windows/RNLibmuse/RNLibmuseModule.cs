using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Com.Reactlibrary.RNLibmuse
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNLibmuseModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNLibmuseModule"/>.
        /// </summary>
        internal RNLibmuseModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNLibmuse";
            }
        }
    }
}
