
with AWS.Config;
with AWS.Response;
with AWS.Services.Dispatchers.URI;
with AWS.Status;

package Main.Dispatchers is

   use AWS;

   procedure Initialize (Web_Config : in Config.Object);
   --  Initialize state in this package depending on the HTTP configuration.
   --  For example it sets the web root for all dispatchers. All resources
   --  (templates, images, CSS file...) will be searched under this root
   --  directory.


   -- page dispatcher (default)
   type Default is new Services.Dispatchers.URI.Handler with private;
   --  Handle everything not covered by the other dispatchers (CSS, Image)

   overriding function Dispatch
     (Dispatcher : in Default;
      Request    : in Status.Data) return Response.Data;


   -- css
   type CSS is new Services.Dispatchers.URI.Handler with private;

   overriding function Dispatch
     (Dispatcher : in CSS;
      Request    : in Status.Data) return Response.Data;

   -- images
   type Image is new Services.Dispatchers.URI.Handler with private;

   overriding function Dispatch
     (Dispatcher : in Image;
      Request    : in Status.Data) return Response.Data;

   -- js
   type Js is new Services.Dispatchers.URI.Handler with private;

   overriding function Dispatch(Dispatcher : in Js;
                                Request    : in Status.Data) return Response.Data;

private

   type Default is new Services.Dispatchers.URI.Handler with null record;

   type CSS is new  Services.Dispatchers.URI.Handler with null record;

   type Image is new  Services.Dispatchers.URI.Handler with null record;

   type Js is new Services.Dispatchers.URI.Handler with null record;

end Main.Dispatchers;
