namespace Application.Helpers
{
    public static class UpdateHelper
    {
        public static bool CheckNull(string parameter)
        {
            if ( !string.IsNullOrEmpty(parameter) )
                return true;
            return false;
        }
    }
}
