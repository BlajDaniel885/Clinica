USE [Clinica]
GO
/****** Object:  Table [dbo].[Consultatii]    Script Date: 1/23/2024 8:51:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultatii](
	[simptome] [nvarchar](max) NOT NULL,
	[diagnostic] [nvarchar](max) NOT NULL,
	[recomandari] [nvarchar](max) NOT NULL,
	[data_consultatiei] [date] NOT NULL,
	[observatii] [nvarchar](max) NOT NULL,
	[pacientId] [int] NOT NULL,
	[doctorId] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 1/23/2024 8:51:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[specializare] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inter_user_doctor]    Script Date: 1/23/2024 8:51:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inter_user_doctor](
	[doctorId] [int] NOT NULL,
	[userId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inter_user_pacient]    Script Date: 1/23/2024 8:51:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inter_user_pacient](
	[pacientId] [int] NOT NULL,
	[userId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inter_user_rol]    Script Date: 1/23/2024 8:51:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inter_user_rol](
	[rolId] [int] NOT NULL,
	[userId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacienti]    Script Date: 1/23/2024 8:51:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacienti](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Pacienti] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programare]    Script Date: 1/23/2024 8:51:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programare](
	[data_programarii] [date] NOT NULL,
	[pacientId] [int] NOT NULL,
	[doctorId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 1/23/2024 8:51:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rol] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Useri]    Script Date: 1/23/2024 8:51:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Useri](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[parola] [nvarchar](50) NOT NULL,
	[rolId] [int] NOT NULL,
	[nume] [nvarchar](100) NULL,
	[prenume] [nvarchar](100) NULL,
	[data_nasterii] [date] NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Consultatii]  WITH CHECK ADD  CONSTRAINT [FK_Consultatii_Doctor] FOREIGN KEY([doctorId])
REFERENCES [dbo].[Doctor] ([id])
GO
ALTER TABLE [dbo].[Consultatii] CHECK CONSTRAINT [FK_Consultatii_Doctor]
GO
ALTER TABLE [dbo].[Consultatii]  WITH CHECK ADD  CONSTRAINT [FK_Consultatii_Pacienti] FOREIGN KEY([pacientId])
REFERENCES [dbo].[Pacienti] ([id])
GO
ALTER TABLE [dbo].[Consultatii] CHECK CONSTRAINT [FK_Consultatii_Pacienti]
GO
ALTER TABLE [dbo].[Inter_user_doctor]  WITH CHECK ADD  CONSTRAINT [FK_Inter_user_doctor_Doctor] FOREIGN KEY([doctorId])
REFERENCES [dbo].[Doctor] ([id])
GO
ALTER TABLE [dbo].[Inter_user_doctor] CHECK CONSTRAINT [FK_Inter_user_doctor_Doctor]
GO
ALTER TABLE [dbo].[Inter_user_doctor]  WITH CHECK ADD  CONSTRAINT [FK_Inter_user_doctor_User] FOREIGN KEY([userId])
REFERENCES [dbo].[Useri] ([id])
GO
ALTER TABLE [dbo].[Inter_user_doctor] CHECK CONSTRAINT [FK_Inter_user_doctor_User]
GO
ALTER TABLE [dbo].[Inter_user_rol]  WITH CHECK ADD  CONSTRAINT [FK_Inter_user_rol_Rol] FOREIGN KEY([rolId])
REFERENCES [dbo].[Rol] ([id])
GO
ALTER TABLE [dbo].[Inter_user_rol] CHECK CONSTRAINT [FK_Inter_user_rol_Rol]
GO
ALTER TABLE [dbo].[Inter_user_rol]  WITH CHECK ADD  CONSTRAINT [FK_Inter_user_rol_User] FOREIGN KEY([userId])
REFERENCES [dbo].[Useri] ([id])
GO
ALTER TABLE [dbo].[Inter_user_rol] CHECK CONSTRAINT [FK_Inter_user_rol_User]
GO
ALTER TABLE [dbo].[Programare]  WITH CHECK ADD  CONSTRAINT [FK_Programare_Doctor] FOREIGN KEY([doctorId])
REFERENCES [dbo].[Doctor] ([id])
GO
ALTER TABLE [dbo].[Programare] CHECK CONSTRAINT [FK_Programare_Doctor]
GO
ALTER TABLE [dbo].[Programare]  WITH CHECK ADD  CONSTRAINT [FK_Programare_Pacienti] FOREIGN KEY([pacientId])
REFERENCES [dbo].[Pacienti] ([id])
GO
ALTER TABLE [dbo].[Programare] CHECK CONSTRAINT [FK_Programare_Pacienti]
GO
