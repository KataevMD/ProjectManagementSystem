namespace ProjectManagementSystem.Models
{
    public static class FileSaver
    {
        public static async void SaveFile(IWebHostEnvironment web, IFormFileCollection uploaderFile, string TitleProject)
        {
            string pathDirectoryProject = web.WebRootPath + "/DownloadFiles/" + TitleProject;

            if (!Directory.Exists(pathDirectoryProject))
            {
                Directory.CreateDirectory(pathDirectoryProject);
            }

            foreach (var file in uploaderFile)
            {
                using (var fileStream = new FileStream(pathDirectoryProject + "/" + file.FileName, FileMode.Create))
                {
                    await file.CopyToAsync(fileStream);
                }
            }

        }
    }
}
